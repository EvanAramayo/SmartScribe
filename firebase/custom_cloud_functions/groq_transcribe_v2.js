const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
// Use v2 HTTPS onRequest
const { onRequest } = require("firebase-functions/v2/https");
const admin = require("firebase-admin");
const axios = require("axios");
const FormData = require("form-data");

// Cloud Function with CORS + region + resources

exports.groqTranscribeV2 = onRequest(
  {
    cors: [/flutterflow\.app$/, /flutterflow\.io$/],
    region: "us-central1",
    timeoutSeconds: 300,
    memory: "1GiB", // v2 format
  },
  async (req, res) => {
    // --- Method check ---
    if (req.method !== "POST") {
      res.status(405).send("Method Not Allowed. Only POST is supported.");
      return;
    }

    // --- Input validation ---
    const audioUrl = req.body.audioUrl;
    if (!audioUrl || typeof audioUrl !== "string") {
      res
        .status(400)
        .send("audioUrl (string) is required in the request body.");
      return;
    }

    // --- Config validation ---
    const groqApiKey = process.env.GROQ_API_KEY;
    if (!groqApiKey) {
      res.status(503).send("Groq API key is not configured on the server.");
      return;
    }

    try {
      console.log("Downloading audio from:", audioUrl);

      const audioFileResponse = await axios.get(audioUrl, {
        responseType: "arraybuffer",
        timeout: 60000,
      });

      console.log(
        "Audio file downloaded, size:",
        audioFileResponse.data.length,
        "bytes",
      );

      const formData = new FormData();
      formData.append("file", Buffer.from(audioFileResponse.data), {
        filename: "audio.mp3",
        contentType: audioFileResponse.headers["content-type"] || "audio/mpeg",
      });
      formData.append("model", "whisper-large-v3-turbo");
      formData.append("response_format", "json");

      const groqUrl = "https://api.groq.com/openai/v1/audio/transcriptions";

      console.log("Sending audio to Groq...");

      const response = await axios.post(groqUrl, formData, {
        headers: {
          ...formData.getHeaders(),
          Authorization: `Bearer ${groqApiKey}`,
        },
        maxContentLength: Infinity,
        maxBodyLength: Infinity,
        timeout: 120000,
      });

      console.log("Groq response received:", response.status);

      res.status(200).json({
        success: true,
        text: response.data.text || "",
        duration: response.data.duration || null,
      });
    } catch (err) {
      console.error("Error in audioTranscribeUrl2:", err.message);

      const status = err.response?.status || 500;
      const errorMessage = err.response?.data
        ? JSON.stringify(err.response.data)
        : err.message || "Unknown error calling Groq API";

      res.status(status).json({
        success: false,
        error: errorMessage,
      });
    }
  },
);

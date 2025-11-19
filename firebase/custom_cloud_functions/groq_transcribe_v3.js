const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
// functions/index.js

const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");
const FormData = require("form-data");

// FlutterFlow-managed backend usually initializes admin for you.
// Follow their note: do NOT call admin.initializeApp() here.

exports.groqTranscribeV3 = functions
  .region("us-central1")
  .runWith({
    timeoutSeconds: 300,
    memory: "1GB",
  })
  .https.onCall(async (data, context) => {
    // --- Auth check (since FF suggested requiring auth) ---
    if (!context.auth || !context.auth.uid) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "User must be logged in to call this function.",
      );
    }

    // --- Input validation ---
    const audioUrl = data && data.audioUrl;
    if (!audioUrl || typeof audioUrl !== "string") {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "audioUrl (string) is required in the request data.",
      );
    }

    // --- Config validation ---
    const groqApiKey = process.env.GROQ_API_KEY;
    if (!groqApiKey) {
      // failed-precondition = server is misconfigured
      throw new functions.https.HttpsError(
        "failed-precondition",
        "Groq API key is not configured on the server.",
      );
    }

    try {
      console.log("Downloading audio from:", audioUrl);

      const audioFileResponse = await axios.get(audioUrl, {
        responseType: "arraybuffer",
        timeout: 60000, // 60 seconds for download
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
        timeout: 120000, // 120 seconds for transcription
      });

      console.log("Groq response received:", response.status);

      // For callable functions, you RETURN a value instead of res.json(...)
      return {
        success: true,
        text: response.data.text || "",
        duration: response.data.duration || null,
      };
    } catch (err) {
      console.error("Error in groqTranscribe:", err.message);

      const status = err.response?.status;
      const errorMessage = err.response?.data
        ? JSON.stringify(err.response.data)
        : err.message || "Unknown error calling Groq API";

      // Map HTTP-style failure to an HttpsError
      throw new functions.https.HttpsError(
        "internal",
        `Groq transcription failed${
          status ? ` (HTTP ${status})` : ""
        }: ${errorMessage}`,
      );
    }
  });

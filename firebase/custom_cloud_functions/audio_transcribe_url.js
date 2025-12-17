const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");
const FormData = require("form-data");

{
  cors: [/flutterflow.app$/, /flutterflow.io$/];
}

// Initialize admin if not already done
if (!admin.apps.length) {
  admin.initializeApp();
}

exports.audioTranscribeUrl = functions
  .region("us-central1")
  .runWith({
    timeoutSeconds: 300,
    memory: "1GB",
  })
  .https.onCall(async (data, context) => {
    // Security: require auth
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "User must be logged in to transcribe audio.",
      );
    }

    // Get audioUrl from data
    const audioUrl = data.audioUrl;
    if (!audioUrl || typeof audioUrl !== "string") {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "audioUrl (string) is required.",
      );
    }

    // Get Groq API key from environment
    const groqApiKey = process.env.GROQ_API_KEY;
    if (!groqApiKey) {
      throw new functions.https.HttpsError(
        "failed-precondition",
        "Groq API key is not configured on the server.",
      );
    }

    try {
      console.log("Downloading audio from:", audioUrl);

      // Download the audio file
      const audioFileResponse = await axios.get(audioUrl, {
        responseType: "stream",
        timeout: 60000, // 60 second timeout
      });

      // Build multipart form data
      const formData = new FormData();

      formData.append("file", audioFileResponse.data, {
        filename: "audio.mp3",
        contentType: "audio/mpeg",
      });
      formData.append("model", "whisper-large-v3-turbo");
      formData.append("response_format", "json");

      const groqUrl = "https://api.groq.com/openai/v1/audio/transcriptions";

      console.log("Sending audio to Groq...");

      // Send to Groq
      const response = await axios.post(groqUrl, formData, {
        headers: {
          ...formData.getHeaders(),
          Authorization: `Bearer ${groqApiKey}`,
        },
        maxContentLength: Infinity,
        maxBodyLength: Infinity,
        timeout: 60000,
      });

      console.log("Groq response received:", response.status);

      // Return the transcription
      return {
        success: true,
        text: response.data.text || "",
      };
    } catch (err) {
      console.error(
        "Error in audioTranscribeUrl:",
        err?.response?.data || err.message,
      );

      const errorMessage = err.response?.data
        ? JSON.stringify(err.response.data)
        : err.message || "Unknown error calling Groq API";

      throw new functions.https.HttpsError("internal", errorMessage);
    }
  });

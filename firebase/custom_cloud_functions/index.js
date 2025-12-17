const admin = require("firebase-admin/app");
admin.initializeApp();

const audioTranscribeUrl = require("./audio_transcribe_url.js");
exports.audioTranscribeUrl = audioTranscribeUrl.audioTranscribeUrl;
const groqTranscribeV3 = require("./groq_transcribe_v3.js");
exports.groqTranscribeV3 = groqTranscribeV3.groqTranscribeV3;

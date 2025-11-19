const admin = require("firebase-admin/app");
admin.initializeApp();

const groqTranscribeV2 = require("./groq_transcribe_v2.js");
exports.groqTranscribeV2 = groqTranscribeV2.groqTranscribeV2;
const groqTranscribeV3 = require("./groq_transcribe_v3.js");
exports.groqTranscribeV3 = groqTranscribeV3.groqTranscribeV3;

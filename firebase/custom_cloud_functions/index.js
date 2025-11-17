const admin = require("firebase-admin/app");
admin.initializeApp();

const processAudioFile2 = require("./process_audio_file2.js");
exports.processAudioFile2 = processAudioFile2.processAudioFile2;

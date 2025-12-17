import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'insert_audio_widget.dart' show InsertAudioWidget;
import 'package:flutter/material.dart';

class InsertAudioModel extends FlutterFlowModel<InsertAudioWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadedFile = false;
  FFUploadedFile uploadedLocalFile_uploadedFile =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Backend Call - API (groqTranscription)] action in IconButton widget.
  ApiCallResponse? transcriptResult;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  TranscriptRecord? getCreatedTranscriptDetails;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

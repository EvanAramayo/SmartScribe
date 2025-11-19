import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'insert_audio_page_widget.dart' show InsertAudioPageWidget;
import 'package:flutter/material.dart';

class InsertAudioPageModel extends FlutterFlowModel<InsertAudioPageWidget> {
  ///  Local state fields for this page.

  String? pickedFile;

  FFUploadedFile? insertFile;

  String? docID;

  DateTime? pageRecord;

  bool hasEntry = false;

  DocumentReference? currentEntryRef;

  bool isRecording = true;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataMxh = false;
  FFUploadedFile uploadedLocalFile_uploadDataMxh =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataMxh = '';

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

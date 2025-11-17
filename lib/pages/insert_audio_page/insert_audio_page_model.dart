import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'insert_audio_page_widget.dart' show InsertAudioPageWidget;
import 'package:flutter/material.dart';

class InsertAudioPageModel extends FlutterFlowModel<InsertAudioPageWidget> {
  ///  Local state fields for this page.

  String? pickedFile;

  FFUploadedFile? insertFile;

  String? docID;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData973 = false;
  FFUploadedFile uploadedLocalFile_uploadData973 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData973 = '';

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

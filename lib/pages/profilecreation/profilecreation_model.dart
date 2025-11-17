import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profilecreation_widget.dart' show ProfilecreationWidget;
import 'package:flutter/material.dart';

class ProfilecreationModel extends FlutterFlowModel<ProfilecreationWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? uploadFile;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData12e = false;
  FFUploadedFile uploadedLocalFile_uploadData12e =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData12e = '';

  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  // State field(s) for Grad_date widget.
  FocusNode? gradDateFocusNode;
  TextEditingController? gradDateTextController;
  String? Function(BuildContext, String?)? gradDateTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    gradDateFocusNode?.dispose();
    gradDateTextController?.dispose();
  }
}

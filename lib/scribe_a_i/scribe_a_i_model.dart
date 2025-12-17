import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'scribe_a_i_widget.dart' show ScribeAIWidget;
import 'package:flutter/material.dart';

class ScribeAIModel extends FlutterFlowModel<ScribeAIWidget> {
  ///  Local state fields for this page.

  DocumentReference? transcriptRef;

  String? aiAnswer;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (RegularAI)] action in Button widget.
  ApiCallResponse? apiResult3ec;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

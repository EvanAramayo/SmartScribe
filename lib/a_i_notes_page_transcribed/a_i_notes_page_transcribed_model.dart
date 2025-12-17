import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a_i_notes_page_transcribed_widget.dart'
    show AINotesPageTranscribedWidget;
import 'package:flutter/material.dart';

class AINotesPageTranscribedModel
    extends FlutterFlowModel<AINotesPageTranscribedWidget> {
  ///  Local state fields for this page.

  String? summarizedNotes;

  String? promptInput;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (GeminiAiIntegration)] action in Stack widget.
  ApiCallResponse? apiResultm20;
  // Stores action output result for [Backend Call - API (GeminiAiIntegration)] action in IconButton widget.
  ApiCallResponse? apiResultqzc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

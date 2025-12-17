import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool value) {
    _darkMode = value;
  }

  String _groqKey = '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';
  String get groqKey => _groqKey;
  set groqKey(String value) {
    _groqKey = value;
  }

  String _convertedTranscript = '';
  String get convertedTranscript => _convertedTranscript;
  set convertedTranscript(String value) {
    _convertedTranscript = value;
  }

  /// Used to keep track of input audio file to keep track of multiple
  /// recordings
  DateTime? _trancriptTimeCreated;
  DateTime? get trancriptTimeCreated => _trancriptTimeCreated;
  set trancriptTimeCreated(DateTime? value) {
    _trancriptTimeCreated = value;
  }
}

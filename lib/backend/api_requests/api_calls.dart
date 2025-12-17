import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GroqTranscriptionCall {
  static Future<ApiCallResponse> call({
    String? groqKey = '',
    String? model = 'whisper-large-v3-turbo',
    String? responseFormat = 'json',
    FFUploadedFile? file,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'groqTranscription',
      apiUrl: 'https://api.groq.com/openai/v1/audio/transcriptions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {
        'file': file,
        'model': "whisper-large-v3-turbo",
        'response_format': "json",
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GeminiAiIntegrationCall {
  static Future<ApiCallResponse> call({
    String? apiKey = 'AIzaSyB2tJYYqRFRifCM7F7yABPCXoWOluEwP34',
    String? prompt = '',
    String? transcript = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "You are a notes formatter. Produce clear, structured study notes.\\\\n\\\\nTranscript:\\\\n${escapeStringForJson(transcript)}\\\\n\\\\nUser instruction:\\\\n\\"${escapeStringForJson(prompt)}\\""
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GeminiAiIntegration',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {
        'X-goog-api-key': 'AIzaSyB2tJYYqRFRifCM7F7yABPCXoWOluEwP34',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic generatedContent(dynamic response) => getJsonField(
        response,
        r'''$.candidates[:].content''',
      );
}

class RegularAICall {
  static Future<ApiCallResponse> call({
    String? apiKey = 'AIzaSyB2tJYYqRFRifCM7F7yABPCXoWOluEwP34',
    String? prompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "${escapeStringForJson(prompt)}"
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RegularAI',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {
        'X-goog-api-key': 'AIzaSyB2tJYYqRFRifCM7F7yABPCXoWOluEwP34',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}

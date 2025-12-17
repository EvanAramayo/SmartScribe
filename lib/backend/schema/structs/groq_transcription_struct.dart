// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroqTranscriptionStruct extends FFFirebaseStruct {
  GroqTranscriptionStruct({
    String? text,
    XGroqStruct? xGroq,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _xGroq = xGroq,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "x_groq" field.
  XGroqStruct? _xGroq;
  XGroqStruct get xGroq => _xGroq ?? XGroqStruct();
  set xGroq(XGroqStruct? val) => _xGroq = val;

  void updateXGroq(Function(XGroqStruct) updateFn) {
    updateFn(_xGroq ??= XGroqStruct());
  }

  bool hasXGroq() => _xGroq != null;

  static GroqTranscriptionStruct fromMap(Map<String, dynamic> data) =>
      GroqTranscriptionStruct(
        text: data['text'] as String?,
        xGroq: data['x_groq'] is XGroqStruct
            ? data['x_groq']
            : XGroqStruct.maybeFromMap(data['x_groq']),
      );

  static GroqTranscriptionStruct? maybeFromMap(dynamic data) => data is Map
      ? GroqTranscriptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'x_groq': _xGroq?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'x_groq': serializeParam(
          _xGroq,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static GroqTranscriptionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GroqTranscriptionStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        xGroq: deserializeStructParam(
          data['x_groq'],
          ParamType.DataStruct,
          false,
          structBuilder: XGroqStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GroqTranscriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GroqTranscriptionStruct &&
        text == other.text &&
        xGroq == other.xGroq;
  }

  @override
  int get hashCode => const ListEquality().hash([text, xGroq]);
}

GroqTranscriptionStruct createGroqTranscriptionStruct({
  String? text,
  XGroqStruct? xGroq,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GroqTranscriptionStruct(
      text: text,
      xGroq: xGroq ?? (clearUnsetFields ? XGroqStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GroqTranscriptionStruct? updateGroqTranscriptionStruct(
  GroqTranscriptionStruct? groqTranscription, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    groqTranscription
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGroqTranscriptionStructData(
  Map<String, dynamic> firestoreData,
  GroqTranscriptionStruct? groqTranscription,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (groqTranscription == null) {
    return;
  }
  if (groqTranscription.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && groqTranscription.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final groqTranscriptionData =
      getGroqTranscriptionFirestoreData(groqTranscription, forFieldValue);
  final nestedData =
      groqTranscriptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = groqTranscription.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGroqTranscriptionFirestoreData(
  GroqTranscriptionStruct? groqTranscription, [
  bool forFieldValue = false,
]) {
  if (groqTranscription == null) {
    return {};
  }
  final firestoreData = mapToFirestore(groqTranscription.toMap());

  // Handle nested data for "x_groq" field.
  addXGroqStructData(
    firestoreData,
    groqTranscription.hasXGroq() ? groqTranscription.xGroq : null,
    'x_groq',
    forFieldValue,
  );

  // Add any Firestore field values
  groqTranscription.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGroqTranscriptionListFirestoreData(
  List<GroqTranscriptionStruct>? groqTranscriptions,
) =>
    groqTranscriptions
        ?.map((e) => getGroqTranscriptionFirestoreData(e, true))
        .toList() ??
    [];

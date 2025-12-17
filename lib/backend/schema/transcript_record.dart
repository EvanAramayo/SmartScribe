import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// where user can access past transcripts
class TranscriptRecord extends FirestoreRecord {
  TranscriptRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "audioPath" field.
  String? _audioPath;
  String get audioPath => _audioPath ?? '';
  bool hasAudioPath() => _audioPath != null;

  // "audioDuration" field.
  double? _audioDuration;
  double get audioDuration => _audioDuration ?? 0.0;
  bool hasAudioDuration() => _audioDuration != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as String?;
    _text = snapshotData['text'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _audioPath = snapshotData['audioPath'] as String?;
    _audioDuration = castToType<double>(snapshotData['audioDuration']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transcript');

  static Stream<TranscriptRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TranscriptRecord.fromSnapshot(s));

  static Future<TranscriptRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TranscriptRecord.fromSnapshot(s));

  static TranscriptRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TranscriptRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TranscriptRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TranscriptRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TranscriptRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TranscriptRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTranscriptRecordData({
  String? userID,
  String? text,
  DateTime? createdAt,
  String? audioPath,
  double? audioDuration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'text': text,
      'createdAt': createdAt,
      'audioPath': audioPath,
      'audioDuration': audioDuration,
    }.withoutNulls,
  );

  return firestoreData;
}

class TranscriptRecordDocumentEquality implements Equality<TranscriptRecord> {
  const TranscriptRecordDocumentEquality();

  @override
  bool equals(TranscriptRecord? e1, TranscriptRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.text == e2?.text &&
        e1?.createdAt == e2?.createdAt &&
        e1?.audioPath == e2?.audioPath &&
        e1?.audioDuration == e2?.audioDuration;
  }

  @override
  int hash(TranscriptRecord? e) => const ListEquality()
      .hash([e?.userID, e?.text, e?.createdAt, e?.audioPath, e?.audioDuration]);

  @override
  bool isValidKey(Object? o) => o is TranscriptRecord;
}

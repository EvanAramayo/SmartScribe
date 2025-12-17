import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AudioNotesRecord extends FirestoreRecord {
  AudioNotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "storagePath" field.
  String? _storagePath;
  String get storagePath => _storagePath ?? '';
  bool hasStoragePath() => _storagePath != null;

  // "transcript" field.
  String? _transcript;
  String get transcript => _transcript ?? '';
  bool hasTranscript() => _transcript != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "bullets" field.
  List<String>? _bullets;
  List<String> get bullets => _bullets ?? const [];
  bool hasBullets() => _bullets != null;

  // "actionItems" field.
  List<String>? _actionItems;
  List<String> get actionItems => _actionItems ?? const [];
  bool hasActionItems() => _actionItems != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "start_At" field.
  DateTime? _startAt;
  DateTime? get startAt => _startAt;
  bool hasStartAt() => _startAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userID = snapshotData['userID'] as String?;
    _status = snapshotData['status'] as String?;
    _storagePath = snapshotData['storagePath'] as String?;
    _transcript = snapshotData['transcript'] as String?;
    _summary = snapshotData['summary'] as String?;
    _bullets = getDataList(snapshotData['bullets']);
    _actionItems = getDataList(snapshotData['actionItems']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _audio = snapshotData['audio'] as String?;
    _endTime = snapshotData['end_time'] as DateTime?;
    _startAt = snapshotData['start_At'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('audioNotes')
          : FirebaseFirestore.instance.collectionGroup('audioNotes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('audioNotes').doc(id);

  static Stream<AudioNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AudioNotesRecord.fromSnapshot(s));

  static Future<AudioNotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AudioNotesRecord.fromSnapshot(s));

  static AudioNotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AudioNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AudioNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AudioNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AudioNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AudioNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAudioNotesRecordData({
  String? userID,
  String? status,
  String? storagePath,
  String? transcript,
  String? summary,
  DateTime? createdAt,
  String? audio,
  DateTime? endTime,
  DateTime? startAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'status': status,
      'storagePath': storagePath,
      'transcript': transcript,
      'summary': summary,
      'createdAt': createdAt,
      'audio': audio,
      'end_time': endTime,
      'start_At': startAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class AudioNotesRecordDocumentEquality implements Equality<AudioNotesRecord> {
  const AudioNotesRecordDocumentEquality();

  @override
  bool equals(AudioNotesRecord? e1, AudioNotesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userID == e2?.userID &&
        e1?.status == e2?.status &&
        e1?.storagePath == e2?.storagePath &&
        e1?.transcript == e2?.transcript &&
        e1?.summary == e2?.summary &&
        listEquality.equals(e1?.bullets, e2?.bullets) &&
        listEquality.equals(e1?.actionItems, e2?.actionItems) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.audio == e2?.audio &&
        e1?.endTime == e2?.endTime &&
        e1?.startAt == e2?.startAt;
  }

  @override
  int hash(AudioNotesRecord? e) => const ListEquality().hash([
        e?.userID,
        e?.status,
        e?.storagePath,
        e?.transcript,
        e?.summary,
        e?.bullets,
        e?.actionItems,
        e?.createdAt,
        e?.audio,
        e?.endTime,
        e?.startAt
      ]);

  @override
  bool isValidKey(Object? o) => o is AudioNotesRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "graduation_date" field.
  String? _graduationDate;
  String get graduationDate => _graduationDate ?? '';
  bool hasGraduationDate() => _graduationDate != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "NpsRating" field.
  int? _npsRating;
  int get npsRating => _npsRating ?? 0;
  bool hasNpsRating() => _npsRating != null;

  // "timesloggedin" field.
  int? _timesloggedin;
  int get timesloggedin => _timesloggedin ?? 0;
  bool hasTimesloggedin() => _timesloggedin != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "storagePath" field.
  String? _storagePath;
  String get storagePath => _storagePath ?? '';
  bool hasStoragePath() => _storagePath != null;

  // "transcription" field.
  String? _transcription;
  String get transcription => _transcription ?? '';
  bool hasTranscription() => _transcription != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _graduationDate = snapshotData['graduation_date'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _npsRating = castToType<int>(snapshotData['NpsRating']);
    _timesloggedin = castToType<int>(snapshotData['timesloggedin']);
    _status = snapshotData['status'] as String?;
    _storagePath = snapshotData['storagePath'] as String?;
    _transcription = snapshotData['transcription'] as String?;
    _summary = snapshotData['summary'] as String?;
    _endTime = snapshotData['end_time'] as DateTime?;
    _audio = snapshotData['audio'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? graduationDate,
  String? displayName,
  int? npsRating,
  int? timesloggedin,
  String? status,
  String? storagePath,
  String? transcription,
  String? summary,
  DateTime? endTime,
  String? audio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'graduation_date': graduationDate,
      'display_name': displayName,
      'NpsRating': npsRating,
      'timesloggedin': timesloggedin,
      'status': status,
      'storagePath': storagePath,
      'transcription': transcription,
      'summary': summary,
      'end_time': endTime,
      'audio': audio,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.graduationDate == e2?.graduationDate &&
        e1?.displayName == e2?.displayName &&
        e1?.npsRating == e2?.npsRating &&
        e1?.timesloggedin == e2?.timesloggedin &&
        e1?.status == e2?.status &&
        e1?.storagePath == e2?.storagePath &&
        e1?.transcription == e2?.transcription &&
        e1?.summary == e2?.summary &&
        e1?.endTime == e2?.endTime &&
        e1?.audio == e2?.audio;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.graduationDate,
        e?.displayName,
        e?.npsRating,
        e?.timesloggedin,
        e?.status,
        e?.storagePath,
        e?.transcription,
        e?.summary,
        e?.endTime,
        e?.audio
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

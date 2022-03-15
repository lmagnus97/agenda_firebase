import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esportesapp/app/models/enums/status_schedule.dart';

class ScheduleModel {
  late Timestamp startTime;
  late Timestamp endTime;
  late DocumentReference reference;
  late StatusSchedule status;
  String? nameClient;
  String? phoneClient;
  Timestamp? markedAt;

  ScheduleModel(
      {required this.reference,
      required this.startTime,
      required this.endTime,
      required this.status,
      this.nameClient,
      this.phoneClient,
      this.markedAt});

  factory ScheduleModel.fromDocument(DocumentSnapshot doc) {
    return ScheduleModel(
      reference: doc.reference,
      startTime: doc.get('startTime'),
      endTime: doc.get('endTime'),
      nameClient: doc.get('nameClient'),
      phoneClient: doc.get('phoneClient'),
      status: StatusScheduleFunctions.toEnum(doc.get('status')),
    );
  }

  Map<String, dynamic> toJson() => {
        'nameClient': nameClient,
        'phoneClient': phoneClient,
        'markedAt': markedAt,
        'status': status.name
      };

  @override
  String toString() {
    return 'ScheduleModel{startTime: $startTime, endTime: $endTime, reference: $reference, status: $status}';
  }
}

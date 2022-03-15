import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esportesapp/app/models/schedule_model.dart';
import 'package:esportesapp/app/repositories/schedule_repository_interface.dart';

class ScheduleFirebaseRepository implements IScheduleRepository {
  final FirebaseFirestore firestore;

  ScheduleFirebaseRepository(this.firestore);

  @override
  Stream<List<ScheduleModel>> findByDay(DateTime date) {
    return firestore
        .collection('schedules')
        .where('startTime',
            isGreaterThanOrEqualTo:
                DateTime(date.year, date.month, date.day, 00, 00, 00),
            isLessThanOrEqualTo:
                DateTime(date.year, date.month, date.day, 23, 59, 59))
        .orderBy('startTime')
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return ScheduleModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future save(ScheduleModel model) async {
    model.reference.update(model.toJson());
  }
}

import 'package:esportesapp/app/models/schedule_model.dart';

abstract class IScheduleRepository {
  Stream<List<ScheduleModel>> findByDay(DateTime date);

  Future save(ScheduleModel scheduleModel);
}

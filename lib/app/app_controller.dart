import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esportesapp/app/models/enums/status_schedule.dart';
import 'package:esportesapp/app/models/schedule_model.dart';
import 'package:esportesapp/app/repositories/schedule_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final IScheduleRepository repository;
  DateTime dateTime = DateTime.now();

  @observable
  ObservableStream<List<ScheduleModel>>? scheduleList;

  _AppControllerBase(IScheduleRepository this.repository) {
    getList();
  }

  @action
  getList() {
    scheduleList = repository.findByDay(dateTime).asObservable();
  }

  @action
  changeDay(int numberOfDays) {
    dateTime = dateTime.add(Duration(days: numberOfDays));
    getList();
  }

  @action
  resetDay() {
    dateTime = DateTime.now();
    getList();
  }

  Stream<List<ScheduleModel>> findByDay(DateTime dateTime) {
    return repository.findByDay(dateTime);
  }

  Future save(ScheduleModel model) {
    model.status = StatusSchedule.MARKED;
    model.markedAt = Timestamp.now();
    return repository.save(model);
  }

  Future remove(ScheduleModel model) {
    model.status = StatusSchedule.FREE;
    model.markedAt = null;
    model.nameClient = null;
    model.phoneClient = null;
    return repository.save(model);
  }
}

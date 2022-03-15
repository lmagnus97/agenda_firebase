// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$scheduleListAtom = Atom(name: '_AppControllerBase.scheduleList');

  @override
  ObservableStream<List<ScheduleModel>>? get scheduleList {
    _$scheduleListAtom.reportRead();
    return super.scheduleList;
  }

  @override
  set scheduleList(ObservableStream<List<ScheduleModel>>? value) {
    _$scheduleListAtom.reportWrite(value, super.scheduleList, () {
      super.scheduleList = value;
    });
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDay(int numberOfDays) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.changeDay');
    try {
      return super.changeDay(numberOfDays);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetDay() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.resetDay');
    try {
      return super.resetDay();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scheduleList: ${scheduleList}
    ''';
  }
}

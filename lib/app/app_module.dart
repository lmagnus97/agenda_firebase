import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esportesapp/app/app_controller.dart';
import 'package:esportesapp/app/app_widget.dart';
import 'package:esportesapp/app/pages/home_page.dart';
import 'package:esportesapp/app/repositories/schedule_firebase_repository.dart';
import 'package:esportesapp/app/repositories/schedule_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController(i.get())),
        Bind<IScheduleRepository>(
            (i) => ScheduleFirebaseRepository(FirebaseFirestore.instance)),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];

}

import 'package:esportesapp/app/app_controller.dart';
import 'package:esportesapp/app/components/card_component.dart';
import 'package:esportesapp/app/core/constants.dart';
import 'package:esportesapp/app/core/styles.dart';
import 'package:esportesapp/app/core/utils.dart';
import 'package:esportesapp/app/models/enums/status_schedule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../components/empty_component.dart';
import '../components/error_component.dart';
import '../components/loader_component.dart';
import '../models/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, AppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.backgroundColor(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Agenda de horários"),
          actions: [
            IconButton(
                onPressed: () => controller.resetDay(),
                icon: Icon(Icons.date_range))
          ],
        ),
        body: Observer(
          builder: (_) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () => controller.changeDay(-1),
                          icon: const Icon(
                            Icons.chevron_left_outlined,
                            size: 48,
                            color: Colors.black87,
                          )),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              Utils.getFormatedDateTitle(controller.dateTime),
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () => controller.changeDay(1),
                          icon: const Icon(
                            Icons.chevron_right_outlined,
                            size: 48,
                            color: Colors.black87,
                          )),
                    ],
                  ),
                ),
                StreamBuilder<List<ScheduleModel>>(
                  stream: controller.scheduleList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ScheduleModel>> snapshot) {
                    if (snapshot.hasError) {
                      return ErrorComponent(
                          messageError: snapshot.error.toString());
                    }
                    if (!snapshot.hasData) return const LoaderComponent();
                    return snapshot.data!.isNotEmpty
                        ? ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: snapshot.data!.length,
                            padding: const EdgeInsets.only(top: 10),
                            itemBuilder: (BuildContext context, int index) {
                              return _itemSchedule(snapshot.data![index]);
                            },
                          )
                        : EmptyComponent(
                            icon: Icons.list, title: Messages.messageEmpty);
                  },
                ),
              ],
            );
          },
        ));
  }

  Widget _itemSchedule(ScheduleModel scheduleModel) {
    return InkWell(
      onTap: () => _markSchedule(scheduleModel),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: scheduleModel.status == StatusSchedule.FREE
              ? Colors.white
              : Colors.purple,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color(0xfff5f5f5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              Utils.formatToTime(scheduleModel.startTime),
              style: TextStyle(
                  fontSize: 16,
                  color: scheduleModel.status == StatusSchedule.FREE
                      ? Colors.black54
                      : Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              width: 1,
              height: 25,
              color: scheduleModel.status == StatusSchedule.FREE
                  ? Colors.grey
                  : Colors.white,
            ),
            scheduleModel.status == StatusSchedule.FREE
                ? const Text(
                    "Horário livre",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  )
                : Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              scheduleModel.nameClient ?? "---",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              scheduleModel.phoneClient ?? "---",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: () => _dialogCancel(scheduleModel),
                          icon: const Icon(
                            Icons.delete_forever,
                            size: 24,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }

  void _markSchedule(ScheduleModel scheduleModel) {
    if (scheduleModel.status == StatusSchedule.MARKED) {
      return;
    }
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        elevation: 5,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter mystate) {
            return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                    padding: const EdgeInsets.only(top: 15),
                    height: 240,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            spreadRadius: 3,
                            blurRadius: 8,
                            offset: const Offset(3, 5),
                          ),
                        ],
                        color: CupertinoColors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        CardComponent(
                            widget: TextFormField(
                                onChanged: (value) =>
                                    scheduleModel.nameClient = value,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.account_box,
                                    color: Colors.black38,
                                  ),
                                  hintText: "Nome",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value!.trim().length < 3) {
                                    return 'Nome inválido!';
                                  }
                                  return null;
                                })),
                        CardComponent(
                            widget: TextFormField(
                                onChanged: (value) =>
                                    scheduleModel.phoneClient = value,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  MaskTextInputFormatter(
                                      mask: '(##) #####-####')
                                ],
                                decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.phone_android,
                                    color: Colors.black38,
                                  ),
                                  hintText: "Celular",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ))),
                        CardComponent(
                            background: Colors.purple,
                            widget: TextButton(
                              onPressed: () async {
                                controller.save(scheduleModel);
                                Modular.to.pop();
                              },
                              child: const Text(
                                "Agendar horário",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ))
                      ],
                    )));
          });
        });
  }

  _dialogCancel(ScheduleModel scheduleModel) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        animType: AnimType.TOPSLIDE,
        title: 'Aviso',
        btnOkText: "Sim",
        btnCancelText: "Não",
        desc: 'Tem certeza que deseja desmarcar o horário das ' +
            Utils.formatToTime(scheduleModel.startTime) +
            " ?",
        btnCancelOnPress: () {},
        onDissmissCallback: (type) {},
        btnOkOnPress: () {
          controller.remove(scheduleModel);
        }).show();
  }
}

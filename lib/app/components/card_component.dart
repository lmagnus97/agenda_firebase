import 'package:esportesapp/app/core/styles.dart';
import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  Widget widget;
  Color background;

  CardComponent(
      {Key? key, required this.widget, this.background = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
        padding: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
            border: Border.all(
              color: Styles.backgroundColor(),
            ),
            color: background,
            boxShadow: const [
              BoxShadow(
                color: Color(0xfff1f1f1),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: widget);
  }
}

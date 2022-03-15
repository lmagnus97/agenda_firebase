import 'package:esportesapp/app/core/constants.dart';
import 'package:esportesapp/app/core/styles.dart';
import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  String messageError;

  ErrorComponent({Key? key, this.messageError = Messages.messageError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      child: Center(
        child: Text(
          messageError,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Styles.secondaryText()),
        ),
      ),
    );
  }
}

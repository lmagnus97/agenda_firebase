import 'package:esportesapp/app/core/styles.dart';
import 'package:flutter/material.dart';

class EmptyComponent extends StatelessWidget {
  IconData icon;
  String title;

  EmptyComponent({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: Styles.secondaryText(), size: 64),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              title,
              style: TextStyle(color: Styles.primaryText(), fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

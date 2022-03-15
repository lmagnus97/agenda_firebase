import 'package:esportesapp/app/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderComponent extends StatelessWidget {

  const LoaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 15),
      padding: const EdgeInsets.only(left: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: const Center(
        child: SpinKitFadingFour(
          color: Styles.primaryColors,
          size: 52,
        ),
      ),
    );
  }
}

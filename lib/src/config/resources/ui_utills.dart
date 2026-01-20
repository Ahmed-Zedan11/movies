import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiUtills {
  static void showLoading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Center(child: CircularProgressIndicator())],
          ),
        ),
      ),
    );
  }

  static void stopLoading(BuildContext context) {
    Navigator.pop(context);
  }
}

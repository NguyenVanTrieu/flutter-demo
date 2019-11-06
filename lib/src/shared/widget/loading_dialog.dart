import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  static void showLoadingDialog(BuildContext context, {String msg}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => new Dialog(
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new CircularProgressIndicator(),
                  new Text(msg == null ? "Loading ..." : msg),
                ],
              ),
            ));
  }

  static void hideLoadingDialog(BuildContext context){
    Navigator.of(context).pop(LoadingDialog);
  }
}

/// Documentation
///
/// alert_dialog_box library collection.
library alert_dialog_box_v1;

import 'package:flutter/material.dart';

///
/// AlertDialogBox main class..
class AlertDialogBox extends StatelessWidget {
  /// [title] This is the alert dialog title
  final String title;

  /// [message] This is the alert dialog message. It is the same as the content did, but with better naming
  final String message;

  /// [onConfirmPressed] Function to be call on confirm button press.
  final Function()? onConfirmPressed;

  /// [onCancelPressed] Function to be call on cancel button press.
  final Function()? onCancelPressed;

  final Function()? onOkPressed;

  /// [isDismissible] Set this true to have a dismissable alert, the default is Yes/No alert dialog.
  final bool isDismissible;
  final bool isOkButtonAlertDialog;

  AlertDialogBox({
    super.key,
    required this.title,
    required this.message,
    this.onConfirmPressed,
    this.onCancelPressed,
    this.onOkPressed,
    this.isDismissible = false,
    this.isOkButtonAlertDialog = false,
  })  : assert(
          title.isNotEmpty,
          "You must provide a non empty title for the alert dialog",
        ),
        assert(
          message.isNotEmpty,
          "You must provide a non empty message for the alert dialog",
        );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: const EdgeInsets.only(top: 10),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 13),
        ),
      ),
      //insetPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 12),
      actions: [
        if (isOkButtonAlertDialog)
          GestureDetector(
            onTap: onOkPressed,
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Ok",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        if (!isOkButtonAlertDialog)
          GestureDetector(
            onTap: onConfirmPressed,
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Yes",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        if (!isOkButtonAlertDialog)
          GestureDetector(
            onTap: onCancelPressed,
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "No",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}

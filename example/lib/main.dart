import 'dart:developer';
import 'package:alert_dialog_box_v1/alert_dialog_box_v1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alert Dialog Box',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _yesNoAlertDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialogBox(
        title: "Are you liking it?",
        message:
            "Do you think my library is awesome and want have a try?\n\nNote: Fell free to open PR to improve it :)",
        onConfirmPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
          print("do something on confirm");
          log("do something on confirm");
        },
        onCancelPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
          print("do something on confirm");
          log("do something on confirm");
        },
      ),
    );
  }

  void _okAlertDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialogBox(
        isDismissible: true,
        isOkButtonAlertDialog: true,
        title: "This is an dismissable alert!",
        message:
            "Hey, you can only dismiss this alert dialog. And also, don't tap again in that button. You have been alerted!",
        onOkPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
          print("do something on confirm");
          log("do something on confirm");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                onPressed: () => _okAlertDialogBox(context),
                color: Colors.blue,
                child: const Text(
                  "Send a Dismissable Alert",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () => _yesNoAlertDialogBox(context),
                color: Colors.green,
                child: const Text(
                  "Send a Accept/Cancel Alert",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

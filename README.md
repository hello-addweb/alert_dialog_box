<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


# Alert Dialog Box

```alert_dialog_box```  An Alert Dialog Box package is allows developers to easily create and display alert dialogs with custom design. Emerge dialogs are used to display important information or messages to the user and often include a call to action, such as a button to confirm or dismiss the dialog.  ✨


## Installation

Create a new project with the command

```yaml
flutter create MyApp
```

Add

```yaml
alert_dialog_box_v1: ...
```

to your `pubspec.yaml` of your flutter project.
**OR**
run

```yaml
flutter pub add alert_dialog_box_v1
```

in your project's root directory.

In your library add the following import:

```dart
import 'package:alert_dialog_box/alert_dialog_box_v1.dart';
```

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Usage

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert Dialog Box',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
```


## Constructor

#### Basic

| Parameter             | Default | Description                          | Required |
|-----------------------|:--------|:-------------------------------------|:--------:|
| title                 | -       | Alert dialog title.                  |   True   |
| message               | -       | Body message of Alert dialog.        |   True   |
| onConfirmPressed      | -       | On Confirm callback function.        |  false   |
| onCancelPressed       | -       | On Cancel callback function.         |  false   |
| isDismissible         | false   | Set true to have a dismissable alert |  false   |
| isOkButtonAlertDialog | false   | Set true to have a Ok button alert   |  false   |

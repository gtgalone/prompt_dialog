import 'package:flutter/material.dart';

/// The `message` argument is used to title of dialog.
/// The `initialValue` argument is used to initial value of dialog.
/// The `textOK` argument is used to text for 'OK' Button of dialog.
/// The `textCancel` argument is used to text for 'Cancel' Button of dialog.
/// The `autoFocus` argument will auto focus text field form of dialog.
///
/// Returns a [Future<bool>].
Future<String> prompt(
  BuildContext context,
  {
    String message,
    String initialValue,
    String textOK: 'OK',
    String textCancel: 'Cancel',
    bool autoFocus: false,
  }
) {
  String value;
  return showDialog(
    context: context,
    builder: (_) => WillPopScope(
      child: AlertDialog(
        title: (message != null) ? Text(message) : null,
        content: TextFormField(
          autofocus: autoFocus,
          initialValue: initialValue,
          onChanged: (text) => value = text,
        ),
        actions: <Widget>[
          FlatButton(child: Text(textCancel), onPressed: () => Navigator.pop(context, null)),
          FlatButton(child: Text(textOK), onPressed: () => Navigator.pop(context, value)),
        ],
      ),
      onWillPop: () { Navigator.pop(context, false); return; },
    ),
  );
}

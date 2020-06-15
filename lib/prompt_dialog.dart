import 'package:flutter/material.dart';

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
    builder: (_) => AlertDialog(
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
  );
}

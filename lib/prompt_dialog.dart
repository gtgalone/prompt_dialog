import 'package:flutter/material.dart';

/// The `title` argument is used to title of alert dialog.
/// The `textOK` argument is used to text for 'OK' Button of alert dialog.
/// The `textCancel` argument is used to text for 'Cancel' Button of alert dialog.
/// The `initialValue` argument is used to initial value of alert dialog.
/// The `autoFocus` argument will auto focus text field form of alert dialog.
///
/// Returns a [Future<bool>].
Future<String> prompt(
  BuildContext context,
  {
    Widget title,
    Widget textOK,
    Widget textCancel,
    String initialValue,
    bool autoFocus: false,
  }
) {
  String value;
  return showDialog(
    context: context,
    builder: (_) => WillPopScope(
      child: AlertDialog(
        title: title,
        content: TextFormField(
          autofocus: autoFocus,
          initialValue: initialValue,
          onChanged: (text) => value = text,
        ),
        actions: <Widget>[
          FlatButton(child: textCancel != null ? textCancel : Text('Cancel'), onPressed: () => Navigator.pop(context, null)),
          FlatButton(child: textOK != null ? textOK : Text('OK'), onPressed: () => Navigator.pop(context, value)),
        ],
      ),
      onWillPop: () { Navigator.pop(context, false); return; },
    ),
  );
}

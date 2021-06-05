library prompt_dialog;

import 'package:flutter/material.dart';

/// The `title` argument is used to title of alert dialog.
/// The `textOK` argument is used to text for 'OK' Button of alert dialog.
/// The `textCancel` argument is used to text for 'Cancel' Button of alert dialog.
/// The `initialValue` argument is used to initial value of alert dialog.
/// The `hintText` argument will be hintText text field form of alert dialog.
/// The `minLines` argument will be minLines text field form of alert dialog.
/// The `maxLines` argument will be maxLines text field form of alert dialog.
/// The `autoFocus` argument will be autoFocus text field form of alert dialog.
/// The `keyboardType` argument will be keyboardType text field form of alert dialog.
/// The `textInputAction` argument will be textInputAction text field form of alert dialog.
/// The `obscureText` argument will be obscureText text field form of alert dialog.
/// The `obscuringCharacter` argument will be obscuringCharacter text field form of alert dialog.
/// The `textCapitalization` argument will be textCapitalization text field form of alert dialog.
///
/// Returns a [Future<String?>].
Future<String?> prompt(
  BuildContext context, {
  Widget? title,
  Widget? textOK,
  Widget? textCancel,
  String? initialValue,
  String? hintText,
  int minLines = 1,
  int maxLines = 1,
  bool autoFocus = true,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
  bool obscureText = false,
  String obscuringCharacter = '•',
  TextCapitalization textCapitalization = TextCapitalization.none,
}) {
  String? value;
  return showDialog(
    context: context,
    builder: (_) => WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, null);
        return true;
      },
      child: AlertDialog(
        title: title,
        content: TextFormField(
          decoration: InputDecoration(hintText: hintText),
          minLines: minLines,
          maxLines: maxLines,
          autofocus: autoFocus,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          initialValue: initialValue,
          onChanged: (text) => value = text,
          obscureText: obscureText,
          obscuringCharacter: obscuringCharacter,
          textCapitalization: textCapitalization,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: (textCancel != null) ? textCancel : const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, value),
            child: (textOK != null) ? textOK : const Text('OK'),
          ),
        ],
      ),
    ),
  );
}

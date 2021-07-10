library prompt_dialog;

import 'package:flutter/material.dart';

/// The `title` argument is used to title of alert dialog.\
/// The `textOK` argument is used to text for 'OK' Button of alert dialog.\
/// The `textCancel` argument is used to text for 'Cancel' Button of alert dialog.\
/// The `initialValue` argument is used to initial value of alert dialog.\
/// The `hintText` argument will be hintText text field form of alert dialog.\
/// The `minLines` argument will be minLines text field form of alert dialog.\
/// The `maxLines` argument will be maxLines text field form of alert dialog.\
/// The `autoFocus` argument will be autoFocus text field form of alert dialog.\
/// The `keyboardType` argument will be keyboardType text field form of alert dialog.\
/// The `textInputAction` argument will be textInputAction text field form of alert dialog.\
/// The `obscureText` argument will be obscureText text field form of alert dialog.\
/// The `obscuringCharacter` argument will be obscuringCharacter text field form of alert dialog.\
/// The `showPasswordIcon` visible for show password icon. default is false.\
/// The `barrierDismissible` argument will be barrierDismissible showDialog form of alert dialog.\
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
  bool showPasswordIcon = false,
  bool barrierDismissible = false,
  TextCapitalization textCapitalization = TextCapitalization.none,
}) {
  final TextEditingController controller =
      TextEditingController(text: initialValue);
  String? value = initialValue;
  int keyCtr = 0;
  return showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return WillPopScope(
            onWillPop: () async {
              Navigator.pop(context, null);
              return true;
            },
            child: AlertDialog(
              title: title,
              content: TextFormField(
                key: Key('1_${keyCtr.toString()}'),
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  suffixIcon: showPasswordIcon
                      ? IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: obscureText ? Colors.grey : Colors.blueGrey,
                          ),
                          onPressed: () {
                            obscureText = !obscureText;
                            keyCtr++;
                            setState(() {
                              controller.selection = TextSelection.fromPosition(
                                const TextPosition(offset: 0),
                              );
                              controller.selection = TextSelection.fromPosition(
                                TextPosition(offset: controller.text.length),
                              );
                            });
                          },
                        )
                      : null,
                ),
                minLines: minLines,
                maxLines: maxLines,
                autofocus: autoFocus,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                onChanged: (String text) => value = text,
                obscureText: obscureText,
                obscuringCharacter: obscuringCharacter,
                textCapitalization: textCapitalization,
                onEditingComplete: () => Navigator.pop(context, value),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, null),
                  child:
                      (textCancel != null) ? textCancel : const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, value),
                  child: (textOK != null) ? textOK : const Text('OK'),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

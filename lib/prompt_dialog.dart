library prompt_dialog;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The `title` argument is used to title of alert dialog.\
/// The `textOK` argument is used to text for 'OK' Button of alert dialog.\
/// The `textCancel` argument is used to text for 'Cancel' Button of alert dialog.\
/// The `initialValue` argument is used to an initial value of alert dialog.\
/// The `isSelectedInitialValue` argument is used to select an initial value of alert dialog.\
/// The `hintText` argument will be hintText in TextFormField of alert dialog.\
/// The `validator` argument will be validator in TextFormField of alert dialog.\
/// The `minLines` argument will be minLines in TextFormField of alert dialog.\
/// The `maxLines` argument will be maxLines in TextFormField of alert dialog.\
/// The `autoFocus` argument will be autoFocus in TextFormField of alert dialog.\
/// The `keyboardType` argument will be keyboardType in TextFormField of alert dialog.\
/// The `textInputAction` argument will be textInputAction in TextFormField of alert dialog.\
/// The `obscureText` argument will be obscureText in TextFormField of alert dialog.\
/// The `obscuringCharacter` argument will be obscuringCharacter in TextFormField of alert dialog.\
/// The `showPasswordIcon` visible for show password icon. default is false.\
/// The `barrierDismissible` argument will be barrierDismissible showDialog form of alert dialog.\
/// The `textCapitalization` argument will be textCapitalization in TextFormField of alert dialog.\
/// The `textAlign` argument will be textAlign in TextFormField of alert dialog.\
/// The `controller` argument will be controller in TextFormField of alert dialog.\
/// The `decoration` argument will allow modification of the text field decoration. The `hintText` and `suffixIcon` fields will be overridden.\
/// The `canPop` argument is `canPop` of PopScope.\
/// The `onPopInvokedWithResult` argument is `onPopInvokedWithResult` of PopScope.
/// The `maxLength` argument will be maxLength in TextFormField of alert dialog.\
/// The `inputFormatters` argument will be inputFormatters in TextFormField of alert dialog.\
///
/// Returns a [Future<String?>].
Future<String?> prompt(
  BuildContext context, {
  Widget? title,
  Widget? textOK,
  Widget? textCancel,
  String? initialValue,
  bool isSelectedInitialValue = true,
  String? hintText,
  String? Function(String?)? validator,
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
  TextAlign textAlign = TextAlign.start,
  TextEditingController? controller,
  InputDecoration? decoration,
  EdgeInsets? insetPadding,
  EdgeInsets? contentPadding,
  EdgeInsets? actionsPadding,
  EdgeInsets? titlePadding,
  EdgeInsets? buttonPadding,
  EdgeInsets? iconPadding,
  bool canPop = false,
  void Function(bool, dynamic)? onPopInvokedWithResult,
  int? maxLength,
  List<TextInputFormatter>? inputFormatters,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return _PromptDialog(
        title: title,
        textOK: textOK,
        textCancel: textCancel,
        initialValue: initialValue,
        isSelectedInitialValue: isSelectedInitialValue,
        hintText: hintText,
        validator: validator,
        minLines: minLines,
        maxLines: maxLines,
        autoFocus: autoFocus,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
        showPasswordIcon: showPasswordIcon,
        textCapitalization: textCapitalization,
        textAlign: textAlign,
        controller: controller,
        decoration: decoration ?? const InputDecoration(),
        insetPadding: insetPadding ?? EdgeInsets.zero,
        contentPadding: contentPadding,
        actionsPadding: actionsPadding,
        titlePadding: titlePadding,
        buttonPadding: buttonPadding,
        iconPadding: iconPadding,
        canPop: canPop,
        onPopInvokedWithResult: onPopInvokedWithResult,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
      );
    },
  );
}

class _PromptDialog extends StatefulWidget {
  const _PromptDialog({
    required this.isSelectedInitialValue,
    required this.minLines,
    required this.maxLines,
    required this.autoFocus,
    required this.obscureText,
    required this.obscuringCharacter,
    required this.showPasswordIcon,
    required this.textCapitalization,
    required this.textAlign,
    required this.decoration,
    required this.insetPadding,
    required this.canPop,
    this.title,
    this.textOK,
    this.textCancel,
    this.initialValue,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.contentPadding,
    this.actionsPadding,
    this.titlePadding,
    this.buttonPadding,
    this.iconPadding,
    this.onPopInvokedWithResult,
    this.maxLength,
    this.inputFormatters,
  });

  final Widget? title;
  final Widget? textOK;
  final Widget? textCancel;
  final String? initialValue;
  final bool isSelectedInitialValue;
  final String? hintText;
  final String? Function(String?)? validator;
  final int minLines;
  final int maxLines;
  final bool autoFocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String obscuringCharacter;
  final bool showPasswordIcon;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final InputDecoration decoration;
  final EdgeInsets insetPadding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? actionsPadding;
  final EdgeInsets? titlePadding;
  final EdgeInsets? buttonPadding;
  final EdgeInsets? iconPadding;
  final bool canPop;
  final void Function(bool, dynamic)? onPopInvokedWithResult;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  __PromptDialogState createState() => __PromptDialogState();
}

class __PromptDialogState extends State<_PromptDialog> {
  late TextEditingController _controller;
  late bool _stateObscureText = widget.obscureText;

  String? value;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    value = widget.initialValue;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.canPop,
      onPopInvokedWithResult: widget.onPopInvokedWithResult,
      child: AlertDialog(
        insetPadding: widget.insetPadding,
        contentPadding: widget.contentPadding,
        actionsPadding: widget.actionsPadding,
        titlePadding: widget.titlePadding,
        buttonPadding: widget.buttonPadding,
        iconPadding: widget.iconPadding,
        title: widget.title,
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: _controller,
              inputFormatters: widget.inputFormatters,
              decoration: widget.decoration.copyWith(
                hintText: widget.hintText,
                suffixIcon: widget.showPasswordIcon
                    ? IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color:
                              _stateObscureText ? Colors.grey : Colors.blueGrey,
                        ),
                        onPressed: () {
                          _stateObscureText = !_stateObscureText;
                          setState(() {
                            _controller.selection = TextSelection.fromPosition(
                              const TextPosition(offset: 0),
                            );
                            _controller.selection = TextSelection.fromPosition(
                              TextPosition(offset: _controller.text.length),
                            );
                          });
                        },
                      )
                    : null,
              ),
              validator: widget.validator,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              autofocus: widget.autoFocus,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              onChanged: (String text) => value = text,
              obscureText: _stateObscureText,
              obscuringCharacter: widget.obscuringCharacter,
              textCapitalization: widget.textCapitalization,
              onEditingComplete: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context, value);
                }
              },
              textAlign: widget.textAlign,
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: (widget.textCancel != null)
                ? widget.textCancel!
                : Text(MaterialLocalizations.of(context).cancelButtonLabel),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context, value);
              }
            },
            child: (widget.textOK != null)
                ? widget.textOK!
                : Text(MaterialLocalizations.of(context).okButtonLabel),
          ),
        ],
      ),
    );
  }
}

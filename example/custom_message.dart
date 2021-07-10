import 'package:flutter/material.dart';

import 'package:prompt_dialog/prompt_dialog.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () async {
              return print(await prompt(
                context,
                title: const Text('Would you like to remove?'),
                initialValue: 'Sure',
                textOK: const Text('Yes'),
                textCancel: const Text('No'),
                hintText: 'Please write reason',
                minLines: 2,
                maxLines: 3,
                autoFocus: false,
                obscureText: true,
                obscuringCharacter: '*',
                showPasswordIcon: true,
                barrierDismissible: true,
                textCapitalization: TextCapitalization.words,
              ));
            },
            child: const Text('Prompt Dialog'),
          ),
        ),
      ),
    );
  }
}

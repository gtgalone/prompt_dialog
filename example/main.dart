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
              // ignore: avoid_print
              return print(await prompt(context));
            },
            child: const Text('Prompt Dialog'),
          ),
        ),
      ),
    );
  }
}

# Prompt Dialog

[![pub package](https://img.shields.io/pub/v/prompt_dialog.svg)](https://pub.dartlang.org/packages/prompt_dialog)

Prompt Dialog Widget for Flutter(JS-LIKE).
https://pub.dev/packages/prompt_dialog

## Installation

### Add pubspec.yaml
``` yaml
dependencies:
  prompt_dialog: latest
```
---
## Usage

### Basic
``` dart
import 'package:flutter/material.dart';

import 'package:prompt_dialog/prompt_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Prompt Dialog'),
          onPressed: () async {
            return print(await prompt(context));
          },
        ),
      ),
    );
  }
}
```

### Custom Message
``` dart
import 'package:flutter/material.dart';

import 'package:prompt_dialog/prompt_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Prompt Dialog'),
          onPressed: () async {
            const String initialValue = 'Sure';

            return print(await prompt(
              context,
              title: const Text('Would you like to remove?'),
              initialValue: initialValue,
              isSelectedInitialValue: false,
              textOK: const Text('Yes'),
              textCancel: const Text('No'),
              hintText: 'Please write reason',
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              minLines: 2,
              maxLines: 3,
              autoFocus: false,
              obscureText: true,
              obscuringCharacter: '*',
              showPasswordIcon: true,
              barrierDismissible: true,
              textCapitalization: TextCapitalization.words,
              textAlign: TextAlign.center,
              controller: TextEditingController(text: initialValue),
            ));
          },
        ),
      ),
    );
  }
}
```
---
## Recommend Libraries

- [Confirm Dialog](https://github.com/gtgalone/confirm_dialog) - Confirm Dialog Widget for Flutter(JS-LIKE).
- [Alert Dialog](https://github.com/gtgalone/alert_dialog) - Alert Dialog Widget for Flutter(JS-LIKE).
- [Currency Text Input Formatter](https://github.com/gtgalone/currency_text_input_formatter) - Currency Text Input Formatter for Flutter.

## Maintainer

- [Jehun Seem](https://github.com/gtgalone)

## License

MIT

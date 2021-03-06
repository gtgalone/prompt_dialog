import 'package:flutter/material.dart';

import 'package:prompt_dialog/prompt_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: TextButton(
            child: Text('Prompt Dialog'),
            onPressed: () async {
              return print(await prompt(
                context,
                title: Text('Would you like to remove?'),
                initialValue: 'Sure',
                textOK: Text('Yes'),
                textCancel: Text('No'),
                hintText: 'Please write reason',
                minLines: 1,
                maxLines: 3,
                autoFocus: true,
                obscureText: false,
                obscuringCharacter: '•',
                textCapitalization: TextCapitalization.words,
              ));
            },
          ),
        ),
      ),
    );
  }
}

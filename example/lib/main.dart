import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Storybook(
        children: [
          Story(
            section: 'Button',
            name: 'Flat button',
            builder: (_, k) => MaterialButton(
              onPressed:
                  k.boolean(label: 'Enabled', initial: true) ? () {} : null,
              child: Text(k.text(label: 'Text', initial: 'Flat button')),
            ),
          ),
          Story(
            section: 'Button',
            name: 'Raised button',
            // ignore: deprecated_member_use
            builder: (_, k) => RaisedButton(
              onPressed:
                  k.boolean(label: 'Enabled', initial: true) ? () {} : null,
              color: k.options(
                label: 'Color',
                initial: Colors.deepOrange,
                options: const [
                  Option('Red', Colors.deepOrange),
                  Option('Green', Colors.teal),
                ],
              ),
              mouseCursor: k.options(
                label: 'Mouse Cursor',
                initial: null,
                options: const [
                  Option('Basic', SystemMouseCursors.basic),
                  Option('Click', SystemMouseCursors.click),
                  Option('Forbidden', SystemMouseCursors.forbidden),
                ],
              ),
              elevation: k.slider(label: 'Elevation', initial: 0, max: 20),
              textColor: Colors.white,
              child: Text(k.text(label: 'Text', initial: 'Raised button')),
            ),
          ),
          Story.simple(
            name: 'Input field',
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input field',
              ),
            ),
          ),
        ],
      );
}

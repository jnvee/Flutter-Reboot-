import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var buttonAttributes = ValueNotifier(
    ButtonAttributes(
      'Tap a Button',
      Colors.black,
    ),
  );

  Widget getButton(buttonColor, buttonString, stringColor) {
    return InkWell(
      onTap: () {
        buttonAttributes.value = ButtonAttributes(
          buttonString,
          stringColor,
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            buttonString,
            style: TextStyle(
              color: stringColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button App',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Button App'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getButton(
                    Colors.yellow,
                    'Blue',
                    Colors.blue,
                  ),
                  getButton(
                    Colors.green,
                    'Yellow',
                    Colors.yellow,
                  ),
                  getButton(
                    Colors.blue,
                    'Green',
                    Colors.green,
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: buttonAttributes,
                builder: (context, ButtonAttributes value, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Text(
                      value.colorName,
                      style: TextStyle(
                        fontSize: 50,
                        color: value.color,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonAttributes {
  ButtonAttributes(
    this.colorName,
    this.color,
  );

  String colorName;
  Color color;
}

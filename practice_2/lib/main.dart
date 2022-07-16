import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  var colorName = ValueNotifier('Tap a Button!');
  var colorcolor = Colors.black;

   Widget ColorButton(buttonColor, buttonString, stringColor){
     return InkWell(
       onTap: (){
         colorName.value = buttonString;
         colorcolor = stringColor;
       },
       child: Container(
         width: 100,
         height: 50,
         decoration: BoxDecoration(
             color: buttonColor, borderRadius: BorderRadius.circular(20)),
         child:
         Center(
             child: Text(buttonString,
                 style: TextStyle(color: stringColor, fontSize: 20, fontWeight: FontWeight.bold,))),
       ),
     );
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button App',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Button App')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ColorButton(Colors.yellow, 'Blue', Colors.blue),
                  ColorButton(Colors.green, 'Yellow', Colors.yellow),
                  ColorButton(Colors.blue, 'Green', Colors.green)
                ],
              ),
              ValueListenableBuilder(valueListenable: colorName,
                  builder: (context, value, child){
                return Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: Text('$value', style: TextStyle(fontSize: 50, color: colorcolor)),
                );
                  })

            ],
          ),
        ),
      ),
    );
  }
}

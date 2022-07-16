import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Value Listenable Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Value Listenable Builder'),
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
 var counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
             title: Text(widget.title),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: counter,
          builder: (context, count, child){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$count',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ) ;
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counter.value++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}

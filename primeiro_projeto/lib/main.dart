import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Primeiro Aplicativo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Frases do Dia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _numeroAleatorio = 0;
  List _frasesAleatorias = ['Cada qual sabe amar a seu modo; o modo, pouco importa; o essencial é que saiba amar.',
    'Se me esqueceres, só uma coisa, esquece-me bem devagarinho.',
    'O grande consolo das velhas anedotas são os recém-nascidos...',
    'Fica responsável por tudo aquilo que domesticaste.'];

  void _randomizaNumero() {
    setState(() {
      _numeroAleatorio = new Random().nextInt(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Aperte aqui para gerar uma frase.',
            ),
            Text(
              _frasesAleatorias[_numeroAleatorio],
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomizaNumero,
        tooltip: 'Increment',
        child: Icon(Icons.add_circle),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

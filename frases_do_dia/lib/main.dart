import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frasesAleatorias = [
    "O pior náufrago é não partir.",
    "Com grandes poderes, vem grandes responsabilidades.",
    "Se podemos sonhar, também podemos tornar nossos sonhos realidade.",
    "O primeiro dever da inteligência é desconfiar dela mesma."
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frasesAleatorias.length);

    setState(() {
      _fraseGerada = _frasesAleatorias[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width:3, color: Colors.amber)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              _fraseGerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
                color: Colors.black
              ),
            ),
            RaisedButton(
              child: Text("Nova Frase"),
              color: Colors.green,
              onPressed: _gerarFrase
            )
          ],
        ),
      ),
    );
  }
}

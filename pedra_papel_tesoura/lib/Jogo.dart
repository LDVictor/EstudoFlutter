import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemIA = AssetImage("images/padrao.png");
  var _mensagem = "Sua escolha";

  _opcaoSelecionada(String escolhaUsuario) {

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaIA = opcoes[numero];

    print("Escolha do App: $escolhaIA");
    print("Escolha do Usuário: $escolhaUsuario");

    switch (escolhaIA) {
      case "pedra":
        setState(() {
          this._imagemIA = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemIA = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemIA = AssetImage("images/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaIA == "tesoura") || (escolhaUsuario == "papel" && escolhaIA == "pedra") || (escolhaUsuario == "tesoura" && escolhaIA == "papel")) {
      print("Usuário venceu!");
      setState(() {
        this._mensagem = "Você ganhou!";
      });
    }
    else if ((escolhaIA == "pedra" && escolhaUsuario == "tesoura") || (escolhaIA == "papel" && escolhaUsuario == "pedra") || (escolhaIA == "tesoura" && escolhaUsuario == "papel")){
      print("App venceu!");
      this._mensagem = "O app ganhou!";
    }
    else {
      print("Empate!");
      this._mensagem = "Deu empate!";
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra, Papel, Tesoura"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // text
          // imagem
          // resultado
          // linha 3 imagens
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha da IA",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            )
          ),
          GestureDetector(
            onTap: (){ print("Imagem foi clicada!"); },
            onDoubleTap: (){ print("Dois cliques na imagem!"); },
            onLongPress: (){ print("Clique longo na imagem!"); },
            child: Image(image: this._imagemIA),
          ),
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                  _mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100),
              ),
            ],
          )
        ],
      ),
    );
  }
}

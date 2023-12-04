import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trabalho/MyHomePage2.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    // Defina um temporizador para atrasar o redirecionamento para a tela principal
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (_) =>
                MyHomePage()), // Substitua HomeScreen() pela tela principal do seu aplicativo
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // Cor de fundo azul
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(300), // Bordas arredondadas
            child: Container(
              width: 300, // Largura da imagem
              height: 300, // Altura da imagem
              color: Colors
                  .white, // Cor de fundo da imagem (pode ser removida se a imagem tiver fundo transparente)
              child: Image.asset(
                'imagem/splash_screen2.jpg',
                fit: BoxFit
                    .cover, // Ajusta a imagem para preencher o espaço do contêiner redondo
              ),
            ),
          ),
        ),
      ),
    );
  }
}

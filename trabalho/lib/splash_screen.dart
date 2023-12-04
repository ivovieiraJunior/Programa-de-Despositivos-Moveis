import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trabalho/splash_screen2.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Defina um temporizador para atrasar o redirecionamento para a tela principal
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (_) =>
                SplashScreen2()), // Substitua HomeScreen() pela tela principal do seu aplicativo
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
                'imagem/splash_screen.jpg',
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

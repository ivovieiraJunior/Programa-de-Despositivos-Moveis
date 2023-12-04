import 'package:flutter/material.dart';
import 'package:trabalho/MyApp.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/RegistroProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RegistroProvider(),
      child: MyApp(),
    ),
  );
}
/*
Registro
  Add atributos ao Registro
  Horimetro inicial  
  Horimetro final
  Hora do registro = final - inicial;
  Separ dia e mes 
  DIA 
  mes list vil de meses ou classe count/abristat contetendo o mes
}
CLASSE ListarREGISTRO{
  BUSCAR POR MES
  buscar por intervalor de dias 
}
!!!!!!!!!SALVAR EM ARQUIVO COM UM CABEÇARIO!!!!!!! 
CONTAR LINHA PRA ADD NOME DO CLIENTE

O CABEÇÃRIO DA EMPRESA emcima e embaixo

!!!! tentar dar o nome para ARQUIVO REGISTRO !!!!!

*/
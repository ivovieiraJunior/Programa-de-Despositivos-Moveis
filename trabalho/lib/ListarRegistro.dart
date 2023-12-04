import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/RegistroProvider.dart';
import 'package:trabalho/registro.dart';
//import 'dart:io';
//import 'package:path_provider/path_provider.dart';

late List<Registro> registrosFiltrados = [];

class ListarRegistro extends StatefulWidget {
  const ListarRegistro({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListarRegistroState();
}

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
//
/*
Future<void> salvarRegistrosEmArquivo(List<Registro> registros) async {
  try {
    Directory diretorio = await getApplicationDocumentsDirectory();
    String path = '${diretorio.path}/registros.txt';

    File arquivo = File(path);
    IOSink sink = arquivo.openWrite(mode: FileMode.append);

    registros.forEach((registro) {
      sink.write(
          'Máquina: ${registro.maquina}, Horímetro: ${registro.horimetro.toStringAsFixed(2)}, Dia: ${registro.dia}\n');
    });

    await sink.flush();
    await sink.close();

    print('Registros salvos com sucesso em $path');
  } catch (e) {
    print('Erro ao salvar os registros: $e');
  }
}

*/ ////////////////////////////////////////////////////////
class _ListarRegistroState extends State<ListarRegistro> {
  double? valor = 0;
  // Lista para armazenar os registros filtrados
  TextEditingController maquinaController = TextEditingController();
  TextEditingController diaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registroProvider = Provider.of<RegistroProvider>(context);
    List<Registro> registros = registroProvider.registros;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registros Cadastrados"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: maquinaController,
              onChanged: (value) {
                setState(() {
                  registrosFiltrados = registros
                      .where((registro) => registro.maquina == value)
                      .toList();
                });
              },
              decoration: InputDecoration(
                labelText: 'Pesquisar por nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: diaController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  registrosFiltrados = registros
                      .where((registro) => registro.dia == value)
                      .toList();
                });
              },
              decoration: InputDecoration(
                labelText: 'Pesquisar por mês',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  DataTable(
                    columns: [
                      DataColumn(label: Text('Máquina')),
                      DataColumn(label: Text('Horímetro')),
                      DataColumn(label: Text('Dia')),
                      DataColumn(label: Text('Total')),
                    ],
                    rows: registrosFiltrados.map((registro) {
                      valor = registro.horimetro + valor!;
                      return DataRow(cells: [
                        DataCell(Text(registro.maquina)),
                        DataCell(Text(registro.horimetro.toString())),
                        DataCell(Text(registro.dia)),
                        DataCell(Text(valor.toString() + ' Horas')),
                      ]);
                    }).toList(),
                  ),
                ],
              ),
            ),
            registrosFiltrados.isEmpty
                ? Text('Nem registro Emcontrado')
                : ElevatedButton(
                    onPressed: () async {
                      //salvarRegistrosEmArquivo(registrosFiltrados);
                    },
                    child: Text('Salvar No arquivo'))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/RegistroProvider.dart';
import 'package:trabalho/registro.dart';

late List<Registro> registros = [];
RegistroProvider registroProvider = RegistroProvider();

class CadastrarRegistro extends StatefulWidget {
  const CadastrarRegistro({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CadastrarRegistroState();
}

class _CadastrarRegistroState extends State<CadastrarRegistro> {
  TextEditingController maquinaController = TextEditingController();
  TextEditingController horimetroController = TextEditingController();
  TextEditingController diaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar os dados do Registro"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: maquinaController,
              decoration: InputDecoration(labelText: 'Máquina A'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: horimetroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Horímetro EX:11.5'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: diaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Dia EX: 2023-12-12'),
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () async {
                final maquina = maquinaController.text;
                final horimetro = double.parse(horimetroController.text);
                final dia = diaController.text;
                RegistroProvider registroProvider =
                    Provider.of<RegistroProvider>(context, listen: false);
                registroProvider.adicionarRegistro(
                  Registro(maquina: maquina, horimetro: horimetro, dia: dia),
                );
                setState(() {
                  registros.add(Registro(
                    maquina: maquina,
                    horimetro: horimetro,
                    dia: dia,
                  ));
                });
                // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                registroProvider.notifyListeners();
                maquinaController.clear();
                horimetroController.clear();
                diaController.clear();
              },
              child: Text('Cadastrar'),
            ),
            SizedBox(height: 20.0),
            registros.isEmpty
                ? Text('Insira um registro Valido')
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: registros
                        .map(
                          (registro) => Card(
                            margin: EdgeInsets.symmetric(vertical: 4.0),
                            child: ListTile(
                              title: Text(registro.maquina),
                              subtitle: Text(
                                'Horímetro: ${registro.horimetro.toStringAsFixed(2)} | Dia: ${registro.dia}',
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    registros.remove(registro);
                                  });
                                },
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}

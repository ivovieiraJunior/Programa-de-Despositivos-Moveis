import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/ListarRegistro.dart';
import 'package:trabalho/RegistroProvider.dart';
import 'package:trabalho/cadastrarRegistro.dart';
import 'package:trabalho/registro.dart';

late List<Registro> registros = [];
RegistroProvider registroProvider = RegistroProvider();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int i = 0;
  Widget _buildMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
              //Se não colocar isso, a barra azul fica muito grande (altura)
              height: 80.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Opções'),
              )),
          ListTile(
            title: Text('Registros'),
            onTap: () {
              Navigator.push(
                  context as BuildContext,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage())); // fazer listar
            },
          ),
          ListTile(
            title: Text('Cadastrar Registro'),
            onTap: () {
              Navigator.push(context as BuildContext,
                  MaterialPageRoute(builder: (context) => CadastrarRegistro()));
            },
          ),
          ListTile(
            title: Text('Listar registros'),
            onTap: () {
              Navigator.push(
                  context as BuildContext,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ListarRegistro())); // fazer listar
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final registroProvider = Provider.of<RegistroProvider>(context);
    registros = registroProvider.registros;
    registros = registros.reversed.toList();
    return Scaffold(
      drawer: _buildMenu(),
      appBar: AppBar(
        title: const Text("Registros"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Obtendo a instância do RegistroProvider
                RegistroProvider registroProvider =
                    Provider.of<RegistroProvider>(context, listen: false);

                // Acessando a lista de registros
                registros = registroProvider.registros;

                // Usando a lista de registros como desejado
                //print(registros[1].dia);
                setState(() {
                  registros.add(registros.last);
                  registros.remove(registros.last);
                });
              },
              child: Text('Atualizar Registros'),
            ),
            SizedBox(height: 20.0),
            registros.isEmpty
                ? Text('Nenhum registro disponível')
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
                                    registroProvider.removeRegistro(registro);
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

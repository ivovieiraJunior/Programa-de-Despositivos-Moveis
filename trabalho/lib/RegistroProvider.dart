import 'package:flutter/material.dart';
import 'package:trabalho/registro.dart';

class RegistroProvider with ChangeNotifier {
  List<Registro> _registros = [
    Registro(maquina: 'Máquina A', horimetro: 10.5, dia: '2023-11-1'),
    Registro(maquina: 'Máquina A', horimetro: 11.5, dia: '2023-11-2'),
    Registro(maquina: 'Máquina A', horimetro: 12.2, dia: '2023-11-3'),
    Registro(maquina: 'Máquina A', horimetro: 9.5, dia: '2023-11-4'),
    Registro(maquina: 'Máquina A', horimetro: 2.5, dia: '2023-11-5'),
    Registro(maquina: 'Máquina A', horimetro: 7.5, dia: '2023-11-6'),
    Registro(maquina: 'Máquina A', horimetro: 4.6, dia: '2023-11-7'),
    Registro(maquina: 'Máquina A', horimetro: 13.1, dia: '2023-11-8'),
    Registro(maquina: 'Máquina A', horimetro: 10.5, dia: '2023-11-9'),
    Registro(maquina: 'Máquina B', horimetro: 15.2, dia: '2023-11-1'),
    Registro(maquina: 'Máquina B', horimetro: 15.2, dia: '2023-11-2'),
    Registro(maquina: 'Máquina B', horimetro: 15.2, dia: '2023-11-3'),
    Registro(maquina: 'Máquina B', horimetro: 15.2, dia: '2023-11-4'),
    Registro(maquina: 'Máquina B', horimetro: 15.2, dia: '2023-11-5'),
    Registro(maquina: 'Máquina B', horimetro: 0, dia: '2023-11-6'),
    Registro(maquina: 'Máquina B', horimetro: 15.2, dia: '2023-11-7'),
    Registro(maquina: 'Máquina C', horimetro: 20.8, dia: '2023-11-1'),
  ];

  List<Registro> get registros => _registros;

  void adicionarRegistro(Registro registro) {
    _registros.add(registro);
    notifyListeners();
  }

  List<Registro> getRegistros() {
    return _registros;
  }

  void atribuirIds() {
    for (int i = 0; i < registros.length; i++) {
      registros[i].setId(i + 1);
    }
  }

  void atualizarRegistro(int? id, Registro registroAtualizado) {
    atribuirIds();
    final index = _registros.indexWhere((registro) => registro.id == id);
    if (index != -1) {
      _registros[index] = registroAtualizado;
      notifyListeners();
    }
  }

  void removeRegistro(Registro registro) {
    registros.remove(registro);
    notifyListeners();
  }
}

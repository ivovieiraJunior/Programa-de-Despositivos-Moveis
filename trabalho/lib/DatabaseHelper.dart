import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:trabalho/registro.dart';

class DataStorage {
  final String _fileName = 'machine_data.json';

  Future<File> get _localFile async {
    final path = Directory.current.path; // Altere para o diretório apropriado
    return File('$path/$_fileName');
  }

  Future<List<Registro>> readData() async {
    try {
      final file = await _localFile;
      if (file.existsSync()) {
        final content = await file.readAsString();
        final List<dynamic> jsonList = json.decode(content);
        return jsonList
            .map((data) => Registro(
                  maquina: data['machine'],
                  horimetro: data['hours'],
                  dia: data['date'],
                ))
            .toList();
      }
    } catch (e) {
      print("Erro na leitura do arquivo: $e");
    }
    return [];
  }

  Future<File> writeData(List<Registro> dataList) async {
    final file = await _localFile;
    final jsonString =
        json.encode(dataList.map((data) => data.toMap()).toList());
    return file.writeAsString(jsonString);
  }
}





/*import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> getDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'registros_database.db');

    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE registros(id INTEGER PRIMARY KEY, maquina TEXT, horimetro REAL, dia TEXT)",
      );
    }, version: 1);
  }
}
 ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trabalho/registro.dart';

class DatabaseHelper {
  static Database _database;

  static Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  static Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'registros_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE registros(id INTEGER PRIMARY KEY, maquina TEXT, horimetro REAL, dia TEXT)",
        );
      },
    );
  }

  static Future<void> inserirRegistro(Registro registro) async {
    final Database db = await database;

    await db.insert(
      'registros',
      registro.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Registro>> carregarRegistros() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('registros');

    return List.generate(maps.length, (i) {
      return Registro(
        maps[i]['maquina'],
        maps[i]['horimetro'],
        maps[i]['dia'],
      );
    });
  }
}
*/
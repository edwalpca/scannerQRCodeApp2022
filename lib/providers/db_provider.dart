import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:tsw_scanner_app/models/scanmodel.dart';
export 'package:tsw_scanner_app/models/scanmodel.dart';

class DBProvider {
  //
  //
  static Database? _database;
  //Instancia de mi clase personalizada
  static final DBProvider db = DBProvider._();

  DBProvider._(); //Constructur Privado para obtener siempre la misma instancia de mi base de datos.

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  //Este procedimiento lo que va a realizar es preparar nuestra base de datos.
  Future<Database> initDB() async {
    //Vamos crear la base de datos en nuestro dispositivo.
    //Path de donde Almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // creacion de la base de datoa.
    final path = join(documentsDirectory.path,
        'ScansDB.db'); //el Join nos permite crear el url donde esta muestra base de datos.

    //print(path);

    //creacion de nuestra base de datos.
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            fecha TEXT,
            tipo TEXT,
            valor TEXT
          );
      ''');
    });
  }

  //Forma Larga de Trabajar
  Future<int> nuevoScanRaw(ScanModel nuevoScanModel) async {
    //
    final id = nuevoScanModel.id;
    final tipo = nuevoScanModel.tipo;
    final valor = nuevoScanModel.valor;
    final fecha = nuevoScanModel.fecha;

    //verificar la base de datos
    final db = await database;
    final res = await db.rawInsert('''

      INSERT INTO Scans(id, tipo, valor, fecha)
      VALUES ($id, $tipo, $valor, $fecha)

    ''');
    return res;
  }

  //forma Sencilla de realizar inserciones a la base de datos.
  Future<int> nuevoScan(ScanModel nuevoScan) async {
    //verificar la base de datos
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    //print('Impresion de Resultado de DB: ${res}');
    return res;
  }

  //Obtiene un registro particular de la DB
  Future<ScanModel?> getScanById(int id) async {
    //
    //
    //
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
    //
    //
  }

  //
  //Obtiene TODOS los registros de la tabla
  Future<List<ScanModel>?> getAllRows() async {
    //
    //
    //
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
    //
    //
  }

  //Obtiene TODOS los registros de la tabla
  Future<List<ScanModel>?> getAllRowporTipo(String tipo) async {
    //
    //
    final db = await database;
    final res = await db.rawQuery('''
          SELECT * FROM Scans WHERE tipo = '$tipo' 
        ''');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
    //
    //
  }

  //Obtiene TODOS los registros de la tabla por Like
  Future<List<ScanModel>?> getRowporValor(String valor) async {
    //
    //
    final db = await database;
    final res = await db.rawQuery('''
    
          SELECT * FROM Scans WHERE valor LIKE '%$valor%'
    
    ''');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
    //
    //
  }

  //Actualiza un registro en Particular.
  Future<int> updateScan(ScanModel nuevoScan) async {
    //
    //
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id=?', whereArgs: [nuevoScan.id]);
    return res;
    //
    //
  }

  //Borrar un registro en Particular.
  Future<int> deleteScan(int id) async {
    //
    //
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
    //
    //
  }

  //Borrar un registro en Particular.
  Future<int> deleteAllScan() async {
    //
    //
    final db = await database;
    final res = await db.rawDelete('''
      DELETE FROM Scans
    ''');
    return res;
    //
    //
  }

  //Borrar un registro en Particular.
  Future<int> deleteScanPorTipo(String tipo) async {
    //
    //
    final db = await database;
    final res = await db.rawDelete('''
      DELETE FROM Scans WHERE tipo = '$tipo'
    ''');
    return res;
    //
    //
  }


}

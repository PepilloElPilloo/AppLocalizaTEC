import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String contactsTable = 'contacts';
  String colId = 'id';
  String colPuesto = 'puesto';
  String colNombre = 'nombre';
  String colCorreo = 'correo';
  String colTelefono = 'telefono';
  String colFoto = 'foto';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Obtener la ruta del directorio de documentos para almacenar la base de datos
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'Localizatec.db');

    // Abrir/crear la base de datos en una ubicación específica
    var contactsDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return contactsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $contactsTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colPuesto TEXT, '
        '$colNombre TEXT, $colCorreo TEXT, $colTelefono TEXT, $colFoto TEXT)');
  }

  Future<int> insertContact(Map<String, dynamic> contact) async {
    Database db = await database;
    var result = await db.insert(contactsTable, contact);
    return result;
  }

  Future<List<Map<String, dynamic>>> getContacts() async {
    Database db = await database;
    var result = await db.query(contactsTable);
    return result;
  }
}

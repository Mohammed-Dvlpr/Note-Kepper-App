import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:note_keeper_app/models/notes.dart';

/*
steps 
creating a Database helper class 
creating Singleton dbhelper object
it means it will initialise only once throughout application for our database 
and use it till the appplicatiobn shutdown 

creating a factory Constructor means it will allow to return some value
singleton databasehelper
This is executed only once , singleton object 

Named constructor to create instance of DatabaseHelper

singleton Database Object
defining a database variables

creating a function to create Database 

writing a function to initilaise a database

Get the path to the current directory og both android and ios to store data
open/create the database at a given path,version,data  
return notesdatabase

creating getter to Database reference variable 

define a function to perform CRID operations 

Fetch Operation: Get all note object from database

Insert Operation: Insert all a object to database

Update Operation: Update a note object and save it to database

Delete Operation: Delete all note object from database

Get number of note object in database
*/

class DatabaseHelper {
  static late DatabaseHelper _databaseHelper; // singleton databasehelper Object

  static late Database _database; //  singleton Database Object

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';
  // Named constructor to create instance of DatabaseHelper
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once , singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    // creating a real db
    // calling a getter
    if (_database == null) {
      _database = await initalizeDatabase();
    }
    return _database;
  }

  Future<Database> initalizeDatabase() async {
    // Get the path to the current directory og both android and ios to store data
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // open/create the database at a given path,version,data
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREAMENT, $colTitle TEXT, '
        '$colDescription TEXT , $colPriority INTEGER, $colDate TEXT)');
  }

  // Fetch Operation: Get all note object from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await database;
    var result = await db.query(noteTable,
        orderBy: '$colPriority ASC'); // in asending order
    return result;
  }

  // Insert Operation: Insert all a object to database
  // from notes class

  Future<int> insertNote(Notes note) async {
    Database db = await database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  // Update Operation: Update a note object and save it to database
  Future<int> updateNote(Notes note) async {
    Database db = await database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId = ?',
        whereArgs: [note.id]); // we are telling to update there
    return result;
  }

  // Delete Operation: Delete all note object from database
  Future<int> deleteNote(int id) async {
    Database db = await database;
    var result =
        await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  // Get number of note object in database
  Future<int?> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }
}

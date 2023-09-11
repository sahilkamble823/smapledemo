import 'dart:async';
import 'package:path/path.dart';
import 'package:sahil_ps_demo/model/Users.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io'as io;


class DatabaseHelper {
  var newdb;
  static Database? _db;
  var result;
   // late Users users;

  // populate customized db in actual db
   Future<Database> get db async{
     if(_db != null){
       return _db!;

     }
     _db = await initDatabase();
     return _db!;
   }
 // db initialization
  initDatabase() async{
     io.Directory docdir = await getApplicationDocumentsDirectory();
     String path  = join(docdir.path,"demo.db");
     newdb = openDatabase(path, version: 1, onCreate: _onCreate );
     return newdb;
  }
// on create db
  _onCreate(Database db, int version) async {
     await db.execute(
       'create table Users( id integer primary key autoincrement, username text, email text, password text)');

  }

  // add user data
  Future<Users> add(Users users) async{
     var dbUser = await db;
     users.id = await dbUser.insert('Users', users.toJson());

     return users;

  }

  // get user gata
 Future<List<Map<String, dynamic>>> getUsersDetials()  async {
     var dbUser = await db;
     return dbUser.query('Users');

  }

  Future<void> fetchUsers() async {
    final dbHelper = DatabaseHelper();
    final users = await dbHelper.getUsersDetials();

    for (var user in users) {
      print('User ID: ${user['id']}');
      print('Name: ${user['username']}');
      print('Email: ${user['email']}');
      print('Password: ${user['password']}');
      print('---');
    }
  }

  // update
  Future<int> updateUser(Map<String, dynamic> user) async {
    final dbUser = await db;
    return await dbUser.update('User', user,
        where: 'id = ?', whereArgs: [user['id']]);
  }

  // update password
 Future<int> updatePassword(String email, String newPassword) async{
     final dbUser = await db;
     int res =  await dbUser.update('Users', {'password': newPassword}, where: 'email = ?',whereArgs: [email]);
     return res;
 }

}
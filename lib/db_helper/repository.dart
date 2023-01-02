import 'package:sqflite/sqflite.dart';
import 'package:sqflitedb_app/db_helper/database_con.dart';

class Repository
{
  late DatabaseConnection _databaseConnection;
  Repository(){
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;
  Future<Database?> get database async{
    if(_database != null){
      return _database;
    }else{
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }
}
// Insert User
insertData(table,data) async{
  var connection = await database;
  return await connection?.insert(table,data);
}
// Read all data
readData(table,data) async{
  var connection = await database;
  return await connection?.query(table);
}
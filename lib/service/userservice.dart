import 'package:sqflitedb_app/db_helper/repository.dart';
import 'package:sqflitedb_app/model/usermodel.dart';

class UserService {
  late Repository _repository;
  UserService() {
    _repository = Repository();
  }
  //save users
  SaveUser(User user) async {
    return await _repository.insertData('users', user.userMap());
    
  }
  
  // read all users
   readAllUsers( ) async{
     return await _repository.readData('users');
   }
}
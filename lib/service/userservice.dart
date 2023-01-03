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
  //  Update user details
  UpdateUser(User user) async{
    return await _repository.updateData('users', user.userMap());
  }
  // delete user deails
  deleteUser(userId) async{
    return await _repository.deleteData('users', userId);
  }
}
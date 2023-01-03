import 'package:flutter/material.dart';
import 'package:sqflitedb_app/Screens/edituser.dart';
import 'package:sqflitedb_app/model/usermodel.dart';
import 'package:sqflitedb_app/service/userservice.dart';

import 'Screens/adduser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<User> _userList;
  final _userService = UserService();

  getAllUserDetails() async{
    _userList=<User>[];
    var users= await _userService.readAllUsers();
    _userList=<User>[];
    users.forEach((user){
      setState(() {
        var userModel = User();
      userModel.id=user['id'];
      userModel.name=user['name'];
      userModel.contact=user['contact'];
      userModel.address=user['address'];
      userModel.landmark=user['landmark'];
      userModel.pincode=user['pincode'];
      _userList.add(userModel);
      });
    });
  }
  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }
  _showSuccessSnacBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
  _deleteFromDialog(BuildContext context,useId){
    return showDialog(context: context, builder: (param){
      return AlertDialog(
        title: const Text('Are You Sure to Delete',
        style: TextStyle(color: Colors.black,fontSize: 20),),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.red,
            ),
            onPressed: () async{
            var result =await _userService.deleteUser(useId);
            if (result != null){
                  getAllUserDetails();
                  _showSuccessSnacBar('User Details Deleted Success');
                  Navigator.pop(context);
                }
            },child: Text('Delete'),),
            TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.black,
            ),
            onPressed: (){
              Navigator.pop(context);
            },child: Text('Close'),)
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address"),
      ),
      body: ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              width: 00,
              height: 150,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: const EdgeInsets.all(10),
              child: Row(
                
                children:[ Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [ 
                     Text(
                          'Name : ${_userList[index].name??''} ',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Mobile no : ${_userList[index].contact??''} ',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Address : ${_userList[index].address??''} ',
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(
                          'Landmark : ${_userList[index].landmark??''} ',
                          style: const TextStyle(fontSize: 18),
                        ),
                         Text(
                          'Pincode : ${_userList[index].pincode??''} ',
                          style: const TextStyle(fontSize: 18),
                        ),
                        
                        
                ],),
                SizedBox(width: 10.0,),
                
                IconButton(onPressed: (){
                   Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditUser(user: _userList[index],))).then((data){
                if (data != null){
                  getAllUserDetails();
                  _showSuccessSnacBar('User Details Updated Success');
                }
              });
                }, icon: Icon(Icons.edit),color: Colors.black,),
                IconButton(onPressed: (){
                  _deleteFromDialog(context,_userList[index].id);
                }, icon: Icon(Icons.delete),color: Colors.red,),
              
              ]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUser())).then((data){
                if (data != null){
                  getAllUserDetails();
                  _showSuccessSnacBar('User Details Added Success');
                }
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

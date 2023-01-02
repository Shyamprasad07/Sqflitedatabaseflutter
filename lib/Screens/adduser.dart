import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var _userNameController = TextEditingController();
  var _userContactController = TextEditingController();
  var _userAddressController = TextEditingController();
  var _userLandmarkController = TextEditingController();
  var _userPincodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Users"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add new address",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name',
                    labelText: 'Name'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userContactController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Contact',
                    labelText: 'contact'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userAddressController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Address',
                    labelText: 'Address'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userLandmarkController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Landmark',
                    labelText: 'Landmark'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userPincodeController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Pincode',
                    labelText: 'Pincode'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {},
                      child: Text("Save Details")),
                  SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        _userNameController.text='';
                        _userContactController.text='';
                        _userAddressController.text='';
                        _userLandmarkController.text='';
                        _userPincodeController.text='';
                      },
                      child: Text("clear Details")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

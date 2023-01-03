// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:flutter/material.dart';

import 'package:sqflitedb_app/model/usermodel.dart';
import 'package:sqflitedb_app/service/userservice.dart';

class EditUser extends StatefulWidget {
  final User user;
  const EditUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _userNameController = TextEditingController();
  final _userContactController = TextEditingController();
  final _userAddressController = TextEditingController();
  final _userLandmarkController = TextEditingController();
  final _userPincodeController = TextEditingController();
  bool _validateName = false;
  bool _validateContact = false;
  bool _validateAddress = false;
  bool _validateLandmark = false;
  bool _validatePincode = false;
  final _userService = UserService();
  @override
  void initState() {
setState(() {
  _userNameController.text=widget.user.name??''; 
  _userContactController.text=widget.user.contact??''; 
  _userAddressController.text=widget.user.address??''; 
  _userLandmarkController.text=widget.user.landmark??''; 
  _userPincodeController.text=widget.user.pincode??''; 
});   
 super.initState();
  }
  @override
  Widget build(BuildContext context) {
 return  Scaffold(
      appBar: AppBar(
        title: const Text("Update Users"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit address",
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
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Name',
                  labelText: 'Name',
                  errorText: _validateName ? 'Name Value Can\t Be Empty' : null,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userContactController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Contact',
                  labelText: 'contact',
                  errorText:
                      _validateContact ? 'Contact Value Can\t Be Empty' : null,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userAddressController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Address',
                  labelText: 'Address',
                  errorText:
                      _validateAddress ? 'Address Value Can\t Be Empty' : null,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userLandmarkController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Landmark',
                  labelText: 'Landmark',
                  errorText: _validateLandmark
                      ? 'Landmark Value Can\t Be Empty'
                      : null,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userPincodeController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Pincode',
                  labelText: 'Pincode',
                  errorText:
                      _validatePincode ? ' Pincode Value Can\t Be Empty' : null,
                ),
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
                      onPressed: () async {
                        setState(() {
                          _userNameController.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
                          _userContactController.text.isEmpty
                              ? _validateContact = true
                              : _validateContact = false;
                          _userAddressController.text.isEmpty
                              ? _validateAddress = true
                              : _validateAddress = false;
                          _userLandmarkController.text.isEmpty
                              ? _validateLandmark = true
                              : _validateLandmark = false;
                          _userPincodeController.text.isEmpty
                              ? _validatePincode = true
                              : _validatePincode = false;
                        });
                        if (_validateName == false &&
                            _validateContact == false &&
                            _validateAddress == false &&
                            _validateLandmark == false &&
                            _validatePincode == false) {
                          //print('Good Data can save');
                          var _user = User();
                          _user.id=widget.user.id;
                          _user.name = _userNameController.text;
                          _user.contact = _userContactController.text;
                          _user.address = _userAddressController.text;
                          _user.landmark = _userLandmarkController.text;
                          _user.pincode = _userPincodeController.text;
                          var result = await _userService.UpdateUser(_user);
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context,result);
                         
                        }
                      },
                      child: const Text("Update Details")),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        _userNameController.text = '';
                        _userContactController.text = '';
                        _userAddressController.text = '';
                        _userLandmarkController.text = '';
                        _userPincodeController.text = '';
                      },
                      child: const Text("clear Details")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mad3/services/firebase_auth_service.dart';

class RegisterScreen extends StatefulWidget {

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        elevation: 5,
      ),
      body: Column(
        children: [
          _logo,
          SizedBox(height: 10,),
          _emailTextField,
          _passwordTextField,
          SizedBox(height: 10,),
          _registerButton
        ],
      ),
    );
  }

  Widget get _logo {

    return Container(
        width: 100,
        child: Image.asset("assets/images/beltei_iu_logo.png")
    );
  }

  Widget get _emailTextField {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _email,
        decoration: InputDecoration(
          hintText: "Email"
        ),
      ),
    );
  }

  Widget get _passwordTextField {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _password,
        decoration: InputDecoration(
            hintText: "Password",

        ),
      ),
    );
  }

  Widget get _registerButton {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: ElevatedButton(
            onPressed: (){
              onRegisterClick();
            },
            child: Text("Register")
        ),
      ),
    );
  }

  void onRegisterClick(){

    String email = _email.text;
    print("Email : $email");
    String password = _password.text;
    print("Password :  $password");

    FirebaseAuthService().loginWithEmail(email, password)
    .then((userCredential){
      print("User : ${userCredential.user}");
      print("User  : ${userCredential.additionalUserInfo}");


      final dailog = AlertDialog(
        title: Icon(Icons.check_circle, color: Colors.greenAccent,),
        content: Text("Register successfully"),
      );
      showDialog(context: context, builder: (BuildContext context) => dailog);


    })
    .catchError((onError){
      final dailog = AlertDialog(
        title: Icon(Icons.cancel, color: Colors.red,),
        content: Text("Register Error"),
      );
      showDialog(context: context, builder: (BuildContext context) => dailog);
    });

  }

}

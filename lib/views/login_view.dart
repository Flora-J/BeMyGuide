import 'dart:convert';

import 'package:be_my_guide/models/user/user_model.dart';
import 'package:be_my_guide/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static const tag = "LoginView";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  var url = Uri.http("http:localhost:6061/login");

  Future save() async{
    var res = await http.post(url,
        headers: {"Context-Type" : "application/json"},
    body: {
        "email" : user.email,
      "password" : user.password
      });
    print(res.body);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login"),
            const SizedBox(height: 50),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (val){
                        user.email = val;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Email is empty";
                        }
                        return "";
                      },
                      controller: TextEditingController(text: user.email),
                    ),
                    const SizedBox(height: 50),
                    TextFormField(
                      onChanged: (val){
                        user.password = val;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Email is empty";
                        }
                        return "";
                      },
                      controller: TextEditingController(text: user.password),)


                  ],)
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed :() {
                  if(_formKey.currentState!.validate()){
                    save();
                  }
                },
                child: const Text("LOGIN"))
          ],

        ),
      ),
    );
  }
}
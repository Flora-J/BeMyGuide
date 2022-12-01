import 'package:be_my_guide/controllers/api_controller.dart';
import 'package:flutter/material.dart';


class GetApi extends StatefulWidget{
  const GetApi({super.key});

  @override
  State<GetApi> createState() => _StateGetApi();
  
}

class _StateGetApi extends State<GetApi>{

  List<dynamic> userNameList = [];
  Map<String, dynamic> userMap= {};

// Method to get a list of user with only id, email and password
  List<dynamic> specificUserList() {
    setState(() {
      ApiController.getUserFromApi().then((value) {
        userMap.clear();
        userNameList.clear();

        for (int i = 0; i < value.length; i++) {
          userNameList.add(userMap ={
            "id" : value[i]["id"],
            "email" : value[i]["email"],
            "password" : value[i]["password"],
          });
        }
      });
    });
    return userNameList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center
        (child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            print(specificUserList());
          },
              child: const Text("push it")
          )
        ]),
    ));
  }
  }
  

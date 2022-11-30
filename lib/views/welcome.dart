import 'package:be_my_guide/widgets/button.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/hands_helper.jpeg"),
              fit: BoxFit.cover),
          ),
        ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: const ImageIcon(
              color: Colors.white,
                AssetImage("images/eye_close.png")
          )
          ),
          const Center(
              child: Text("    Où tu iras,\n nous irons aussi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .7, left: MediaQuery.of(context).size.width *.1, right: MediaQuery.of(context).size.width *.1),
            child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 12,
                    child: button(context, "Rejoignez-nous", () => Login())),
                const SizedBox(height: 10,),
                const Text("Vous avez déja un compte ? Connectez-vous ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
}
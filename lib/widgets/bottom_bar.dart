import 'package:be_my_guide/config/colors_theme.dart';
import 'package:be_my_guide/views/my_travels_view.dart';
import 'package:be_my_guide/views/welcome_view.dart';
import 'package:flutter/material.dart';

import '../views/profil_view.dart';

Widget bottomNavigatorBar(BuildContext context) {
  int index = 0;

  return BottomNavigationBar(
      unselectedItemColor: ColorsTheme.appColor,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
            icon: ImageIcon(
                color: Colors.black,
                AssetImage("images/eye_close.png")
            ),
            label: "Accueil"),
        BottomNavigationBarItem(
            icon: Icon(Icons.near_me_outlined, 
              color: Colors.black,
            ),
          label: "Mes trajets"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,
                color: Colors.black
            ),
          label: "Mon profil"
        )
      ],
    onTap: (value) {
        switch(value) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => Welcome(title: "Bienvenue")));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => MyTravel()));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => Profil()));
            break;
        }
    },
  );
}
import 'package:be_my_guide/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

enum Gender {
  Femme,
  Homme
}

class FormTravel extends StatefulWidget {
  const FormTravel({Key? key}) : super(key: key);

  @override
  State<FormTravel> createState() => _FormTravelState();
}

class _FormTravelState extends State<FormTravel> {

  Gender? _gender = Gender.Femme;

  TextEditingController timeinput = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  final startStation = TextEditingController();
  final arrivalStation = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigatorBar(context),
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Column(
              
            )),
      ),
    );
  }
}

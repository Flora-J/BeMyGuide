import 'package:be_my_guide/config/colors_theme.dart';
import 'package:be_my_guide/views/profil_view.dart';
import 'package:be_my_guide/widgets/bottom_bar.dart';
import 'package:be_my_guide/widgets/buttons.dart';
import 'package:be_my_guide/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Gender {
  femme,
  homme,
  indifferent
}

class FormTravel extends StatefulWidget {
  const FormTravel({Key? key}) : super(key: key);

  @override
  State<FormTravel> createState() => _FormTravelState();
}

class _FormTravelState extends State<FormTravel> {

  Gender? _gender = Gender.femme;

  TextEditingController timeinput = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  final startStation = TextEditingController();
  final arrivalStation = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = "";
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
     DateTime? date = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDatePickerMode: DatePickerMode.day,
        fieldLabelText: dateinput.toString(),
        builder: (BuildContext context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                accessibleNavigation: true
              ),
              child: Theme(
              data: ThemeData.light().copyWith(
                primaryColor: ColorsTheme.appColor,
                colorScheme: const ColorScheme.light(primary: ColorsTheme.buttonColor),
                buttonTheme: const ButtonThemeData(
                    textTheme: ButtonTextTheme.normal
                ),
              ),
              child: child!));
        }
    );
    // conversion de la date en string et en format dd/mm/yyyy
    if (date != null && date != currentDate) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(date);
      setState(() {
        dateinput.text = formattedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        hourLabelText: "Heure",
        minuteLabelText: "Minute",
        builder: (BuildContext context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
                alwaysUse24HourFormat: true,
                accessibleNavigation: true
            ),
            child: Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: ColorsTheme.appColor,
              colorScheme: const ColorScheme.light(primary: ColorsTheme.buttonColor),
              buttonTheme: const ButtonThemeData(
                  textTheme: ButtonTextTheme.normal
              ),
            ),
              child: child!),
          );
        },
    );
    //conversion de l'heure en string et en format HH:mm
    if (time != null) {
      DateTime parsedTime =DateFormat.Hm().parse(time.format(context).toString());
      String formattedTime = DateFormat('HH:mm').format(parsedTime);
      setState(() {
        timeinput.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigatorBar(context),
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                inputText(context, startStation, "Départ"),
                const SizedBox(height: 20),
                inputText(context, arrivalStation, "Arrivée"),
                const SizedBox(height: 20),
                inputText(context, dateinput, "Date"),
                buttonFormForDateAndHours(context, "Choisissez une date", () => _selectDate(context)),
                const SizedBox(height: 20),
                inputText(context, timeinput, "Horaire"),
                buttonFormForDateAndHours(context, "Choisissez une heure", () => _selectTime(context)),
                const SizedBox(height: 20),
                const Text(
                   "Choisis le genre de ton accompagnant :",
                   semanticsLabel: "Choisis le genre de ton accompagnant :",
                   strutStyle: StrutStyle(fontSize: 22),
                   textAlign: TextAlign.center,
                   softWrap: false,
                 ),
                 Row(
                   mainAxisSize: MainAxisSize.min,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Flexible(
                       child: ListTile(
                         contentPadding: const EdgeInsets.symmetric(horizontal: 1),
                         title: const Text(
                           "Femme",
                           semanticsLabel: "Femme",
                           softWrap: false,
                         ),
                         leading: Radio<Gender>(
                           value: Gender.femme,
                           groupValue: _gender,
                           onChanged: (Gender? value) {
                             setState(() {
                               _gender = value;
                             });
                           },
                           activeColor: ColorsTheme.buttonColor,
                           visualDensity: VisualDensity.compact,
                         ),
                         dense: true,
                       ),
                     ),
                     Flexible(
                       child: ListTile(
                         contentPadding: const EdgeInsets.symmetric(horizontal: 1),
                         title: const Text(
                           "Homme",
                           semanticsLabel: "Homme",
                           softWrap: false,
                         ),
                         leading: Radio<Gender>(
                           value: Gender.homme,
                           groupValue: _gender,
                           onChanged: (Gender? value) {
                             setState(() {
                               _gender = value;
                             });
                           },
                           activeColor: ColorsTheme.buttonColor,
                           visualDensity: VisualDensity.compact,
                         ),
                         dense: true,
                       ),
                     ),
                     Flexible(
                       flex: 2,
                       child: ListTile(
                         contentPadding: const EdgeInsets.symmetric(horizontal: 1),
                         title: const Text(
                           "Indifférent",
                           semanticsLabel: "Indifférent",
                           softWrap: false,
                         ),
                         leading: Radio<Gender>(
                           value: Gender.indifferent,
                           groupValue: _gender,
                           onChanged: (Gender? value) {
                             setState(() {
                               _gender = value;
                             });
                           },
                           activeColor: ColorsTheme.buttonColor,
                           visualDensity: VisualDensity.compact,
                         ),
                         dense: true,
                       ),
                     ),
                   ],
                 ),
                const SizedBox(height: 40),
                buttonGeneral(context, "Valider", () => Profil())
              ],
            )
        ),
      ),
    );
  }
}

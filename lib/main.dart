import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fight_club/WidgetController/HomePage.dart';

///Metodo index dell'avvio dell'app
void main()
{
  //Impedisce la rotazione dello schermo in landscape dell'app
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown]);

  //Avvia l'applicazione con l'homepage
  runApp(new MaterialApp(
    theme: new ThemeData(fontFamily: "Ubuntu"),
    title: "FightClub",
    home: new HomePage(),
  ));
}
import 'package:fight_club/WidgetComponents/SettingsDataRounds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Classe controller del Widget che restituisce le Views per l'homepage
class HomePage extends StatefulWidget
{
  //Override dell'interfaccia Stateful Widget
  @override
  State<StatefulWidget> createState()
  {
    //Restituisce la classe con i components view
    return SettingsDataRounds();
  }
}
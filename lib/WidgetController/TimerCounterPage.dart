import 'package:fight_club/WidgetComponents/TimerRounds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fight_club/Execution/TimerRoundMethods.dart';

///Classe controller del Widget che restituisce le Views per l'homepage
class TimerCounterPage extends StatefulWidget
{

  ///Istanza alla classe TimerRoundsMethods
  late TimerRoundsMethods _timerRoundsMethods;

  ///Costruttore della classe
  TimerCounterPage(TimerRoundsMethods timerRoundsMethods, {super.key})
  {
    _timerRoundsMethods = timerRoundsMethods;
  }

  //Override dell'interfaccia Stateful Widget
  @override
  State<StatefulWidget> createState()
  {
    //Restituisce la classe con i components view
    return TimerRounds(_timerRoundsMethods);
  }
}
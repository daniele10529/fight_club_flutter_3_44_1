import 'package:flutter/cupertino.dart';
import 'package:fight_club/WidgetController/TimerCounterPage.dart';
import 'package:fight_club/Execution/TimerRoundMethods.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

///classe per la costruzione del widget TimerRound
class TimerRounds extends State<TimerCounterPage> with SingleTickerProviderStateMixin
{

  ///Istanza alla classe TimerRoundsMethods
  late TimerRoundsMethods _timerRoundsMethods;

  ///Controller
  TextEditingController _txtTimerMinuts = new TextEditingController();
  TextEditingController _txtTimerSeconds = new TextEditingController();

  bool animation = true;

  ///Costruttore della classe
  TimerRounds(TimerRoundsMethods timerRoundsMethods)
  {
    _timerRoundsMethods = timerRoundsMethods;
    //Inizializza il prestart
    _timerRoundsMethods.initPreStart(_txtTimerMinuts, _txtTimerSeconds);
    //Avvia il timer
    _timerRoundsMethods.startTimer(_txtTimerMinuts, _txtTimerSeconds);
  }

  @override
  Widget build(BuildContext context)
  {

    return new Scaffold(

      ///Evita la barre di fondo in caso di layout verticale oltre la dimensione del display
      resizeToAvoidBottomInset: false,

      ///Navigation Bar
      appBar: new AppBar(
        actions: <Widget>[
          new  Image.asset("assets/icons.png"),
        ],
        title: new Text("Boxe Rounds Counter",
          style: TextStyle(color: Colors.green, fontSize: 18,),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white70,
      ),

      ///Bodu del page
      body: Expanded(

          ///Contenitore principale
        child: Container(

          ///Colore di sfondo della pagina
          color: Color.fromARGB(255, 233, 239, 236),

            ///Colonna della pagina
            child: Column(

              ///Widget della colonna
              children: <Widget>[

                ///Contenitore con la riga del conteggio dei round
                Container(
                  ///Riga del contatore dei round
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(top:15, right: 15),
                        child: Text("ROUNDS:   " +_timerRoundsMethods.roundDone.toString() + " \\ " +_timerRoundsMethods.rounds.toString(),
                        style: TextStyle(color: Color.fromARGB(255, 6, 53, 146), fontSize: 22),),
                      ),
                    ],
                  ),
                ),

                ///Contenitore per la separazione
                Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 100,
                ),

                ///Colonna del timer
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///Indicatore della percentuale
                      CircularPercentIndicator(
                        animation: animation,
                        animateFromLastPercent: true,
                        //Calcola la durata in base al tempo impostato
                        animationDuration: _timerRoundsMethods.convertToSeconds(_txtTimerMinuts, _txtTimerSeconds)*1000,
                        radius: 150,
                        lineWidth: 20,
                        percent: 1,
                        progressColor: Color.fromARGB(255, 8, 205, 70),
                        backgroundColor: Color.fromARGB(255, 158, 234, 182),
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ///Riga del timer
                          children: [ Row(
                              children: [
                                
                                ///Casella dei minuti
                                Container(
                                  margin: EdgeInsets.only(left: 60),
                                  child: new SizedBox(
                                    width: 60,
                                    height: 70,
                                    child: new TextField(
                                      controller: _txtTimerMinuts,
                                      readOnly: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 6, 53, 146),
                                          fontSize: 40,fontFamily: "Rubik-SemiBold"),
                                    ),
                                  ),
                                ),

                                ///Casella dei puntini
                                new Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: new SizedBox(
                                    width: 30,
                                    height: 70,
                                    child: Text(":", style: TextStyle(color: Color.fromARGB(255, 6, 53, 146),fontSize: 40),
                                    ),
                                  ),
                                ),

                                ///Casella dei secondi
                                new Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: new SizedBox(
                                    width: 60,
                                    height: 70,
                                    child: new TextField(
                                      controller: _txtTimerSeconds,
                                      readOnly: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Color.fromARGB(255, 6, 53, 146),fontSize: 40,fontFamily: "Rubik-SemiBold"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                ///Pulsante di play \ pause
                Container(
                  margin: EdgeInsets.only(top: 50),
                  //Button
                  child: Row(
                    children: [
                      ///Bottone di pausa
                      Container(
                        margin: EdgeInsets.only(left: 70),
                        child: ButtonTheme(
                            minWidth: 80,
                            height: 80,
                            child: new ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 158, 234, 182),
                                // Definizione del bordo
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45),
                                  side: BorderSide(color: Colors.green, width: 2),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  animation = false;
                                  _timerRoundsMethods.timer.cancel();
                                });
                              },
                              child: Icon(Icons.pause, size: 30,)
                            )
                        ),
                      ),
                      ///Bottone di start
                      Container(
                        margin: EdgeInsets.only(left: 70),
                        child: ButtonTheme(
                            minWidth: 80,
                            height: 80,
                            child: new ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 158, 234, 182),
                                  // Definizione del bordo
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45),
                                    side: BorderSide(color: Colors.green, width: 2),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    animation = true;
                                    _timerRoundsMethods.startTimer(_txtTimerMinuts, _txtTimerSeconds, resume: true);
                                  });
                                },
                                child: Icon(Icons.play_arrow, size: 30,)
                            )
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
      ),
    );
    
  }

}
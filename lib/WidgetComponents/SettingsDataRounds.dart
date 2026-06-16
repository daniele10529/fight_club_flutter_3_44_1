import 'package:fight_club/WidgetController/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fight_club/Execution/SettingDataRoundsMethods.dart';

///Classe per la costruzione delle views della homepage
class SettingsDataRounds extends State<HomePage>
{

  ///Controller di testo
  TextEditingController _minTimerRound = new TextEditingController();
  TextEditingController _secTimerRound = new TextEditingController();
  TextEditingController _minTimerRest = new TextEditingController();
  TextEditingController _secTimerRest = new TextEditingController();
  TextEditingController _rounds = new TextEditingController();

  ///Istanza alle classi
  SettingDataRoundsMethods _settingDataRoundsMethods  = new SettingDataRoundsMethods();

  ///Costruttore della classe
  SettingsDataRounds()
  {
    //Inizializzazione delle variabili
    _minTimerRound.text = "0";
    _secTimerRound.text = "0";
    _minTimerRest.text = "0";
    _secTimerRest.text = "0";
    _rounds.text = "0";
  }

  ///Metodo per la costruzione del Widget
  @override
  Widget build(BuildContext context)
  {

    ///Contenitore principale dell'applicazione
    return new Scaffold(

      ///Evita la barre di fondo in caso di layout verticale oltre la dimensione del display
      resizeToAvoidBottomInset: false,

      ///Navigation Bar
      appBar: new AppBar(
        actions: <Widget>[
          new  Image.asset("assets/icons.png"),
        ],
        title: new Text("Boxe Rounds Counter",
          style: TextStyle(color: Colors.green, fontSize: 24,),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white70,
      ),

      ///Body della pagina
      body: new Container(

        ///Colore di sfondo della pagina
        color: Color.fromARGB(255, 233, 239, 236),

        ///Colonna principale
        child:  Expanded(child: Column(

          //Widget della colonna
          children: <Widget>[

            ///Intestazione delle serie eseguite
            new Container(
              margin: EdgeInsets.only(top: 5),
              child: new Center(
                child: Text("TEMPO DEL ROUND",
                  style: TextStyle(color: Color.fromARGB(255, 4, 50, 50),fontSize: 14,),
                ),
              ),
            ),
            ///Contenitore del tempo di round
            Container(
              margin: EdgeInsets.only(top: 5, right: 15, left: 15),
              alignment: Alignment.center,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(120, 75, 160, 6)),
                borderRadius: BorderRadius.circular(10.0),
              ),

              ///Riga del timer di round
              child:
              Row(

                children: [

                  ///Casella dei minuti
                  new Container(
                    margin: EdgeInsets.only(top: 5, left: 15),
                    child: new SizedBox(
                      width: 30,
                      height: 30,
                      child: new TextField(
                        controller: _minTimerRound,
                        readOnly: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromARGB(255, 6, 53, 146),fontSize: 20,fontFamily: "Rubik-SemiBold"),
                      ),
                    ),
                  ),

                  ///Casella dei puntini
                  new Container(
                    margin: EdgeInsets.only(top: 5, left: 30),
                    child: new SizedBox(
                      width: 30,
                      height: 30,
                      child: Text(":", style: TextStyle(color: Color.fromARGB(
                          200, 1, 23, 24),fontSize: 30),
                      ),
                    ),
                  ),

                  ///Casella dei secondi
                  new Container(
                    margin: EdgeInsets.only(top: 5, left: 15),
                    child: new SizedBox(
                      width: 30,
                      height: 30,
                      child: new TextField(
                        controller: _secTimerRound,
                        readOnly: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromARGB(255, 6, 53, 146),fontSize: 20,fontFamily: "Rubik-SemiBold"),
                      ),
                    ),
                  ),

                  ///Contenitore del pulsante +
                  Container(
                    margin: EdgeInsets.only(top: 5,left: 30),
                    child: ButtonTheme(
                      minWidth: 20.0,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: (){
                          _settingDataRoundsMethods.incriseTimerRound(_minTimerRound, _secTimerRound);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Color.fromARGB(255, 233, 239, 236),
                        ),
                        child: Text("+",
                          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0),fontSize: 14),
                        ),
                      ),
                    ),
                  ),

                  ///Contenitore del pulsante -
                  new Container(
                    margin: EdgeInsets.only(top: 5,left: 15),
                    child: ButtonTheme(
                      minWidth: 20.0,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: (){
                          _settingDataRoundsMethods.decriseTimerRound(_minTimerRound, _secTimerRound);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Color.fromARGB(255, 233, 239, 236),
                        ),
                        child: Text("-",
                          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0),fontSize: 16),
                        ),
                      ),
                    ),
                  ),

                ],

              ),


            ),

            ///Intestazione del tempo di recupero
            new Container(
              margin: EdgeInsets.only(top: 10),
              child: new Center(
                child: Text("TEMPO DI RECUPERO",
                  style: TextStyle(color: Color.fromARGB(255, 4, 50, 50),fontSize: 14),
                ),
              ),
            ),
            ///Contenitore del tempo di recupero
            Container(
              margin: EdgeInsets.only(top: 5, right: 15, left: 15),
              alignment: Alignment.center,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(120, 75, 160, 6)),
                borderRadius: BorderRadius.circular(10.0),
              ),

              ///Riga del timer di recupero
              child: new Row(

                children: [
                  ///Casella dei minuti
                  new Container(
                    margin: EdgeInsets.only(top: 5, left: 15),
                    child: new SizedBox(
                      width: 30,
                      height: 30,
                      child: new TextField(
                        controller: _minTimerRest,
                        readOnly: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromARGB(255, 6, 53, 146),fontSize: 20,fontFamily: "Rubik-SemiBold"),
                      ),
                    ),
                  ),

                  ///Casella dei puntini
                  new Container(
                    margin: EdgeInsets.only(top: 5, left: 30),
                    child: new SizedBox(
                      width: 30,
                      height: 30,
                      child: Text(":", style: TextStyle(color: Color.fromARGB(
                          200, 1, 23, 24),fontSize: 30),
                      ),
                    ),
                  ),

                  ///Casella dei secondi
                  new Container(
                    margin: EdgeInsets.only(top: 5, left: 15),
                    child: new SizedBox(
                      width: 30,
                      height: 30,
                      child: new TextField(
                        controller: _secTimerRest,
                        readOnly: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromARGB(255, 6, 53, 146),fontSize: 20,fontFamily: "Rubik-SemiBold"),
                      ),
                    ),
                  ),

                  ///Contenitore del pulsante +
                  new Container(
                    margin: EdgeInsets.only(top: 5,left: 30),
                    child: ButtonTheme(
                      minWidth: 20.0,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: (){
                          _settingDataRoundsMethods.upTimerRest(_minTimerRest, _secTimerRest);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Color.fromARGB(255, 233, 239, 236),
                        ),
                        child: Text("+",
                          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0),fontSize: 14),
                        ),
                      ),
                    ),
                  ),

                  ///Contenitore del pulsante -
                  new Container(
                    margin: EdgeInsets.only(top: 5,left: 15),
                    child: ButtonTheme(
                      minWidth: 20.0,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: (){
                          _settingDataRoundsMethods.decriseTimerRest(_minTimerRest, _secTimerRest);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Color.fromARGB(255, 233, 239, 236),
                        ),
                        child: Text("-",
                          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0),fontSize: 16),
                        ),
                      ),
                    ),
                  ),

                ],

              ),

            ),

            ///Intestazione dei round da fare
            new Container(
              margin: EdgeInsets.only(top: 10),
              child: new Center(
                child: Text("NUMERO DI ROUND",
                  style: TextStyle(color: Color.fromARGB(255, 4, 50, 50),fontSize: 14),
                ),
              ),
            ),
            ///Contenitore del numero di round
            Container(
              margin: EdgeInsets.only(top: 5, right: 15, left: 15),
              alignment: Alignment.center,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(120, 75, 160, 6)),
                borderRadius: BorderRadius.circular(10.0),
              ),

              ///Riga del numero di round
              child: new Row(

                children: [
                  ///Casella dei minuti
                  new Container(
                    margin: EdgeInsets.only(top: 5, left: 20),
                    child: new SizedBox(
                      width: 50,
                      height: 50,
                      child: new TextField(
                        controller: _rounds,
                        readOnly: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromARGB(255, 6, 53, 146),fontSize: 20,fontFamily: "Rubik-SemiBold"),
                      ),
                    ),
                  ),

                  ///Contenitore del pulsante +
                  new Container(
                    margin: EdgeInsets.only(top: 5,left: 115),
                    child: ButtonTheme(
                      minWidth: 20.0,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: (){
                          _settingDataRoundsMethods.incriseRound(_rounds);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Color.fromARGB(255, 233, 239, 236),
                        ),
                        child: Text("+",
                          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0),fontSize: 14),
                        ),
                      ),
                    ),
                  ),

                  ///Contenitore del pulsante -
                  new Container(
                    margin: EdgeInsets.only(top: 5,left: 10),
                    child: ButtonTheme(
                      minWidth: 20.0,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: (){
                          _settingDataRoundsMethods.decriseRound(_rounds);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Color.fromARGB(255, 233, 239, 236),
                        ),
                        child: Text("-",
                          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0),fontSize: 16),
                        ),
                      ),
                    ),
                  ),

                ],

              ),

            ),

            ///Contenitore del play
            Container(
              margin: EdgeInsets.only(top: 30, right: 2, left: 2),
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(120, 31, 92, 3),
                borderRadius: BorderRadius.circular(10.0),
              ),
              //Contenitore del pulsante
              child: new Center(
                //Button
                child: ButtonTheme(
                    minWidth: 80,
                    height: 80,
                    child: new ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 88, 107, 201),
                        // Definizione del bordo
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                          side: BorderSide(color: Colors.green, width: 2),
                        ),
                      ),

                      onPressed: () {
                        _settingDataRoundsMethods.goTo(_minTimerRound, _secTimerRound, _minTimerRest, _secTimerRest, _rounds, context);
                      },
                      child: Text("GO!",
                        style: TextStyle(color: Color.fromARGB(
                            255, 203, 208, 241),fontSize: 14),
                      ),
                    )
                ),
              ),
            ),

          ],

        ),



        ),


      ),

    );

  }

}
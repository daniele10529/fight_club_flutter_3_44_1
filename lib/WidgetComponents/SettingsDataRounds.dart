import 'package:fight_club/WidgetController/HomePage.dart';
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

  ///Istanza alla classe SettingDataRoundsMethods
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
    return SafeArea(
      child: Scaffold(

        ///Evita la barre di fondo in caso di layout verticale oltre la dimensione del display
        resizeToAvoidBottomInset: false,

        ///Navigation Bar
        appBar: AppBar(
          actions: <Widget>[
            new  Image.asset("assets/icons.png"),
          ],
          title: Text("Boxe Rounds Counter",
            style: TextStyle(color: Colors.green, fontSize: 24,),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white70,
        ),

        ///Body della pagina
        body: Container(

          ///Impostazione del colore di sfondo
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 170, 172, 172),
                Color.fromARGB(255, 233, 239, 236),
              ],
              begin: FractionalOffset(0.5, 1),
            ),
          ),

          ///Colonna principale
          child:
          Expanded(child:
          Column(

            //Widget della colonna
            children: <Widget>[

              ///Intestazione delle serie eseguite
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Center(
                  child: Text("TEMPO DEL ROUND",
                    style: TextStyle(
                      color: Color.fromARGB(255, 152, 4, 23),
                      fontSize: 14,
                      fontWeight: FontWeight(700)
                    ),
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
                child: Row(
                  children: [
                    ///Casella dei minuti
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 15),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: TextField(
                          controller: _minTimerRound,
                          readOnly: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 6, 53, 146),
                              fontSize: 20,
                              fontFamily: "Rubik-SemiBold",
                              fontWeight: FontWeight(500)
                          ),
                        ),
                      ),
                    ),

                    ///Casella dei puntini
                    new Container(
                      margin: EdgeInsets.only(top: 5, left: 30),
                      child: new SizedBox(
                        width: 30,
                        height: 35,
                        child: Text(":", style: TextStyle(color: Color.fromARGB(200, 1, 23, 24),
                            fontSize: 25,
                            fontWeight: FontWeight(700)
                          ),
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
                          style: TextStyle(
                              color: Color.fromARGB(255, 6, 53, 146),
                              fontSize: 20,
                              fontFamily: "Rubik-SemiBold",
                              fontWeight: FontWeight(700)
                          ),
                        ),
                      ),
                    ),

                    ///Contenitore del pulsante +
                    Container(
                      margin: EdgeInsets.only(top: 5,left: 30),
                      child: ButtonTheme(
                        minWidth: 10.0,
                        height: 10.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 175, 172, 172),
                                blurRadius: 10,
                                offset: const Offset(1, 5), // Spostamento dell'ombra (X, Y)
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: (){
                              //Incrementa il tempo di round
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
                    ),

                    ///Contenitore del pulsante -
                    new Container(
                      margin: EdgeInsets.only(top: 5,left: 15),
                      child: ButtonTheme(
                        minWidth: 20.0,
                        height: 40.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 175, 172, 172),
                                blurRadius: 10,
                                offset: const Offset(1, 5), // Spostamento dell'ombra (X, Y)
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: (){
                              //Decrementa il tempo di round
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
                    ),

                  ],

                ),


              ),

              ///Intestazione del tempo di recupero
              new Container(
                margin: EdgeInsets.only(top: 10),
                child: new Center(
                  child: Text("TEMPO DI RECUPERO",
                    style: TextStyle(
                        color: Color.fromARGB(255, 152, 4, 23),
                        fontSize: 14,
                        fontWeight: FontWeight(700)
                    ),
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
                          style: TextStyle(
                              color: Color.fromARGB(255, 6, 53, 146),
                              fontSize: 20,
                              fontFamily: "Rubik-SemiBold",
                              fontWeight: FontWeight(700)
                          ),
                        ),
                      ),
                    ),

                    ///Casella dei puntini
                    new Container(
                      margin: EdgeInsets.only(top: 5, left: 30),
                      child: new SizedBox(
                        width: 30,
                        height: 35,
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
                          style: TextStyle(
                              color: Color.fromARGB(255, 6, 53, 146),
                              fontSize: 20,
                              fontFamily: "Rubik-SemiBold",
                              fontWeight: FontWeight(700)
                          ),
                        ),
                      ),
                    ),

                    ///Contenitore del pulsante +
                    new Container(
                      margin: EdgeInsets.only(top: 5,left: 30),
                      child: ButtonTheme(
                        minWidth: 20.0,
                        height: 40.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 175, 172, 172),
                                blurRadius: 10,
                                offset: const Offset(1, 5), // Spostamento dell'ombra (X, Y)
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: (){
                              //Incrementa il tempo di riposo
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
                    ),

                    ///Contenitore del pulsante -
                    new Container(
                      margin: EdgeInsets.only(top: 5,left: 15),
                      child: ButtonTheme(
                        minWidth: 20.0,
                        height: 40.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 175, 172, 172),
                                blurRadius: 10,
                                offset: const Offset(1, 5), // Spostamento dell'ombra (X, Y)
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: (){
                              //Decrementa il tempo di riposo
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
                    ),

                  ],

                ),

              ),

              ///Intestazione dei round da fare
              new Container(
                margin: EdgeInsets.only(top: 10),
                child: new Center(
                  child: Text("NUMERO DI ROUND",
                    style: TextStyle(
                        color: Color.fromARGB(255, 152, 4, 23),
                        fontSize: 14,
                        fontWeight: FontWeight(700)
                    ),
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
                          style: TextStyle(
                              color: Color.fromARGB(255, 6, 53, 146),
                              fontSize: 20,
                              fontFamily: "Rubik-SemiBold",
                              fontWeight: FontWeight(700)
                          ),
                        ),
                      ),
                    ),

                    ///Contenitore del pulsante +
                    new Container(
                      margin: EdgeInsets.only(top: 5,left: 115),
                      child: ButtonTheme(
                        minWidth: 20.0,
                        height: 40.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 175, 172, 172),
                                blurRadius: 10,
                                offset: const Offset(1, 5), // Spostamento dell'ombra (X, Y)
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: (){
                              //Incrementa i round
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
                    ),

                    ///Contenitore del pulsante -
                    new Container(
                      margin: EdgeInsets.only(top: 5,left: 10),
                      child: ButtonTheme(
                        minWidth: 20.0,
                        height: 40.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 175, 172, 172),
                                blurRadius: 10,
                                offset: const Offset(1, 5), // Spostamento dell'ombra (X, Y)
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: (){
                              //Decrementa i round
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
                    ),

                  ],

                ),

              ),

              ///Contenitore del play
              Container(
                margin: EdgeInsets.only(top: 30, right: 2, left: 2),
                height: 130,
                decoration: BoxDecoration(
                  color: Color.fromARGB(120, 31, 92, 3),
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(120, 31, 92, 3),
                        Color.fromARGB(255, 6, 181, 98),
                      ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  )
                ),
                //Contenitore del pulsante
                child: Center(
                  //Button
                  child: ButtonTheme(
                      minWidth: 20,
                      height: 20,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 166, 243, 166),
                              blurRadius: 30,
                              offset: const Offset(1, 5), // Spostamento dell'ombra (X, Y)
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 174, 184, 232),
                            // Definizione del bordo
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45),
                              side: BorderSide(color: Colors.green, width: 2),
                            ),
                          ),
                          onPressed: () {
                            //Indirizza alla pagina del timer
                            _settingDataRoundsMethods
                                .goTo(_minTimerRound, _secTimerRound, _minTimerRest,
                                _secTimerRest, _rounds, context);
                          },
                          child: Text("START",
                            style: TextStyle(color: Color.fromARGB(
                                255, 1, 15, 110),fontSize: 14),
                          ),
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
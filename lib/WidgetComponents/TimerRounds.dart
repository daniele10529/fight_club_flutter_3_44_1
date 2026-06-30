import 'dart:async';
import 'package:fight_club/WidgetController/TimerCounterPage.dart';
import 'package:fight_club/Execution/SettingTimerRounds.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter/services.dart';

///classe per la costruzione del widget TimerRound
class TimerRounds extends State<TimerCounterPage> with TimerRoundsMethod
{

  ///Istanza alla classe SettingTimerRounds
  SettingTimerRounds _settingTimerRounds;

  ///Costruttore della classe
  TimerRounds(this._settingTimerRounds)
  {
    //Inizializza il prestart
    _initPreStart();
    //Avvia il timer
    _startTimer();
  }

  ///Metodo per avviare il timer
  ///Deve rimanere obbligatoriamente in questa classe
  ///per lo stato del widget
  void _startTimer({bool resume = false})
  {
    //Se non è il restart del timer inizializza i valori
    //di incremento del circular percent
    if (!resume)
    {
      //Azzera il valore di percentuale
      _percent = 0.0;
      //Calcola i secondi totali
      seconds = _convertToSeconds();
      //Calcola la percentuale da incrementare
      valToIncrease = 1 / seconds;
    }

    //Verifica se il timer non è attivo lo avvia
    if (_timerInRunning == false)
    {
      //Setta il timer sullo stato avviato
      _timerInRunning = true;
      //Setta il timer
      _timer = Timer.periodic(Duration(seconds: 1), (timer)
      {

        //Aggiorna lo stato del widget
        setState(()
        {
          //Verifica se deve scalare i secondi
          if (_secToDo > 0 || (_secToDo == 0 && _minToDo >= 1))
          {
            //Incrementa la percentuale
            _percent += valToIncrease;
            //Decrementa i secondi
            _secToDo--;

            //Verifica se decrementare i minuti
            if (_secToDo <= 0 && _minToDo >= 1)
            {
              _secToDo = 59;
              _minToDo--;
            }

            //Se il timer è arrivato a 0 lo arresta
            if (_secToDo == 0 && _minToDo == 0)
            {
              //Arresta il timer
              _timer.cancel();
              //Avvia la riproduzione audio
              _startSound();
              //Imposta lo stato
              _timerInRunning = false;

              //Verifica se era avviato dal prestart
              //lo annulla
              if(_preStart) _preStart = false;

              //Verifica se lo stato non è in boxing
              if(!_boxing)
              {
                //Setta lo stato a boxing
                _boxing = true;
                //Ricava i minuti di boxe
                _minToDo = _settingTimerRounds.minTimerRound;
                //Ricava i secondi di boxe
                _secToDo  = _settingTimerRounds.secTimerRound;
                //Incrementa i round
                _roundDone ++;
                //Riavvia il timer
                _startTimer();
              }
              //Altrimenti imposta i tempi di recupero
              else
              {
                //Verifica il numero di round
                if(_roundDone == _settingTimerRounds.rounds)
                {
                  //Arresta il timer
                  _timer.cancel();
                  //Azzera la percentuale
                  _percent = 0.0;
                  //Setta il completamento del training
                  _trainingCompleted = true;
                  //Setta lo stato di boxing
                  _boxing = false;
                }
                //Se il numero di round fatti è inferiore a quelli
                //da fare avvia il riposo
                else
                {
                  //Setta lo stato di boxing
                  _boxing = false;
                  //Ricava i minuti di riposo
                  _minToDo = _settingTimerRounds.minTimerRest;
                  //Ricava i secondi di riposo
                  _secToDo = _settingTimerRounds.secTimerRest;
                  //Riavvia il timer
                  _startTimer();
                }
              }
            }
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    ///Area princiale della pagina
    return SafeArea(
      child: new Scaffold(
        ///Evita la barre di fondo in caso di layout verticale oltre la dimensione del display
        resizeToAvoidBottomInset: false,

        ///Navigation Bar
        appBar: new AppBar(
          actions: <Widget>[new Image.asset("assets/icons.png")],
          title: new Text(
            "Boxe Rounds Counter",
            style: TextStyle(color: Colors.green, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white70,
        ),

        ///Body del page
        body:
            ///Contenitore principale
            Container(
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

              ///Definizione della larghezza del contenitore
              width: double.infinity,

              ///Colonna principale
              child: Column(
                ///Allineamento degli assi
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,

                ///Elementi della colonna
                children: [

                  ///Colonna dei round
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: 15, right: 15),
                          child: Text(
                            "ROUNDS:   " +
                                _roundDone.toString() +
                                " \\ " +
                                _settingTimerRounds.rounds.toString(),
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 53, 146),
                                fontSize: 18,
                                fontWeight: FontWeight(500)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///Contenitore di separazione
                  SizedBox(height: 25),

                  ///Indicatore circolare del timer
                  Container(
                    child: CircularPercentIndicator(
                      animation: true,
                      animateFromLastPercent: true,
                      animationDuration: _convertToSeconds() * 1000,
                      radius: 120,
                      lineWidth: 10,
                      percent: _percent,
                      progressColor: Color.fromARGB(255, 10, 168, 225),
                      backgroundColor: Color.fromARGB(255, 36, 218, 93),
                      circularStrokeCap: CircularStrokeCap.round,
                      center:
                      ///Testo interno all'indicatore
                      Text(
                        "$_minToDo : $_secToDo",
                        style: TextStyle(
                          color: Color.fromARGB(255, 6, 53, 146),
                          fontSize: 40,
                          fontFamily: "Rubik-SemiBold",
                        ),
                      ),
                    ),
                  ),

                  ///Pulsante di play \ pause
                  Container(
                    margin: EdgeInsets.only(top: 55),

                    ///Colonna dei pulsanti
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ///Riga dei pulsanti
                        Row(
                          children: [
                            ///Restituisce il pulsante in baso allo stato
                            ///del timer
                            buildButtons(),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 15),
                                child: Text(_statusTraining(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 6, 53, 146),
                                      fontSize: 20,
                                      fontWeight: FontWeight(900)
                                  ),
                                ),
                              ),
                            ],
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

  ///Metodo Widget per la costruzione alternata dei pulsanti
  ///Deve rimanere obbligatoriamente all'interno di questa classe
  ///per lo stato del widget
   Widget buildButtons()
  {
    ///Verifica lo stato del timer
    final isRunning = _timer.isActive ?  true : false;

    ///Definisce lo stato del timer per lo start
    _timerInRunning = isRunning ? true : false;

    return isRunning
        ? ///Restituisce il pulsante di pausa se timer in running
          ///Bottone di pausa
          Container(
            margin: EdgeInsets.only(left: 140),
            child: ButtonTheme(
              minWidth: 80,
              height: 80,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(240, 76, 73, 73),
                      blurRadius: 5,
                      offset: const Offset(1, 5), // Spostamento dell'ombra (X, Y)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 158, 234, 182),
                    shadowColor: Color.fromARGB(240, 30, 29, 29),
                    ///Definizione del bordo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                      side: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      //Mette in pausa il timer
                      _timer.cancel();
                    });
                  },
                  child: Icon(Icons.pause, size: 30),
                ),
              ),
            ),
          )
        : ///Restituisce il pulsante di start se il timer in stop
          ///Bottone di start
          Container(
            margin: EdgeInsets.only(left: 140),
            child: ButtonTheme(
              minWidth: 80,
              height: 80,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(240, 76, 73, 73),
                      blurRadius: 5,
                      offset: const Offset(1, 5), // Spostamento dell'ombra (X, Y)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 158, 234, 182),
                    shadowColor: Color.fromARGB(240, 30, 29, 29),
                    ///Definizione del bordo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                      side: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                  onPressed: () {
                    //Verifica se l'allenamento è completato
                    if(_trainingCompleted)
                    {
                      //Inizializza il numero di round
                      _roundDone = 0;
                      //Inizializza il prestart
                      _preStart = true;
                      //Risetta il completamento del training
                      _trainingCompleted = false;
                      //Inizializza i valori prestart
                      _initPreStart();
                      //Avvia il timer
                      _startTimer();
                    }
                    //Altrimenti ripristina il timer
                    else
                    {
                      //Ripristina il timer
                      _startTimer(resume: true);
                    }
                  },
                  child: Icon(Icons.play_arrow, size: 30),
                ),
              ),
            ),
          );
  }
}

///Estensione della classe TimerRounds per i metodi
///non può essere messa in un file diverso
mixin TimerRoundsMethod
{

  ///Attributi privati
  bool _timerInRunning = false;
  bool _boxing = false;
  bool _trainingCompleted = false;
  late Timer _timer;
  double _percent = 0.0;
  bool _preStart = true;
  int _roundDone = 0;
  int seconds = 0;
  double valToIncrease = 0.0;
  int _minToDo = 0;
  int _secToDo = 0;
  String _testo = "";

  /// Definisce il canale univoco per l'esecuzione del metodo in kotlin
  static const platform = MethodChannel('com.daam/daam_channel');

  /// Funzione per riprodurre il suono dal metodo in kotlin
  Future<void> _startSound() async
  {
    try
    {
      //Ricava il risultato del response invocando il metodo
      final String risultato = await platform.invokeMethod('startSound');
      //Ricava il valore di response
      _testo = risultato;
    }
    on PlatformException catch (e)
    {//In caso si generi un'eccezione sul metodo
      //rilascia il testo dell'werrore
      _testo = "Errore: ${e.message}";
    }
  }

  ///Metodo per ricavare il numero totale di secondi
  int _convertToSeconds()
  {
    //Inizializza i valori del timer
    int min = _minToDo;
    int sec = _secToDo;
    //Inizializza il valore da restituire
    int totalSeconds = (min * 60) + sec;
    //Restituisce il valore
    return totalSeconds;
  }

   ///Metodo per l'inizializzazione del prestart
   void _initPreStart()
  {
    //Verifica che effettivamente sia il prestart
    if (_preStart)
    {
      //Inizializza i valori del tempo di prestart
      _minToDo = 0;
      _secToDo = 10;
    }
  }

  ///Metodo per la verifica dello stato del training
  String _statusTraining()
  {
    String status = "";
    //Verifica lo stato di errore nella riproduzione audio
    if(!(_testo == "ok"))
    {
      status = _testo;
      return status;
    }
    //Verifica lo stato di prestart
    if(_preStart)
    {
      status = "READY TO START";
      return status;
    }
    //Verifica lo stato di fine allenamento
    if(_trainingCompleted)
    {
      status = "FINE ALLENAMENTO";
      return status;
    }
    //Verifica lo stato di boxing
    if(_boxing)
    {
      status = "BOXING";
      return status;
    }
    else
    {
      status = "RECUPERO";
      return status;
    }
  }
}
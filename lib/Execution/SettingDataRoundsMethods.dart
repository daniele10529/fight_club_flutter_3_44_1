import 'package:fight_club/WidgetController/TimerCounterPage.dart';
import 'package:flutter/material.dart';
import 'package:fight_club/Execution/SettingTimerRounds.dart';

///Classe per la gestione del setting di SettingsDataRounds
class SettingDataRoundsMethods
{
  ///Metodo per incrementare il timer dei round
  void incriseTimerRound(TextEditingController minTimerRound, TextEditingController secTimerRound)
  {
    //inizializza l'attributo di incremento
    int min = int.parse(minTimerRound.text);
    int sec = int.parse(secTimerRound.text);
    //Incrementa il valore di 10 secondi
    sec += 10;
    //Verifica se i secondi sono a 60, incrementa i minuti
    if(sec >= 60)
    {
      //Azzera i secondi
      sec = 0;
      //Incrementa i minuti
      min ++;
    }
    //Assegna il valore al controller dei minuti
    minTimerRound.text = min.toString();
    //Assegna il valore al controller dei seco,
    secTimerRound.text = sec.toString();
  }

  ///Metodo per decrementare il timer dei round
  void decriseTimerRound(TextEditingController minTimerRound, TextEditingController secTimerRound)
  {
    //inizializza l'attributo di incremento
    int min = int.parse(minTimerRound.text);
    int sec = int.parse(secTimerRound.text);

    //Verifica ci siano secondi da decrescere
    if(sec > 0 || (sec == 0 && min >= 1))
    {
      //Deccrementa il valore di 10 secondi
      sec -= 10;
      //Verifica se i secondi sono a 0, decrementa i minuti
      if(sec < 0 && min >= 1)
      {
        //Setta i secondi a 50
        sec = 50;
        //Decrementa il minuto
        min--;
      }
      //Assegna il valore al controller dei minuti
      minTimerRound.text = min.toString();
      //Assegna il valore al controller dei secondi
      secTimerRound.text = sec.toString();
    }
  }

  ///Metodo per incrementare il timer del riposo
  void upTimerRest(TextEditingController minTimerRest, TextEditingController secTimerRest)
  {
    //inizializza l'attributo di incremento
    int min = int.parse(minTimerRest.text);
    int sec = int.parse(secTimerRest.text);
    //Incrementa il valore di 10 secondi
    sec += 10;
    //Verifica se i secondi sono a 60, incrementa i minuti
    if(sec >= 60)
    {
      //Azzera i secondi
      sec = 0;
      //Incrementa i minuti
      min ++;
    }
    //Assegna il valore al controller dei minuti
    minTimerRest.text = min.toString();
    //Assegna il valore al controller dei secondi
    secTimerRest.text = sec.toString();
  }

  ///Metodo per decrementare il timer del riposo
  void decriseTimerRest(TextEditingController minTimerRest, TextEditingController secTimerRest)
  {
    //inizializza l'attributo di incremento
    int min = int.parse(minTimerRest.text);
    int sec = int.parse(secTimerRest.text);

    //Verifica ci siano secondi da decrescere
    if(sec > 0 || (sec == 0 && min >= 1))
    {
      //Deccrementa il valore di 10 secondi
      sec -= 10;
      //Verifica se i secondi sono a 60, incrementa i minuti
      if(sec < 0 && min >= 1)
      {
        //Setta i secondi a 50
        sec = 50;
        //Decrementa il minuto
        min--;
      }
      //Assegna il valore al controller dei minuti
      minTimerRest.text = min.toString();
      //Assegna il valore al controller dei secondi
      secTimerRest.text = sec.toString();
    }
  }

  ///Metodo per incrementare il numero di round
  void incriseRound(TextEditingController rounds)
  {
    //inizializza l'attributo di incremento
    int value = int.parse(rounds.text);
    //Incrementa il valore di 10 secondi
    value ++;
    //Assegna il valore al controller dei minuti
    rounds.text = value.toString();
  }

  ///Metodo per decrementare il numero di round
  void decriseRound(TextEditingController rounds)
  {
    //inizializza l'attributo di incremento
    int value = int.parse(rounds.text);
    //Verifica che il valore sia maggiore di 0 e lo decrementa
    if(value > 0) { value--; }
    //Assegna il valore al controller dei minuti
    rounds.text = value.toString();
  }

  ///Metodo per indirizzare alla pagina di esecuzione del timer
   void goTo(TextEditingController minTimerRound, TextEditingController secTimerRound,TextEditingController minTimerRest, TextEditingController secTimerRest,TextEditingController rounds, BuildContext context)
  {
    //Inizializza i parametri da passare all'oggetto TimerRoundsMethods
    int _minTimerRound = int.parse(minTimerRound.text);
    int _secTimerRound = int.parse(secTimerRound.text);
    int _minTimerRest = int.parse(minTimerRest.text);
    int _secTimerRest = int.parse(secTimerRest.text);
    int _rounds = int.parse(rounds.text);
    
    //Verifica che ci siano tutti i campi impostati per avviare il timer
    bool timeSetting = _minTimerRound == 0 && _secTimerRound == 0 ? false : true;
    bool restSetting = _minTimerRest == 0 && _secTimerRest == 0 ? false : true;
    bool roundsSetting = _rounds == 0 ? false : true;
    bool readyToGo = timeSetting && restSetting && roundsSetting ? true : false;

    //Se tutti i campo sono impostati indirizza alla pagina del timer
    if(readyToGo)
    {
      //Istanza alla classe SettingTimerRounds
      SettingTimerRounds _settingTimerRounds =
      new SettingTimerRounds(
          _minTimerRound, _secTimerRound, _minTimerRest, _secTimerRest, _rounds);
      //Indirizza alla pagina del timer
      Navigator.push(context,
          MaterialPageRoute(builder:
              (context) => TimerCounterPage(_settingTimerRounds)));
    }
    else
    {
      //Altrimenti apre un allert dialog con il warning
      showDialog(context: context, builder: (BuildContext context)
        => AlertDialog(
          //Titolo del dialog
            title: Text("WARNING",
              style: TextStyle(
                  color: Color.fromARGB(255, 152, 4, 23),
                  fontSize: 14,
                  fontWeight: FontWeight(700)
              ),
              textAlign: TextAlign.center,
            ),
            //Contenuto del dialog
            content: Text("Tutti i campi devono essere completati per avviare il timer",
              style: TextStyle(
                  color: Color.fromARGB(255, 45, 7, 101),
                  fontSize: 14,
                  fontWeight: FontWeight(700)
              ),
              textAlign: TextAlign.justify,
            ),
            //Pulsante del dialog
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  //Chiude il Dialog
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
      );
    }
  }
}
import 'dart:async';
import 'package:flutter/material.dart';

///Classe per la gestione dei metodi del widget TimerRound
class TimerRoundsMethods
{
  ///Attributi privati
  int _minTimerRound;
  int _secTimerRound;
  int _minTimerRest;
  int _secTimerRest;
  int _rounds;
  int _roundDone = 0;
  int _minToDo = 0;
  int _secToDo = 0;
  bool _preStart = true;
  late Timer _timer;
  bool _timerInRunning = false;
  late bool _setAnimationActive = false;

  ///Costruttore della classe
  TimerRoundsMethods(this._minTimerRound, this._secTimerRound,
      this._minTimerRest, this._secTimerRest, this._rounds);

  ///Getter per i minuti del round
  int get minTimerRound => _minTimerRound;
  ///Getter per i secondi del round
  int get secTimerRound => _secTimerRound;
  ///Getter per i minuti di riposo
  int get minTimerRest => _minTimerRest;
  ///Setter per i minuti di riposo
  int get secTimerRest => _secTimerRest;
  ///Getter per il numero di round
  int get rounds => _rounds;
  ///Getter dei round fatti
  int get roundDone => _roundDone;
  ///Getter dello stato di prestart
  bool get preStart => _preStart;
  ///Getter per lo stato dell'animazione
  bool get setAnimationActive => _setAnimationActive;
  ///Getter del timer
  Timer get timer => _timer;

  ///Setter per lo stato dell'animazione
  set setAnimationActive(bool value)
  {
    _setAnimationActive = value;
  }
  ///Setter del timer
  set timer(Timer value)
  {
    _timer = value;
  }

  ///Metodo per l'inizializzazione del prestart
  void initPreStart(TextEditingController _txtTimerMinuts, TextEditingController _txtTimerSeconds)
  {
    //Verifica che effettivamente sia il prestart
    if(_preStart)
    {
      //Inizializza i valori di prestart
      _txtTimerMinuts.text = "0";
      _txtTimerSeconds.text = "10";
      _preStart = false;
      //Inizializza l'animazione
      setAnimationActive = true;
    }
  }

  ///Metodo per avviare il timer
  void startTimer(TextEditingController _txtTimerMinuts, TextEditingController _txtTimerSeconds, {bool resume = false})
  {

    //Se è una ripresa dalla pausa non aumenta il round
    if(!resume)
    {
      //Inizializza il round
      _roundDone ++;
    }

    //Inizializza i valori del timer
    _minToDo = int.parse(_txtTimerMinuts.text);
    _secToDo = int.parse(_txtTimerSeconds.text);

    //Verifica se il timer non è attivo lo avvia
    if(_timerInRunning == false)
    {
      //Setta il timer
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        //Verifica se deve scalare i secondi
        if(_secToDo > 0 || (_secToDo == 0 && _minToDo > 1))
        {
          //Decrementa i secondi
          _secToDo --;
          //Verifica se decrementare i minuti
          if(_secToDo < 0 && _minToDo >= 1)
          {
            _secToDo = 59;
            _minToDo --;
          }
        }

        //Assegna i valori del timer alle caselle di testo
        _txtTimerMinuts.text = _minToDo.toString();
        _txtTimerSeconds.text = _secToDo.toString();
        //Inizializza l'animazione
        setAnimationActive = true;

      });
    }
    //Altrimenti ferma il timer
    else
    {
      //Arresta il timer
      _timer.cancel();
      //Cambia lo stato del timer
      _timerInRunning = false;
      //Inizializza l'animazione
      setAnimationActive = false;
    }

  }

  ///Metodo per ricavare il numero totale di secondi
  int convertToSeconds(TextEditingController _txtTimerMinuts, TextEditingController _txtTimerSeconds)
  {
    //Inizializza i valori del timer
    int min = int.parse(_txtTimerMinuts.text);
    int sec = int.parse(_txtTimerSeconds.text);

    //Inizializza il valore da restituire
    int totalSeconds = (min*60) + sec;
    //Restituisce il valore
    return totalSeconds;
  }

}
///Classe per la gestione dei metodi del widget TimerRound
class SettingTimerRounds
{
  ///Attributi privati
  int _minTimerRound;
  int _secTimerRound;
  int _minTimerRest;
  int _secTimerRest;
  int _rounds;

  ///Costruttore della classe
  SettingTimerRounds(this._minTimerRound, this._secTimerRound,
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
}
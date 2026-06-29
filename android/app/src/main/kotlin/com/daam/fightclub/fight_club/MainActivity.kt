package com.daam.fightclub.fight_club

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.media.MediaPlayer

/**
 * Classe kotlin per la Main Activity
 */
class MainActivity : FlutterActivity()
{
    /**
     * Definisce il canale di comunicazione con il codice flutter
     */
    companion object {
        private const val CHANNEL = "com.daam/daam_channel"
    }

    /**
     * Istanza alla classe di riferimento per i future chimati in flutter
     */
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        /*Metodo per invocare i metodi attraverso il channel*/
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            //Verifica la chiamata del metodo
            if (call.method == "startSound")
            {
                //Setta il response
                val responseMess = "ok"
                //Invoca il metodo per riprodurre l'audio
                startSound()
                //Invia il response
                result.success(responseMess)
            }
            else
            {//Altrimenti restituisce l'accezione
                result.notImplemented()
            }
        }
    }

    /**
     * Metodo per riprodurre i suoni dalla directory raw
     */
    private fun startSound()
    {
        //Definisce il media player con il file da riprodurre
        val mp = MediaPlayer.create(this, R.raw.end_sound_bell)
        //Avvia il media player
        mp.setOnPreparedListener {
            //Riproduce il suono
            mediaPlayer -> mediaPlayer.start()
        }
        //Termina il media player
        mp.setOnCompletionListener {
            //Rilascia il suono
            mediaPlayer -> mediaPlayer.release() // Libera le risorse quando finisce
        }
    }
}

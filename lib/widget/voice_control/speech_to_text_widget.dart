/*
 * @copyright
 * Copyright (c) 2023 OVTeam
 *
 * All Rights Reserved
 *
 * Licensed under the MIT License;
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * https://choosealicense.com/licenses/mit/
 *
 */

import "dart:async";
import "package:alowin_mini/data/service/stream_event.dart";
import "package:audioplayers/audioplayers.dart";
import "package:intl/intl.dart";
import "package:permission_handler/permission_handler.dart";
import "package:speech_to_text/speech_to_text.dart";
import 'package:assets_audio_player/assets_audio_player.dart';
import "../../utils/constants.dart";

class SpeechToTextWidgets {
  static Timer? timer;
  static bool isMatchFinalResult = false;
  static final speechToText = SpeechToText();
  static final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
  static final audioPlayer = AudioPlayer();

  static SpeechToText getSpeechToTextControl() {
    return speechToText;
  }

  static Future<void> initialize() async {
    if (await Permission.microphone.request().isGranted) {
      await init();
      await initHeadset();
    }
  }

  static Future<void> initHeadset() async {
    await _assetsAudioPlayer.open(
        Playlist(audios: <Audio>[
          Audio(
              'assets/audio/background_small_song.mp3'
          )
        ], startIndex: 0),
        showNotification: true,
        autoStart: true,
        notificationSettings: NotificationSettings(
            prevEnabled: false,
            customPlayPauseAction: (player) {
              if (StreamEvent.isSpeechEnabled == false) {
                if(StreamEvent.isSpeechExpressOrder){
                  StreamEvent.isContinuousSpeech = true;
                }
                StreamEvent.publishSpeech(true);
                return;
              }else{
                StreamEvent.isContinuousSpeech = false;
                StreamEvent.publishSpeech(false);
                return;
              }

            }
        )
    );
  }

  static Future<void> init() async {
    await speechToText.initialize(
      onStatus: (val) async {
        print("Status: " + val);
        if (val == Constants.SPEECH_TO_TEXT_STATUS_DONE ||
            val == Constants.SPEECH_TO_TEXT_STATUS_NOT_LISTENING) {
            await StreamEvent.publishSpeech(false);
        }

        if(val == Constants.SPEECH_TO_TEXT_STATUS_DONE) {
          if (StreamEvent.isContinuousSpeech == true && StreamEvent.isReadParagraph == true) {
            await Future.delayed(const Duration(milliseconds: 500));
            StreamEvent.publishSpeech(true);
          }
        }

        if (val == Constants.SPEECH_TO_TEXT_STATUS_DONE) {
          SpeechToTextWidgets.isMatchFinalResult = false;
        }
      },
    );
  }

  static void parseVoice(val) {
    String lastWords = val.recognizedWords.toLowerCase();
    if (SpeechToTextWidgets.timer != null) {
      SpeechToTextWidgets.timer!.cancel();
    }

    if (SpeechToTextWidgets.isMatchFinalResult == true) {
      return;
    }

    StreamEvent.publish(EventData(
        enableVoice: true,
        recognizedWords: lastWords,
        finalResult: false
    ));

    SpeechToTextWidgets.timer =
        Timer.periodic(const Duration(milliseconds: 900), (speechTimer) async {
      if (val.isConfident() && lastWords.isNotEmpty) {
        await StreamEvent.publishSpeech(false);
        lastWords = val.recognizedWords.toLowerCase();
        SpeechToTextWidgets.isMatchFinalResult = true;
        StreamEvent.publish(EventData(
            enableVoice: true,
            recognizedWords: lastWords,
            finalResult: true
        ));
      }
      speechTimer.cancel();
    });
  }

  static void start({bool? allowDelay}) async {
    if (speechToText.lastStatus == "listening") {
      await Future.delayed(const Duration(milliseconds: 800));
    }
    await speechToText.stop();
    speechToText.listen(
        localeId: Constants.VIETNAMESE,
        listenMode: ListenMode.dictation,
        partialResults: true,
        onResult: parseVoice);
  }


  static void parseVoiceParameter(val) {
    String lastWords = val.recognizedWords.toLowerCase();
    if (SpeechToTextWidgets.timer != null) {
      SpeechToTextWidgets.timer!.cancel();
    }

    if (SpeechToTextWidgets.isMatchFinalResult == true) {
      return;
    }

    StreamEvent.publish(EventData(
        enableVoice: true,
        recognizedWords: lastWords,
        finalResult: false,
        isDoneSpeech: speechToText.lastStatus == Constants.SPEECH_TO_TEXT_STATUS_NOT_LISTENING
    ));
  }

  static void parseVoiceSampleDoc(val) {
    String lastWords = val.recognizedWords.toLowerCase();
    if (SpeechToTextWidgets.timer != null) {
      SpeechToTextWidgets.timer!.cancel();
    }

    if (SpeechToTextWidgets.isMatchFinalResult == true) {
      return;
    }

    StreamEvent.publish(EventData(
        enableVoice: true,
        recognizedWords: lastWords,
        finalResult: false,
        isDoneSpeech: speechToText.lastStatus == Constants.SPEECH_TO_TEXT_STATUS_NOT_LISTENING
    ));

  }

  static void startForever({bool? allowDelay}) async {
    if (speechToText.lastStatus != "notListening") {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    if (speechToText.isListening == false) {
      speechToText.listen(
          localeId: Constants.VIETNAMESE,
          listenMode: ListenMode.dictation,
          listenFor: const Duration(hours: 1),
          partialResults: true,
          onResult: parseVoiceParameter);
    }
  }

  static void startForeverSampleDoc({bool? allowDelay}) async {
    if (speechToText.lastStatus != "notListening") {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    speechToText.listen(
        localeId: Constants.VIETNAMESE,
        listenMode: ListenMode.dictation,
        listenFor: const Duration(hours: 1),
        partialResults: true,
        onResult: parseVoiceSampleDoc);
  }

  static Future<void> stop() async {
    await speechToText.stop();
  }
}

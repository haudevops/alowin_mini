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

import 'package:alowin_mini/utils/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechWidgets {
  static final ttsVoiceControl = FlutterTts();

  static Future<void> initialTextToSpeak() async {
      await ttsVoiceControl.setLanguage(Constants.VI_LOCALE);
      await ttsVoiceControl.setPitch(Constants.PITCH_RATE_ONE_POINT_ZERO);
      await ttsVoiceControl.setSpeechRate(Constants.SPEECH_RATE_ZERO_POINT_SEVEN);

      speakText('Xin chào');
  }

  static Future<void> speakText(String speechText) async {
    ttsVoiceControl.speak(speechText);
  }

  static Future<void> stopSpeak() async {
    ttsVoiceControl.stop();
  }
}

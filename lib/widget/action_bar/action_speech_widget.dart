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

import 'dart:async';
import 'package:alowin_mini/data/service/stream_event.dart';
import 'package:alowin_mini/widget/voice_control/speech_to_text_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';

class ActionSpeechWidget extends StatefulWidget {
  const ActionSpeechWidget({super.key});

  @override
  State<ActionSpeechWidget> createState() => _ActionSpeechWidgetState();
}

class _ActionSpeechWidgetState extends State<ActionSpeechWidget> with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controllerReverse;
  late StreamSubscription dataStreaming;

  bool speechEnabled = false;

  @override
  void initState() {
    super.initState();
    controller =
    AnimationController(duration: const Duration(seconds: 10), vsync: this)
      ..repeat();

    controllerReverse = AnimationController(
        duration: const Duration(seconds: 10),
        vsync: this,
        reverseDuration: const Duration(seconds: 10))
      ..repeat();
    initDataStream();

  }

  @override
  void dispose() {
    super.dispose();
    dataStreaming.cancel();
    controller.dispose();
    controllerReverse.dispose();
    StreamEvent.disposeSpeech();
  }

  Future<void> initDataStream({Object? eventName = ''}) async {
    dataStreaming = (await StreamEvent.eventSpeechStream).listen((event) {
      if(StreamEvent.isContinuousSpeech == false) {
        setState(() {
          speechEnabled = event;
          if (speechEnabled) {
            SpeechToTextWidgets.start(allowDelay: true);
          } else {
            SpeechToTextWidgets.stop();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: speechEnabled,
          child: AnimatedBuilder(
            animation: controller.view,
            builder: (_, child) {
              return Transform.rotate(
                angle: controller.value / 1 * math.pi,
                child: child,
              );
            },
            child: SvgPicture.asset(
              'assets/img/img_oval.svg',
              height: 70,
              width: 70,
            ),
          ),
        ),
        Visibility(
          visible: speechEnabled,
          child: AnimatedBuilder(
            animation: controllerReverse.view,
            builder: (_, child) {
              return Transform.rotate(
                angle: controllerReverse.value / -1 * math.pi,
                child: child,
              );
            },
            child: SvgPicture.asset(
              'assets/img/img_oval.svg',
              height: 70,
              width: 70,
            ),
          ),
        ),
        speechEnabled
            ? Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            margin: const EdgeInsets.all(5),
            child: FloatingActionButton(
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFFEB1C24),
                          Color(0xFFFF7A7F)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: GestureDetector(
                  onTap: () {
                    StreamEvent.publishSpeech(false);
                  },//switchSpeechEnabled,
                  onDoubleTap: () {},
                  child: Image.asset(
                    'assets/img/robot_animation_gif.gif',
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ),
        )
            : Container(
          margin: const EdgeInsets.all(5),
          child: FloatingActionButton(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFFEB1C24),
                        Color(0xFFFF7A7F)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: GestureDetector(
                  onTap: () {
                    StreamEvent.publishSpeech(true);
                  },//switchSpeechEnabled,
                  onDoubleTap: () {},
                  child: Image.asset(
                    'assets/img/robot_animation_gif.gif',
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              onPressed: () {}),
        ),
      ],
    );
  }
}

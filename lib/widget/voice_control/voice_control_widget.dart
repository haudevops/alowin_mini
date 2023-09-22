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

import 'package:flutter/material.dart';

class VoiceControlWidget extends StatelessWidget {
  const VoiceControlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
              onTap: () => {},
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
    );
  }

}
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

class CommonWidgets {
  static Widget customerHintText(textChange) {
    return Container(
        alignment: Alignment.topLeft,
        child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: textChange,
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w700)),
            ])));
  }

  static Widget welcomeCustomerText(String? userName) {
    return Container(
        alignment: Alignment.topLeft,
        child: RichText(
            softWrap: true,
            maxLines: 2,
            text: TextSpan(children: [
              TextSpan(
                  text: userName!.isNotEmpty ? 'Chào, $userName' : '',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF333333),
                  )),
            ])));
  }

  static Widget renderMic() {
    return SizedBox(
      height: 300,
      width: 300,
      child: Material(
        elevation: 8.0,
        shape: const CircleBorder(),
        color: Colors.white,
        child: CircleAvatar(
          radius: 60.0,
          backgroundColor: Colors.black,
          backgroundImage: const AssetImage('assets/img/bg_mic.png'),
          child: Image.asset(
            'assets/img/robot_animation_gif.gif',
            height: 250,
            width: 250,
          ),
        ),
      ),
    );
  }

  static Widget renderMicSmall() {
    return SizedBox(
      height: 200,
      width: 200,
      child: Material(
        elevation: 8.0,
        shape: const CircleBorder(),
        color: Colors.white,
        child: CircleAvatar(
          radius: 60.0,
          backgroundColor: Colors.black,
          backgroundImage: const AssetImage('lib/resources/assets/bg_mic.png'),
          child: Image.asset(
            'assets/img/robot_animation_gif.gif',
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }

  static Widget itemPadding(double size) {
    return SizedBox(height: size);
  }
}

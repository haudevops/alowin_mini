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

import 'package:alowin_mini/widget/commons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class MicAnimationWidget extends StatefulWidget {
  const MicAnimationWidget({super.key, required this.speechEnabled, required this.onTapMic});

  final bool speechEnabled;
  final Function() onTapMic;

  @override
  State<MicAnimationWidget> createState() => _MicAnimationWidgetState();
}

class _MicAnimationWidgetState extends State<MicAnimationWidget> with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controllerReverse;

  @override
  void initState() {
    super.initState();
    controller =
    AnimationController(duration: const Duration(seconds: 10), vsync: this)
      ..repeat();
    controller.forward();

    controllerReverse = AnimationController(
        duration: const Duration(seconds: 10),
        vsync: this,
        reverseDuration: const Duration(seconds: 10))
      ..repeat();
    controllerReverse.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controllerReverse.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 200),
          Stack(
            children: [
              Visibility(
                visible: widget.speechEnabled,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: controller.value / 1 * math.pi,
                      child: child,
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/img_oval.svg',
                    height: 320,
                    width: 320,
                  ),
                ),
              ),
              Visibility(
                visible: widget.speechEnabled,
                child: AnimatedBuilder(
                  animation: controllerReverse,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: controllerReverse.value / -1 * math.pi,
                      child: child,
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/img_oval.svg',
                    height: 320,
                    width: 320,
                  ),
                ),
              ),
              widget.speechEnabled
                  ? Positioned(
                  left: 0,
                  right: 0,
                  top: 10,
                  bottom: 10,
                  child: GestureDetector(
                      onTap: widget.onTapMic,
                      onDoubleTap: () {},
                      child: CommonWidgets.renderMic()))
                  : GestureDetector(
                  onTap: widget.onTapMic,
                  onDoubleTap: () {},
                  child: CommonWidgets.renderMic())
            ],
          )
        ],
      ),
    );
  }
}


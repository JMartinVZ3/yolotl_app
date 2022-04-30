import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolotl/config/common.dart';
import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class PlayPage extends FlameGame with DoubleTapDetector, HasTappables {
  bool running = true;

  @override
  Future<void> onLoad() async {
    add(Square(Vector2(100, 200)));
  }

  @override
  void onTapUp(int id, TapUpInfo info) {
    super.onTapUp(id, info);
    if (!info.handled) {
      final touchPoint = info.eventPosition.game;
      add(Square(touchPoint));
    }
  }

  @override
  void onDoubleTap() {
    if (running) {
      pauseEngine();
    } else {
      resumeEngine();
    }

    running = !running;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: YolotlColors.lightYellow,
            image: DecorationImage(
              image: Image.asset("images/juegoAjolote.png").image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 40),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
                onTap: () {
                  Get.back();
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: kIconSize,
                )),
          ),
        ),
      ],
    );
  }
}

class Square extends PositionComponent with Tappable {
  static const speed = 0.25;
  static const squareSize = 128.0;

  static Paint white = BasicPalette.white.paint();
  static Paint red = BasicPalette.red.paint();
  static Paint blue = BasicPalette.blue.paint();

  Square(Vector2 position) : super(position: position);

  @override
  void render(Canvas c) {
    c.drawRect(size.toRect(), white);
    c.drawRect(const Rect.fromLTWH(0, 0, 3, 3), red);
    c.drawRect(Rect.fromLTWH(width / 2, height / 2, 3, 3), blue);
  }

  @override
  void update(double dt) {
    super.update(dt);
    angle += speed * dt;
    angle %= 2 * math.pi;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size.setValues(squareSize, squareSize);
    anchor = Anchor.center;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    removeFromParent();
    return true;
  }
}

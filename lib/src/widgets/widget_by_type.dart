import 'package:flutter/material.dart';
import 'package:simple_animated_rating_bar/src/widgets/diagonally_down.dart';
import 'package:simple_animated_rating_bar/src/widgets/diagonally_up.dart';
import 'package:simple_animated_rating_bar/src/widgets/jump.dart';
import 'package:simple_animated_rating_bar/src/widgets/nod_left.dart';
import 'package:simple_animated_rating_bar/src/widgets/nod_right.dart';
import 'package:simple_animated_rating_bar/src/widgets/rotate.dart';
import 'package:simple_animated_rating_bar/src/widgets/scale.dart';
import 'package:simple_animated_rating_bar/src/widgets/shake.dart';
import 'package:simple_animated_rating_bar/utils/arb_type.dart';

class WidgetByType extends StatelessWidget {
  final Widget selectedWidget;
  final ARBAnimationType type;
  final AnimationController controller;
  final Curve? curve;
  final double animationItensity;

  const WidgetByType({
    super.key,
    required this.selectedWidget,
    required this.type,
    required this.controller,
    required this.animationItensity,
    this.curve,
  });

  @override
  Widget build(BuildContext context) {
    return buildWidgetType();
  }

  Widget buildWidgetType() {
    switch (type) {
      case ARBAnimationType.diagonallyDown:
        return DiagonallyDown(
          controller: controller,
          curve: curve,
          animationItensity: animationItensity,
          child: selectedWidget,
        );

      case ARBAnimationType.diagonallyUp:
        return DiagonallyUp(
          controller: controller,
          curve: curve,
          animationItensity: animationItensity,
          child: selectedWidget,
        );

      case ARBAnimationType.jump:
        return Jump(
          controller: controller,
          curve: curve,
          animationItensity: animationItensity,
          child: selectedWidget,
        );

      case ARBAnimationType.shake:
        return Shake(
          controller: controller,
          curve: curve,
          animationItensity: animationItensity,
          child: selectedWidget,
        );

      case ARBAnimationType.rotate:
        return Rotate(
          controller: controller,
          curve: curve,
          animationItensity: animationItensity,
          child: selectedWidget,
        );

      case ARBAnimationType.nodRight:
        return NodRight(
          controller: controller,
          curve: curve,
          animationItensity: animationItensity,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0),
              end: const Offset(0.15, -0.15),
            ).animate(
              CurvedAnimation(
                parent: controller,
                curve: curve ?? Curves.easeIn,
              ),
            ),
            child: selectedWidget,
          ),
        );

      case ARBAnimationType.nodLeft:
        return NodLeft(
          controller: controller,
          curve: curve,
          animationItensity: animationItensity,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0),
              end: const Offset(-0.15, -0.15),
            ).animate(
              CurvedAnimation(
                parent: controller,
                curve: curve ?? Curves.easeIn,
              ),
            ),
            child: selectedWidget,
          ),
        );

      case ARBAnimationType.bounce:
        return Scale(
          controller: controller,
          curve: curve,
          animationItensity: animationItensity,
          child: selectedWidget,
        );

      default:
        return selectedWidget;
    }
  }
}

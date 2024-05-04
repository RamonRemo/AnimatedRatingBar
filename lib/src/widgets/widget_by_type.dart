import 'package:flutter/material.dart';
import 'package:simple_animated_rating_bar/src/widgets/diagonally_down.dart';
import 'package:simple_animated_rating_bar/src/widgets/diagonally_up.dart';
import 'package:simple_animated_rating_bar/src/widgets/jump.dart';
import 'package:simple_animated_rating_bar/src/widgets/rotate.dart';
import 'package:simple_animated_rating_bar/src/widgets/scale.dart';
import 'package:simple_animated_rating_bar/src/widgets/shake.dart';
import 'package:simple_animated_rating_bar/utils/arb_type.dart';

class WidgetByType extends StatelessWidget {
  final Widget selectedWidget;
  final ARBAnimationType type;
  final AnimationController controller;

  const WidgetByType({
    super.key,
    required this.selectedWidget,
    required this.type,
    required this.controller,
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
          child: selectedWidget,
        );

      case ARBAnimationType.diagonallyUp:
        return DiagonallyUp(
          controller: controller,
          child: selectedWidget,
        );

      case ARBAnimationType.jump:
        return Jump(
          controller: controller,
          child: selectedWidget,
        );

      case ARBAnimationType.shake:
        return Shake(
          controller: controller,
          child: selectedWidget,
        );

      case ARBAnimationType.rotate:
        return Rotate(
          controller: controller,
          child: selectedWidget,
        );

      case ARBAnimationType.bounce:
        return Scale(
          controller: controller,
          child: selectedWidget,
        );

      default:
        return selectedWidget;
    }
  }
}

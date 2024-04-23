import 'dart:math';

import 'package:flutter/material.dart';
import '../utils/arb_type.dart';

class RatingObject extends StatefulWidget {
  const RatingObject({
    final Key? key,
    this.isSelected = false,
    required this.emptyWidget,
    required this.fullWidget,
    required this.animationType,
    required this.animationItensity,
    required this.callback,
    required this.index,
  }) : super(key: key);

  final bool isSelected;
  final Widget emptyWidget;
  final Widget fullWidget;
  final ARBAnimationType animationType;
  final double animationItensity;
  final Function(int) callback;
  final int index;

  @override
  State<RatingObject> createState() => RatingObjectState();
}

class RatingObjectState extends State<RatingObject>
    with SingleTickerProviderStateMixin {
  late AnimationController _animate;
  late double _scale;
  bool played = false;

  @override
  void initState() {
    _animate = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      upperBound: 0.5,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animate.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    _scale = _decideScaleIntensity();
    final sineValue = _decideShakeIntensity();
    final angle = _animate.value * widget.animationItensity / 2;
    Widget? ratingObject;

    _onSelected();

    if (widget.animationType == ARBAnimationType.none) {
      ratingObject = widget.isSelected ? widget.fullWidget : widget.emptyWidget;
    }

    if (widget.animationType == ARBAnimationType.shake) {
      ratingObject = Transform.translate(
        offset: Offset(sineValue * 4, 0),
        child: widget.isSelected ? widget.fullWidget : widget.emptyWidget,
      );
    }

    if (widget.animationType == ARBAnimationType.rotate) {
      ratingObject = Transform.rotate(
        angle: angle,
        child: widget.isSelected ? widget.fullWidget : widget.emptyWidget,
      );
    }

    if (widget.animationType == ARBAnimationType.bounceDiagonally) {
      ratingObject = Transform(
        transform: Matrix4.diagonal3Values(_scale, _scale, 1),
        child: widget.isSelected ? widget.fullWidget : widget.emptyWidget,
      );
    }

    if (widget.animationType == ARBAnimationType.bounce) {
      ratingObject = Transform.scale(
        scale: _scale,
        child: widget.isSelected ? widget.fullWidget : widget.emptyWidget,
      );
    }

    return GestureDetector(
      onTap: () {
        widget.callback(widget.index + 1);
      },
      child: ratingObject,
    );
  }

  void _onSelected() {
    if (!widget.isSelected) {
      played = false;
    }

    if (widget.isSelected && !played) {
      played = true;
      _animate.forward();
      Future.delayed(const Duration(milliseconds: 100), () {
        _animate.reverse();
      });
    }
  }

  double _decideScaleIntensity() {
    if (widget.animationType == ARBAnimationType.bounceDiagonally) {
      return 1 - _animate.value * (widget.animationItensity / 2.5) * -1;
    }

    return 1 - _animate.value * (widget.animationItensity * -1);
  }

  double _decideShakeIntensity() {
    return sin((widget.animationItensity + 2) * pi * _animate.value);
  }
}

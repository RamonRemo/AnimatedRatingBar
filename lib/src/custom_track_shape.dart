import 'package:flutter/material.dart';

class CustomTrackShape extends RoundedRectSliderTrackShape {
  final double height;

  CustomTrackShape(
    this.height,
  );

  @override
  Rect getPreferredRect({
    required final RenderBox parentBox,
    required final SliderThemeData sliderTheme,
    final Offset offset = Offset.zero,
    final bool isEnabled = false,
    final bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, height);
  }
}
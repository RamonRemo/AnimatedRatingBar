library simple_animated_rating_bar;

// ignore_for_file: always_put_control_body_on_new_line

import 'package:simple_animated_rating_bar/src/custom_track_shape.dart';
import 'package:simple_animated_rating_bar/src/rating_object.dart';
import 'package:simple_animated_rating_bar/utils/arb_type.dart';
import 'package:flutter/material.dart';

class AnimatedRatingBar extends StatefulWidget {
  /// Widget that should appear when unselected, we recommend use a size 48.
  /// Recomended size : 48.
  final Widget emptyWidget;

  /// Widget that should appear when selected.
  /// Recomended size : 48.
  final Widget fullWidget;

  /// Is a way to recover the rating value.
  final ValueChanged<int>? onRatingChanged;

  /// This value is used to create the swipe area.
  /// The height should be the same of yours empty and full widgets.
  final double rowHeight;

  /// Defines the type of the animation.
  /// Default is ARBAnimationType.bounce.
  /// Arbitrarily decided by me.
  final ARBAnimationType animationType;

  /// Intensity of the animation.
  ///
  /// Default is 2.
  final double animationItensity;

  /// Make the ratings to be animated one at a time.
  /// Default is true;
  final bool cascadeAnimation;

  const AnimatedRatingBar({
    super.key,
    this.onRatingChanged,
    required this.emptyWidget,
    required this.fullWidget,
    required this.rowHeight,
    this.animationType = ARBAnimationType.bounce,
    this.animationItensity = 2,
    this.cascadeAnimation = true,
  });

  @override
  State<AnimatedRatingBar> createState() => _AnimatedRatingBarState();
}

class _AnimatedRatingBarState extends State<AnimatedRatingBar> {
  double val = 0;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingObject(
                  isSelected: val > 3.5,
                  fullWidget: widget.fullWidget,
                  emptyWidget: widget.emptyWidget,
                  animationItensity: widget.animationItensity,
                  animationType: widget.animationType,
                ),
                RatingObject(
                  isSelected: val > 20,
                  fullWidget: widget.fullWidget,
                  emptyWidget: widget.emptyWidget,
                  animationItensity: widget.animationItensity,
                  animationType: widget.animationType,
                ),
                RatingObject(
                  isSelected: val > 40,
                  fullWidget: widget.fullWidget,
                  emptyWidget: widget.emptyWidget,
                  animationItensity: widget.animationItensity,
                  animationType: widget.animationType,
                ),
                RatingObject(
                  isSelected: val > 60,
                  fullWidget: widget.fullWidget,
                  emptyWidget: widget.emptyWidget,
                  animationItensity: widget.animationItensity,
                  animationType: widget.animationType,
                ),
                RatingObject(
                  isSelected: val > 80,
                  fullWidget: widget.fullWidget,
                  emptyWidget: widget.emptyWidget,
                  animationItensity: widget.animationItensity,
                  animationType: widget.animationType,
                ),
              ],
            ),
            Opacity(
              opacity: 0,
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: widget.rowHeight,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: widget.rowHeight / 4,
                  ),
                  trackShape: CustomTrackShape(widget.rowHeight),
                ),
                child: Slider(
                    value: val,
                    max: 100,
                    onChanged: (final value) async {
                      final bool isIncreasing = val < value;
                      final step = isIncreasing ? 1.0 : -1.0;

                      if ((val > 3.5 && val < 20) && value < 20) {
                        setState(() {
                          val = 0;
                        });
                      } else {
                        if (!widget.cascadeAnimation) {
                          setState(() {
                            val = value;
                            return;
                          });
                        }

                        for (double i = val;
                            isIncreasing ? i <= value : i >= value;
                            i += step) {
                          await Future.delayed(
                            const Duration(milliseconds: 1),
                          );

                          setState(() => val = i);
                        }
                      }

                      _updateRating();
                    }),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            '$rating',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        )
      ],
    );
  }

  void _updateRating() {
    widget.onRatingChanged?.call(rating);
  }

  int get rating {
    if (val > 80) return 5;
    if (val > 60) return 4;
    if (val > 40) return 3;
    if (val > 20) return 2;
    if (val > 3.5) return 1;

    return 0;
  }
}

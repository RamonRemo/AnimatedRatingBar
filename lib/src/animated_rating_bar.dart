library simple_animated_rating_bar;

// ignore_for_file: always_put_control_body_on_new_line

import 'package:simple_animated_rating_bar/src/custom_track_shape.dart';
import 'package:simple_animated_rating_bar/src/rating_object.dart';
import 'package:simple_animated_rating_bar/utils/arb_type.dart';
import 'package:flutter/material.dart';

class AnimatedRatingBar extends StatefulWidget {
  /// Widget to display when the rating is unselected.
  ///
  /// Recommended size: 48.
  final Widget emptyWidget;

  /// Widget to display when the rating is selected.
  ///
  /// Recommended size: 48.
  final Widget fullWidget;

  /// Callback to retrieve the rating value.
  final ValueChanged<int>? onRatingChanged;

  /// Height of the swipe area, should match the height of your empty and full widgets.
  final double rowHeight;

  /// Defines the type of the animation.
  ///
  /// Default is ARBAnimationType.bounce.
  ///
  final ARBAnimationType animationType;

  /// Intensity of the animation. Arbitrarily decided by me.
  ///
  /// Default is 2.
  final double animationItensity;

  /// Make the ratings to be animated one at a time.
  ///
  /// Default is true.
  final bool cascadeAnimation;

  /// The initial rating value.
  ///
  /// Default is 0.
  final int initialValue;

  final MainAxisAlignment mainAxisAlignment;

  const AnimatedRatingBar({
    super.key,
    this.onRatingChanged,
    required this.emptyWidget,
    required this.fullWidget,
    required this.rowHeight,
    this.animationType = ARBAnimationType.bounce,
    this.animationItensity = 2,
    this.cascadeAnimation = true,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.initialValue = 0,
  });

  @override
  State<AnimatedRatingBar> createState() => _AnimatedRatingBarState();
}

class _AnimatedRatingBarState extends State<AnimatedRatingBar> {
  late double selectedValue;
  late List<RatingObject> ratingList;

  @override
  void initState() {
    if (widget.initialValue > 5) {
      selectedValue = 100;
    } else if (widget.initialValue < 0) {
      selectedValue = 0;
    } else {
      selectedValue = widget.initialValue * 20 + 3.5;
    }
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    ratingList = [];

    for (var index = 0; index < 5; index++) {
      ratingList.add(
        RatingObject(
          isSelected: selectedValue > index * 20 + 3.5,
          fullWidget: widget.fullWidget,
          emptyWidget: widget.emptyWidget,
          animationItensity: widget.animationItensity,
          animationType: widget.animationType,
        ),
      );
    }

    return Column(
      children: [
        Stack(
          children: [
            Row(
              mainAxisAlignment: widget.mainAxisAlignment,
              children: ratingList,
            ),
            Opacity(
              opacity: 0,
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: widget.rowHeight,
                  minThumbSeparation: 0,

                  // rangeThumbShape: RangeSliderThumbShape(),
                  thumbShape: const RoundSliderThumbShape(
                    // enabledThumbRadius: widget.rowHeight / 4,
                    enabledThumbRadius: 0.1,
                    disabledThumbRadius: 0.1,
                  ),
                  trackShape: CustomTrackShape(widget.rowHeight),
                ),
                child: Slider(
                    value: selectedValue,
                    max: 100,
                    onChanged: (final value) async {
                      final bool isIncreasing = selectedValue < value;
                      final step = isIncreasing ? 1.0 : -1.0;
                      var isOneStar = rating == 1;

                      if (isOneStar && value < 24) {
                        setState(() {
                          selectedValue = 0;
                          ratingList = [];
                        });
                      } else {
                        if (!widget.cascadeAnimation) {
                          setState(() {
                            selectedValue = value;
                            return;
                          });
                        }

                        for (double i = selectedValue;
                            isIncreasing ? i <= value : i >= value;
                            i += step) {
                          await Future.delayed(
                            const Duration(milliseconds: 1),
                          );

                          setState(() => selectedValue = i);
                        }
                      }

                      _updateRating();
                    }),
              ),
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.all(24.0),
        //   child: Text(
        //     '$rating',
        //     style: const TextStyle(
        //       color: Colors.white,
        //       fontSize: 40,
        //     ),
        //   ),
        // ),
        // Text(
        //   ' ${selectedValue.ceil()}',
        //   style: const TextStyle(
        //     color: Colors.white,
        //     fontSize: 40,
        //   ),
        // )
      ],
    );
  }

  void _updateRating() {
    widget.onRatingChanged?.call(rating);
  }

  int get rating {
    int value = 0;

    for (var item in ratingList) {
      if (item.isSelected) {
        value++;
      }
    }

    return value;
  }
}

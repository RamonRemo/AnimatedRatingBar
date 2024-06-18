library simple_animated_rating_bar;

// ignore_for_file: always_put_control_body_on_new_line

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

  /// How many rating objects.
  ///
  /// You may have to change [mainAxisAlignment] property.
  final int ratingLength;

  /// The initial rating value.
  ///
  /// Default is 0.
  final int initialValue;

  /// You can choose your curve from the [Curves] class.
  /// Default is [Curves.easeIn].
  ///
  /// Some of the curves may required duration adjusts.
  final Curve? curve;

  /// How the children should be placed along the main axis in a flex layout.
  ///
  /// See also:
  ///
  ///  * [Column], [Row], and [Flex], the flex widgets.
  ///  * [RenderFlex], the flex render object.
  final MainAxisAlignment mainAxisAlignment;

  /// The duration of the animation going forward.
  /// To the reverse duration use [reverseDuration], if [reverseDuration] is not given, we will use [duration].
  /// Default is [Duration(milliseconds: 100)]
  ///
  /// More than 200 milliseconds may be too slow.
  final Duration duration;

  /// The duration of the animation going back.
  /// If [reverseDuration] is not given, we will use [duration].
  final Duration? reverseDuration;

  /// The duration of the cascade animation.
  /// Defines how fast the widgets changes.
  ///
  /// Default is [Duration(milliseconds: 50)]
  final Duration? cascadeDuration;

  const AnimatedRatingBar({
    super.key,
    this.onRatingChanged,
    required this.emptyWidget,
    required this.fullWidget,
    this.animationType = ARBAnimationType.bounce,
    this.animationItensity = 2,
    this.cascadeAnimation = true,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.initialValue = 0,
    this.ratingLength = 5,
    this.curve,
    this.duration = const Duration(milliseconds: 100),
    this.reverseDuration,
    this.cascadeDuration,
  });

  @override
  State<AnimatedRatingBar> createState() => _AnimatedRatingBarState();
}

class _AnimatedRatingBarState extends State<AnimatedRatingBar> {
  late List<RatingObject> ratingList;
  late int selectedValue = widget.initialValue > 5 ? 5 : widget.initialValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final ex) => _updateRating());
  }

  @override
  Widget build(final BuildContext context) {
    ratingList = [];

    for (var index = 0; index < widget.ratingLength; index++) {
      ratingList.add(
        RatingObject(
          isSelected: index <= selectedValue - 1,
          fullWidget: widget.fullWidget,
          emptyWidget: widget.emptyWidget,
          animationItensity: widget.animationItensity,
          animationType: widget.animationType,
          index: index,
          curve: widget.curve,
          duration: widget.duration,
          reverseDuration: widget.reverseDuration,
          callback: (final rating) async {
            final isIncreasing = selectedValue < rating;

            for (var i = selectedValue;
                isIncreasing ? i <= rating : i >= rating;
                isIncreasing ? i++ : i--) {
              if (widget.cascadeAnimation) {
                await Future.delayed(
                  Duration(
                    milliseconds: widget.cascadeDuration?.inMilliseconds ?? 50,
                  ),
                );
                // widget.duration.inMilliseconds
              }

              selectedValue = i;

              if (widget.cascadeAnimation) {
                setState(() {
                  _updateRating();
                });
              }
            }

            if (!widget.cascadeAnimation) {
              setState(() {
                _updateRating();
              });
            }
          },
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: ratingList,
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

  int get rating => selectedValue;
}

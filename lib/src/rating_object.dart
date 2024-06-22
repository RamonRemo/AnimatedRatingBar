import 'package:flutter/material.dart';
import 'package:simple_animated_rating_bar/src/widgets/widget_by_type.dart';
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
    this.curve,
    this.duration,
    this.reverseDuration,
  }) : super(key: key);

  final bool isSelected;
  final Widget emptyWidget;
  final Widget fullWidget;
  final ARBAnimationType animationType;
  final double animationItensity;
  final Function(int) callback;
  final int index;
  final Curve? curve;
  final Duration? duration;
  final Duration? reverseDuration;

  @override
  State<RatingObject> createState() => RatingObjectState();
}

class RatingObjectState extends State<RatingObject>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool played = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: widget.reverseDuration ?? widget.duration,
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    _onSelected();

    Widget? ratingObject;
    Widget selectedWidget =
        widget.isSelected ? widget.fullWidget : widget.emptyWidget;

    ratingObject = WidgetByType(
      selectedWidget: selectedWidget,
      type: widget.animationType,
      controller: _animationController,
      curve: widget.curve,
      animationItensity: widget.animationItensity,
    );

    return GestureDetector(
      onTap: () {
        widget.callback(widget.index + 1);
      },
      child: ratingObject,
    );
  }

  Future<void> _onSelected() async {
    if (!widget.isSelected) {
      played = false;
    }

    if (widget.isSelected && !played) {
      played = true;

      await _animationController.forward().then(
            (value) => _animationController.reverse(),
          );

      // this makes the animation be interrupted in the middle and then reversed
      // _animationController.forward();
      // await Future.delayed(const Duration(milliseconds: 100), () async {
      //   _animationController.reverse();
      // });
    }
  }
}

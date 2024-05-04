import 'package:flutter/material.dart';
import 'package:simple_animated_rating_bar/src/widgets/widget_by_type.dart';
import '../utils/arb_type.dart';

class RatingObjectWidget2 extends StatefulWidget {
  const RatingObjectWidget2({
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
  State<RatingObjectWidget2> createState() => RatingObjectWidget2State();
}

class RatingObjectWidget2State extends State<RatingObjectWidget2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool played = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 100),
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

    Widget? ratingObject2;
    Widget selectedWidget =
        widget.isSelected ? widget.fullWidget : widget.emptyWidget;

    ratingObject2 = WidgetByType(
      selectedWidget: selectedWidget,
      type: widget.animationType,
      controller: _animationController,
    );

    return GestureDetector(
      onTap: () {
        widget.callback(widget.index + 1);
      },
      child: ratingObject2,
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

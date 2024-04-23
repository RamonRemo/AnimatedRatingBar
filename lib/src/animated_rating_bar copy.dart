// // ignore_for_file: always_put_control_body_on_new_line

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../text/will_text.dart';

// class WillStarScore extends StatefulWidget {
//   /// Create a score with 5 star widgets. Ranked from 1 to 5.
//   const WillStarScore({
//     super.key,
//     this.leftText,
//     this.rightText,
//     this.onRatingChanged,
//     this.initialValue = 0,
//   });

//   final String? leftText;
//   final String? rightText;
//   final ValueChanged<int>? onRatingChanged;
//   final int initialValue;

//   @override
//   State<WillStarScore> createState() => _WillStarScoreState();
// }

// class _WillStarScoreState extends State<WillStarScore> {
//   late int selectedValue = widget.initialValue > 5 ? 5 : widget.initialValue;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((final ex) => _updateRating());
//   }

//   @override
//   Widget build(final BuildContext context) {
//     final List<_Star> emojiList = List.generate(5, (final index) {
//       return _Star(
//         index: index,
//         callback: (final rating) async {
//           final isIncreasing = selectedValue < rating;

//           setState(() async {
//             for (var i = selectedValue;
//                 isIncreasing ? i <= rating : i >= rating;
//                 isIncreasing ? i++ : i--) {
//               await Future.delayed(const Duration(milliseconds: 50));

//               selectedValue = i;

//               _updateRating();
//             }
//           });
//         },
//         isSelected: index <= selectedValue - 1,
//         key: Key('star_${index + 1}'),
//       );
//     });

//     final hasText = (widget.leftText != null && widget.leftText!.isEmpty) &&
//         (widget.rightText != null && widget.rightText!.isEmpty);

//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: emojiList,
//         ),
//         Visibility(
//           visible: !hasText,
//           child: const SizedBox(
//             height: 8,
//           ),
//         ),
//         Visibility(
//           visible: !hasText,
//           child: _buildTexts(),
//         )
//       ],
//     );
//   }

//   Row _buildTexts() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         if (rating == 1)
//           WillText.footerBold(widget.leftText ?? 'Não curti')
//         else
//           WillText.footerRegular(
//             widget.leftText ?? 'Não curti',
//           ),
//         if (rating == 5)
//           WillText.footerBold(widget.rightText ?? 'Curti muito')
//         else
//           WillText.footerRegular(widget.rightText ?? 'Curti muito'),
//       ],
//     );
//   }

//   void _updateRating() {
//     widget.onRatingChanged?.call(rating);
//   }

//   int get rating {
//     return selectedValue;
//   }
// }

// class _Star extends StatefulWidget {
//   const _Star({
//     required this.index,
//     required this.callback,
//     final Key? key,
//     this.isSelected = false,
//   }) : super(key: key);

//   final bool isSelected;
//   final int index;
//   final Function(int) callback;

//   @override
//   State<_Star> createState() => _StarState();
// }

// class _StarState extends State<_Star> with SingleTickerProviderStateMixin {
//   late AnimationController _animate;
//   late double _scale;
//   bool played = false;

//   @override
//   void initState() {
//     _animate = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 200),
//       upperBound: 0.25,
//     )..addListener(() {
//         setState(() {});
//       });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _animate.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(final BuildContext context) {
//     _scale = 1 - _animate.value * -2;
//     _onSelected();

//     return Transform.scale(
//       scale: _scale,
//       child: _buildEmojiWidget(context),
//     );
//   }

//   Widget _buildEmojiWidget(final BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         widget.callback(widget.index + 1);
//       },
//       child: widget.isSelected
//           ? SvgPicture.asset(
//               'lib/assets/estrela_selec.svg',
//               width: 48,
//               package: 'will_design_system',
//             )
//           : SvgPicture.asset(
//               'lib/assets/estrela_normal.svg',
//               width: 48,
//               package: 'will_design_system',
//             ),
//     );
//   }

//   void _onSelected() {
//     if (!widget.isSelected) {
//       played = false;
//     }

//     if (widget.isSelected && !played) {
//       played = true;
//       _animate.forward();
//       Future.delayed(const Duration(milliseconds: 100), () {
//         _animate.reverse();
//       });
//     }
//   }
// }

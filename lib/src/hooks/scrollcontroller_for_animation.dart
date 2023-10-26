import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// class ScrollcontrollerForAnimation extends StatefulWidget {
//   const ScrollcontrollerForAnimation({super.key});

//   @override
//   State<ScrollcontrollerForAnimation> createState() => _ScrollcontrollerForAnimationState();
// }

// class _ScrollcontrollerForAnimationState extends State<ScrollcontrollerForAnimation> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

ScrollController useScrollControllerForAnimation(
    AnimationController animationController) {
  final scrollController = ScrollController();

  scrollController.addListener(() {
    switch (scrollController.position.userScrollDirection) {
      // Scrolling up - forward the animation (value goes to 1)
      case ScrollDirection.forward:
        animationController.forward();
        break;
      // Scrolling down - reverse the animation (value goes to 0)
      case ScrollDirection.reverse:
        animationController.reverse();
        break;
      // Idle - keep FAB visibility unchanged
      case ScrollDirection.idle:
        break;
    }
  });

  return scrollController;
}

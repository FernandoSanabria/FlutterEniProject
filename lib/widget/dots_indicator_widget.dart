import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator(
      {this.controller,
      this.itemCount,
      this.onPageSelected,
      this.color: Colors.white,
      this.context})
      : super(listenable: controller);

  final BuildContext context;
  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color color;
  static const double _kDotSpacing = 25.0;

  Widget _builtDot(int index) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: controller.page == index
              ? Colors.black54.withOpacity(0.8)
              : Colors.white.withOpacity(0.6),
          type: MaterialType.circle,
          child: Container(
            width: size.width * 0.02,
            height: size.width * 0.04,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _builtDot),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:spydir/constants/sizes.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.disabled});
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.size56,
      width: Sizes.size96 + Sizes.size20,
      child: AnimatedContainer(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: disabled ? Colors.grey.shade700 : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        duration: const Duration(milliseconds: 300),
        child: const Text(
          "Next",
          style: TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

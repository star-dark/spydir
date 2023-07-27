import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final Function() onTap;

  const FloatingButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: FloatingActionButton.large(
        onPressed: onTap,
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: const Icon(
          Icons.add_circle_rounded,
          color: Color.fromRGBO(252, 202, 70, 1),
          size: 80,
        ),
      ),
    );
  }
}

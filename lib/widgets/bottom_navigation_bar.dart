import 'package:flutter/material.dart';

class MainBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MainBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 12, 19, 79),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            iconSize: 30,
            color: Colors.white,
            onPressed: () => onTap(0),
            icon: const Icon(Icons.home),
          ),
          IconButton(
            iconSize: 30,
            color: Colors.white,
            onPressed: () => onTap(1),
            icon: const Icon(Icons.rocket_launch),
          ),
          const SizedBox(),
          IconButton(
            iconSize: 30,
            color: Colors.white,
            onPressed: () => onTap(3),
            icon: const Icon(Icons.calendar_month),
          ),
          IconButton(
            iconSize: 30,
            color: Colors.white,
            onPressed: () => onTap(4),
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

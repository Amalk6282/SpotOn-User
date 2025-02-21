import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Function() onTap;
  final bool isActive;
  const BottomNavbarItem({
    super.key,
    required this.label,
    required this.iconData,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 10,
          ),
          Icon(
            iconData,
            size: 30,
            color: isActive ? Color(0xFF7F00FF) : Colors.white,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

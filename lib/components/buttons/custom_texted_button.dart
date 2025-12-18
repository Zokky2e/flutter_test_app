// custom_button.dart
import 'package:flutter/material.dart';

class CutomTextedButton extends StatelessWidget {
  const CutomTextedButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.text,
    required this.icon,
  });
  final VoidCallback onTap;
  final Color color;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    Color secondary = Theme.of(context).colorScheme.secondary;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: secondary,
            ),
            child: Icon(icon, color: color),
          ),
          Container(
            height: 20,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: secondary,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

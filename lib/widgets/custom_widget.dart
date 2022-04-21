import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius = 10;
  final VoidCallback onPressed;
  final double height = 45;

  const CustomWidget({
    Key? key,
    required this.child,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(
          elevation: 10,
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

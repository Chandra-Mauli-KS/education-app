import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color? color;
  final VoidCallback ontap;
  const CustomIconButton(
      {super.key,
      required this.child,
      required this.height,
      required this.width,
      this.color = Colors.white,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2.0,
              spreadRadius: 0.5,
            ),
          ]),
      child: InkWell(
        onTap: ontap,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

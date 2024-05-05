import 'package:flutter/material.dart';

class LogoTile extends StatelessWidget {
  final String imagePath;
  final double height;
  final Function()? onTap;
  const LogoTile({
    super.key,
    required this.imagePath,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[900]),
        child: Image.asset(
          imagePath,
          height: height,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LogoTile extends StatelessWidget {
  final String imagePath;
  final double height;
  const LogoTile({
    super.key,
    required this.imagePath,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[900]),
      child: Image.asset(
        imagePath,
        height: height,
      ),
    );
  }
}

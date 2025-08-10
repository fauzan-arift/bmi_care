import 'package:flutter/material.dart';

Color getBackgroundColor(int index, int button) {
  if (button == 0) {
    switch (index) {
      case 0:
        return const Color(0xFFFBD3D3);
      case 1:
        return const Color(0xFFFBEDD3);
      case 2:
        return const Color(0xFFE7FBD3);
      default:
        return Colors.white;
    }
  } else {
    switch (index) {
      case 0:
        return const Color(0xFF993D3F);
      case 1:
        return const Color(0xFF998A3D);
      case 2:
        return const Color(0xFF3D9970);
      default:
        return Colors.white;
    }
  }
}
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ItemSlide extends StatelessWidget {
  final double delta;
  final String gambar;

  const ItemSlide({
    super.key,
    required this.gambar,
    required this.delta
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.greenAccent.shade100,
          ),
        ),
        Transform.rotate(
          angle: pi * delta,
          child: Transform.scale(
            scale: lerpDouble(1.0, 0.7, delta),
            child: Image.asset("assets/$gambar.png", fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class ParallaxEffect extends StatefulWidget {
  const ParallaxEffect({super.key});

  @override
  State<ParallaxEffect> createState() => _ParallaxEffectState();
}

class _ParallaxEffectState extends State<ParallaxEffect> {
  double _offset = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _offset += details.delta.dx / 100;
          if (_offset > 1.0) _offset = 1.0;
          if (_offset < -1.0) _offset = -1.0;
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Фоновый слой (двигается медленнее)
          Positioned(
            left: 50 + _offset * 20,
            top: 50,
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blue.withOpacity(0.5),
              child: const Center(child: Text('Фон', style: TextStyle(color: Colors.white))),
            ),
          ),

          // Передний слой (двигается быстрее)
          Positioned(
            left: 100 + _offset * 40,
            top: 80,
            child: Container(
              width: 150,
              height: 80,
              color: Colors.red.withOpacity(0.7),
              child: const Center(child: Text('Передний план', style: TextStyle(color: Colors.white))),
            ),
          ),

          // Инструкция
          const Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Text('Свайпайте влево/вправо', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
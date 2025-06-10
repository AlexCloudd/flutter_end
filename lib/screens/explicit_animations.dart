import 'package:flutter/material.dart';

class ExplicitAnimationsScreen extends StatefulWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  State<ExplicitAnimationsScreen> createState() => _ExplicitAnimationsScreenState();
}

class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.purple).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Явные анимации'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                } else {
                  _controller.repeat(reverse: true);
                }
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: _colorAnimation.value,
                        child: Center(
                          child: Text(
                            _controller.isAnimating ? 'Нажмите\nчтобы остановить' : 'Нажмите\nчтобы начать',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.repeat(reverse: true),
                  child: const Text('Запустить'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _controller.stop(),
                  child: const Text('Остановить'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _controller.reset(),
                  child: const Text('Сбросить'),
                ),
              ],
            ),

            const SizedBox(height: 30),
            Slider(
              value: _controller.value,
              onChanged: (value) {
                _controller.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
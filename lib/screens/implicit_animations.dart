import 'package:flutter/material.dart';
import '../widgets/parallax_effect.dart';

class ImplicitAnimationsScreen extends StatefulWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  State<ImplicitAnimationsScreen> createState() => _ImplicitAnimationsScreenState();
}

class _ImplicitAnimationsScreenState extends State<ImplicitAnimationsScreen> {
  bool _visible = true;
  bool _expanded = false;
  double _padding = 20.0;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Имплицитные анимации'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. AnimatedOpacity
            Card(
              child: Column(
                children: [
                  const Text('AnimatedOpacity'),
                  AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    child: const FlutterLogo(size: 100),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => _visible = !_visible),
                    child: Text(_visible ? 'Скрыть' : 'Показать'),
                  ),
                ],
              ),
            ),

            // 2. AnimatedContainer
            Card(
              child: Column(
                children: [
                  const Text('AnimatedContainer'),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    padding: EdgeInsets.all(_padding),
                    color: _color,
                    child: const Text('Изменяемый контейнер'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => setState(() => _padding = _padding == 20 ? 40 : 20),
                        child: const Text('Изменить отступы'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => setState(() => _color = _color == Colors.blue ? Colors.red : Colors.blue),
                        child: const Text('Изменить цвет'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 3. AnimatedCrossFade
            Card(
              child: Column(
                children: [
                  const Text('AnimatedCrossFade'),
                  AnimatedCrossFade(
                    duration: const Duration(seconds: 1),
                    firstChild: const FlutterLogo(size: 100, style: FlutterLogoStyle.horizontal),
                    secondChild: const FlutterLogo(size: 100, style: FlutterLogoStyle.stacked),
                    crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => _expanded = !_expanded),
                    child: Text(_expanded ? 'Горизонтальный' : 'Стандартный'),
                  ),
                ],
              ),
            ),

            // 4. Параллакс эффект
            const Card(
              child: Column(
                children: [
                  Text('Параллакс эффект'),
                  SizedBox(height: 200, child: ParallaxEffect()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
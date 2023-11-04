import 'package:flutter/material.dart';

import '../../presentation.dart';

//:https://www.educative.io/answers/how-to-use-staggered-animations-in-flutter

class StaggeredAnimationPage extends StatefulWidget {
  const StaggeredAnimationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StaggeredAnimationPageState createState() => _StaggeredAnimationPageState();
}

class _StaggeredAnimationPageState extends State<StaggeredAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _circleAnimations;
  late Animation<double> _horizontalAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _circleAnimations = List<Animation<double>>.generate(
      8, // Number of letters in "EDUCATIVE"
      (int index) => CurvedAnimation(
        parent: _controller,
        curve: Interval(0.1 * index, 1.0, curve: Curves.easeInOut),
      ),
    );

    _horizontalAnimation =
        Tween<double>(begin: -1, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(
        title: Text('Staggered Animations'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _circleAnimations
              .map(
                (circleAnimation) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: circleAnimation,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: AnimatedBuilder(
                          animation: _horizontalAnimation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(
                                30 * _horizontalAnimation.value,
                                0,
                              ),
                              child: Text(
                                'EDUCATIVE'[
                                    _circleAnimations.indexOf(circleAnimation)],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

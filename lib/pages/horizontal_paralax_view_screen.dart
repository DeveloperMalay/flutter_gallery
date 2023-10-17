import 'package:flutter/material.dart';

class HorizontalParalaxViewScreen extends StatelessWidget {
  const HorizontalParalaxViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}

class AnimatedContainerPopup extends StatefulWidget {
  const AnimatedContainerPopup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedContainerPopupState createState() => _AnimatedContainerPopupState();
}

class _AnimatedContainerPopupState extends State<AnimatedContainerPopup> {
  final double _containerHeight = 100.0;
  bool _isPopupVisible = false;

  void _togglePopup() {
    setState(() {
      _isPopupVisible = !_isPopupVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container Popup'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: _containerHeight,
              width: 200,
              color: Colors.blue,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    _togglePopup();
                  },
                  child: const Text('Toggle Popup'),
                ),
              ),
            ),
            if (_isPopupVisible) _buildPopup(),
            const AnimatedLikeButton()
          ],
        ),
      ),
    );
  }

  Widget _buildPopup() {
    return AlertDialog(
      title: const Text('Popup Animation'),
      content: AnimatedSize(
        duration: const Duration(milliseconds: 2500),
        curve: Curves.easeInOutBack,
        child: Container(
          width: 200,
          height: _isPopupVisible ? 200.0 : 0.0,
          color: Colors.green,
          child: const Center(
            child: Text('Popup Content'),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            _togglePopup();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class CustomLikeButton extends StatefulWidget {
  const CustomLikeButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomLikeButtonState createState() => _CustomLikeButtonState();
}

class _CustomLikeButtonState extends State<CustomLikeButton>
    with SingleTickerProviderStateMixin {
  bool _isLiked = false;
  int _likeCount = 0;
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _likeCount++;
      } else {
        _likeCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleLike,
      child: AnimatedBuilder(
        animation: controller,
        // animation: this,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.red : Colors.grey,
                size:
                    30.0 + (_isLiked ? 10.0 : 0.0), // Increase size when liked.
              ),
              if (_likeCount > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Text(
                      _likeCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class AnimatedLikeButton extends StatefulWidget {
  const AnimatedLikeButton({super.key});

  @override
  State<AnimatedLikeButton> createState() => _AnimatedLikeButtonState();
}

class _AnimatedLikeButtonState extends State<AnimatedLikeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation<Offset> moveAnimation;
  late Animation<double> scaleAnimation;
  bool _isContainerVisible = false;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    moveAnimation = Tween(begin: const Offset(0, 20), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    scaleAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Opacity(
                opacity: animation.value,
                child: Transform.translate(
                  offset: moveAnimation.value,
                  child: Transform.scale(
                      scale: animation.value, child: const Text("Move..")),
                ),
              );
            }),
        TextButton(
            onPressed: () {
              controller.reset();
              controller.forward();
              setState(() {
                _isContainerVisible = !_isContainerVisible;
              });
            },
            child: const Text('show')),
        AnimatedContainer(
          duration: const Duration(seconds: 1), // Animation duration
          curve: Curves.easeInOut, // Animation curve
          width: _isContainerVisible ? 200 : 0,
          height: _isContainerVisible ? 200 : 0,
          color: Colors.blue,
          child: const Center(
            child: Text('This is a container'),
          ),
        ),
      ],
    );
  }
}

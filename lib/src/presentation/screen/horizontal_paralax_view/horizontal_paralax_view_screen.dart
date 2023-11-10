import 'package:flutter/material.dart';

import 'widgets/paralax_image.dart';
import 'widgets/paralax_text.dart';

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
  _AnimatedContainerPopupState createState() => _AnimatedContainerPopupState();
}

class _AnimatedContainerPopupState extends State<AnimatedContainerPopup> {
  double _containerHeight = 100.0;
  double _containerwidth = 200.0;
  bool _isPopupVisible = false;
  bool changeColor = false;
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
              width: _containerwidth,
              color: changeColor ? Colors.blue : Colors.red,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      changeColor != changeColor;
                      _containerHeight = 300.0;
                      _containerwidth = 300.0;
                    });
                    // _togglePopup();
                  },
                  child: const Text('Toggle Popup'),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    changeColor = !changeColor;
                    _containerHeight = 100;
                    _containerwidth = 200;
                  });
                },
                child: Text('change color')),
            // if (_isPopupVisible) _buildPopup(),
            const AnimatedLikeButton(),
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
                  scale: animation.value,
                  child: const Text("Move.."),
                ),
              ),
            );
          },
        ),
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

class ParallaxEffectScreen extends StatefulWidget {
  const ParallaxEffectScreen({Key? key}) : super(key: key);

  @override
  State<ParallaxEffectScreen> createState() => _ParallaxEffectScreenState();
}

class _ParallaxEffectScreenState extends State<ParallaxEffectScreen> {
  String? asset;
  double divOne = 0;
  double divFive = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notify) {
          if (notify is ScrollUpdateNotification) {
            setState(() {
              divOne += notify.scrollDelta! / 1;
              divFive += notify.scrollDelta! / 5;
            });
          }
          return true;
        },
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.5, 0.0),
                      colors: [
                        Color.fromRGBO(130, 0, 94, 1),
                        Colors.lightBlue,
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  height: 1200,
                )
              ],
            ),
            ParallaxText(
              colour: Colors.white,
              left: 170 - divOne * 3,
              top: 120 + divFive,
              text: "The\nmountains",
            ),
            ParallaxText(
              colour: Colors.white,
              left: 20 + divOne * 2,
              top: 400 + divFive / 2,
              text: "are calling,\nand",
            ),
            ParallaxImage(
              left: 20,
              top: 100 - divOne,
              height: 200,
              width: 200,
              asset:
                  'https://hips.hearstapps.com/hmg-prod/images/nature-captions-1-1672892626.jpg?crop=1xw:1xh;center,top&resize=980:*',
              widget: ParallaxText(
                colour: const Color.fromRGBO(130, 0, 94, 1),
                left: 150 - divOne * 3,
                top: 20 + divOne + divFive,
                text: "The\nmountains",
              ),
            ),
            ParallaxImage(
                left: 200 - divOne,
                top: 350 - divOne,
                height: 300,
                width: 300,
                asset:
                    'https://hips.hearstapps.com/hmg-prod/images/nature-captions-3-1672892657.jpg?crop=0.9992927864214993xw:1xh;center,top&resize=980:*',
                widget: ParallaxText(
                  colour: const Color.fromRGBO(130, 0, 94, 1),
                  left: -180 + divOne * 3,
                  top: 50 + divOne + divFive / 2,
                  text: "are calling,\nand",
                )),
            ParallaxText(
              colour: Colors.white,
              left: divFive,
              top: 720 - divOne,
              text: "I must go!",
            ),
            ParallaxImage(
                left: 95,
                top: 700 - divOne,
                height: 400,
                width: 230,
                asset:
                    "https://images.unsplash.com/photo-1585409677983-0f6c41ca9c3b?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D",
                widget: ParallaxText(
                  colour: const Color.fromRGBO(130, 0, 94, 1),
                  left: -95 + divFive,
                  top: 20,
                  text: "I must go!",
                ))
          ],
        ),
      ),
    );
  }
}

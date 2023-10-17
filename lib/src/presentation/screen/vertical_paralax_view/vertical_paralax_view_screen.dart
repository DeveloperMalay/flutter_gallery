part of '../../presentation.dart';


// TODO checK this github for reference    https://github.com/monster555/flutter_parallax_swiper/blob/main/lib/config/drag_scroll_behavior_configuration.dart

class VerticalParalaxScreen extends StatefulWidget {
  const VerticalParalaxScreen({super.key});

  @override
  State<VerticalParalaxScreen> createState() => _VerticalParalaxScreenState();
}

class _VerticalParalaxScreenState
    extends BaseStateWrapper<VerticalParalaxScreen> {
  @override
  Widget onBuild(
      BuildContext context, BoxConstraints constraints, PlatformType platform) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: darkBlue),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Paralax Effect',
          style: TextStyle(color: darkBlue),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AnimatedContainerPopup()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.menu_outlined,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: const ParallaxRecipe(),
    );
  }

  @override
  void onDispose() {}

  @override
  void onInit() {}

  @override
  void onPause() {}

  @override
  void onResume() {}
}

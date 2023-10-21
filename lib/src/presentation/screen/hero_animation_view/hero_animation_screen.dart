import 'package:flutter/material.dart';
import 'package:gallery/src/presentation/presentation.dart';

import '../../base/base_state_wrapper.dart';

class HeroAnimationScreen extends StatefulWidget {
  const HeroAnimationScreen({super.key});

  @override
  State<HeroAnimationScreen> createState() => _HeroAnimationScreenState();
}

class _HeroAnimationScreenState extends BaseStateWrapper<HeroAnimationScreen> {
  @override
  Widget onBuild(
      BuildContext context, BoxConstraints constraints, PlatformType platform) {
    return Scaffold(
      appBar: MAppBar(
        title: Text('Hero Animation'),
      ),
    );
  }

  @override
  void onDispose() {
    // TODO: implement onDispose
  }

  @override
  void onInit() {
    // TODO: implement onInit
  }

  @override
  void onPause() {
    // TODO: implement onPause
  }

  @override
  void onResume() {
    // TODO: implement onResume
  }
}

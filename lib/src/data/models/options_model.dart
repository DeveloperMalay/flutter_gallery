part of '../data.dart';

class OptionsModel {
  final String option;
  final String route;

  OptionsModel({required this.option, required this.route});
}

final List<OptionsModel> options = [
  OptionsModel(
    option: 'Vertical Paralax View',
    route: Routes.VERTICAL_PARALAX_VIEW.toNamed,
  ),
  OptionsModel(
    option: 'horizontal Paralax View',
    route: Routes.PARALAX_SWIPER_SCREEN.toNamed,
  ),
  OptionsModel(
    option: 'Paralax Scroling',
    route: Routes.PARALAX_SCROLL_VIEW.toNamed,
  ),
  OptionsModel(
    option: 'Staggered Animation',
    route: Routes.STAGGERED_ANIMATION.toNamed,
  ),
  OptionsModel(
    option: 'Hero Animation',
    route: Routes.HERO_ANIMATION_VIEW.toNamed,
  ),
];

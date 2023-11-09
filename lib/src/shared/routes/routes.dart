// ignore_for_file: constant_identifier_names

enum Routes {
  CHOOSE_OPTIONS,
  VERTICAL_PARALAX_VIEW,
  PARALAX_SCROLL_VIEW,
  HERO_ANIMATION_VIEW,
  STAGGERED_ANIMATION,
  PRODUCT_DETAILS,
  PARALAX_SWIPER_SCREEN,
}

extension RoutesExt on Routes {
  String get route => toString().split('.').last;

  String get toPath => '/${route.toLowerCase()}';

  String get toNamed => route.toLowerCase();
}

// ignore_for_file: constant_identifier_names

enum Routes {
  CHOOSE_OPTIONS,
  VERTICAL_PARALAX_VIEW,
}

extension RoutesExt on Routes {
  String get route => toString().split('.').last;

  String get toPath => '/${route.toLowerCase()}';

  String get toNamed => route.toLowerCase();
}

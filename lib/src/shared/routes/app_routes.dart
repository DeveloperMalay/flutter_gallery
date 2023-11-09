part of '../shared.dart';

class AppRoutes {
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      Scaffold(
        body: Center(
          child: Text(
            'No route defined for ${state.uri.toString()} ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      );
  static final GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: Routes.CHOOSE_OPTIONS.toNamed,
      builder: (context, state) => const ChooseViewScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ChooseViewScreen(),
      ),
    ),
    GoRoute(
      path: Routes.VERTICAL_PARALAX_VIEW.toPath,
      name: Routes.VERTICAL_PARALAX_VIEW.toNamed,
      builder: (context, state) => const VerticalParalaxScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const VerticalParalaxScreen(),
      ),
    ),
    GoRoute(
      path: Routes.PARALAX_SCROLL_VIEW.toPath,
      name: Routes.PARALAX_SCROLL_VIEW.toNamed,
      builder: (context, state) => const ParallaxEffectScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const ParallaxEffectScreen(),
      ),
    ),
    GoRoute(
      path: Routes.PARALAX_SWIPER_SCREEN.toPath,
      name: Routes.PARALAX_SWIPER_SCREEN.toNamed,
      builder: (context, state) => ParalaxSwiperScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: ParalaxSwiperScreen(),
      ),
    ),
    GoRoute(
      path: Routes.STAGGERED_ANIMATION.toPath,
      name: Routes.STAGGERED_ANIMATION.toNamed,
      builder: (context, state) => const StaggeredAnimationPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const StaggeredAnimationPage(),
      ),
    ),
    GoRoute(
      path: Routes.HERO_ANIMATION_VIEW.toPath,
      name: Routes.HERO_ANIMATION_VIEW.toNamed,
      builder: (context, state) => const HeroAnimationScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const HeroAnimationScreen(),
      ),
    ),
    GoRoute(
      path: '${Routes.PRODUCT_DETAILS.toPath}/:index',
      name: Routes.PRODUCT_DETAILS.toNamed,
      builder: (context, state) => ProductDetailsScreen(
        index: state.pathParameters['index']!,
      ),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: ProductDetailsScreen(
          index: state.pathParameters['index']!,
        ),
      ),
    ),
  ]);
  static GoRouter get router => _router;
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
    transitionDuration: const Duration(milliseconds: 300),
  );
}

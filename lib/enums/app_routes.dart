enum AppRoutes{
  from,
  splash,
  login,
  home,
  unknown
}

extension RouteExtension on AppRoutes {
  String get name {
    switch (this) {
      case AppRoutes.splash:
        return "/splash";
      case AppRoutes.login:
        return "/login";
      case AppRoutes.home:
        return "/home";
      default:
        return '/';
    }
  }
  operator [](String key) => (name) {
    switch (name) {
      case '/splash':
        return AppRoutes.splash;
      case '/login':
        return AppRoutes.login;
      case '/home':
        return AppRoutes.home;
      default:
        return AppRoutes.unknown;
    }
  }(key);
}
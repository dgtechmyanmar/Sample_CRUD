import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
// @override
// RouteType get defaultRouteType => RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: ContactRoute.page, path: '/home'),
    AutoRoute(page: AddContactRoute.page, path: '/add'),
  ];
}

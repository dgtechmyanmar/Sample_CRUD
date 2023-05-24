// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter_sample_crud/contact/presentation/add_contact_page.dart'
    as _i2;
import 'package:flutter_sample_crud/contact/presentation/contact_page.dart'
    as _i4;
import 'package:flutter_sample_crud/contact/presentation/update_contact_page.dart'
    as _i3;
import 'package:flutter_sample_crud/splash/presentation/splash_page.dart'
    as _i1;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    AddContactRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddContactPage(),
      );
    },
    UpdateContactRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.UpdateContactPage(),
      );
    },
    ContactRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ContactPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddContactPage]
class AddContactRoute extends _i5.PageRouteInfo<void> {
  const AddContactRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddContactRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.UpdateContactPage]
class UpdateContactRoute extends _i5.PageRouteInfo<void> {
  const UpdateContactRoute({List<_i5.PageRouteInfo>? children})
      : super(
          UpdateContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateContactRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ContactPage]
class ContactRoute extends _i5.PageRouteInfo<void> {
  const ContactRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

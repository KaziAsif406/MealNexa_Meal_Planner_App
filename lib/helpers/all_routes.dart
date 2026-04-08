// ignore_for_file: unused_element

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:template_flutter/features/auth/sign_in/presentation/forgot_pass.dart';
import 'package:template_flutter/features/auth/sign_in/presentation/reset_pass.dart';
import 'package:template_flutter/features/auth/sign_in/presentation/sign_in.dart';
import 'package:template_flutter/features/auth/sign_in/presentation/verification.dart';
import 'package:template_flutter/features/home/presentation/home.dart';
import 'package:template_flutter/features/preferences/presentation/preferences_screen.dart';
import 'package:template_flutter/navigation_screen.dart';
import '../features/auth/sign_up/presentation/sign_up.dart';

import '../features/onboarding/presentation/onboarding_flow.dart';

void navigateToOnboarding(BuildContext context) {
  Timer(const Duration(seconds: 2), () {
    if (context.mounted) {
      Navigator.of(context).pushReplacementNamed(Routes.onboardingScreen);
    }
  });
}

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  // Auth Routes
  static const String signInScreen = '/signin';
  static const String signUpScreen = '/signUp';
  static const String forgotPassScreen = '/forgotPassScreen';
  static const String otpScreen = '/OtpScreen';
  static const String setPassword = '/ResetPassword';
  //products_with_pagination
  static const String productsWithPagination = '/ProductsWithPagination';
  //ProductsScreen
  static const String productsScreen = '/ProductsScreen';
  //ProductDetailsScreen
  static const String productDetailsScreen = '/ProductDetailsScreen';

  // Main App Routes
  static const String homeScreen = '/home_screen';
  static const String navigationScreen = '/NavigationScreen';
  static const String profile = '/Profile';
  static const String preferences = '/Preferences';

  // Onboarding Routes
  static const String onboardingScreen = '/onboarding';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Auth Routes

      // case Routes.forgotPWScreen:
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(builder: (context) => const ForgotPWScreen())
      //       : _FadedTransitionRoute(widget: const ForgotPWScreen(), settings: settings);

      // case Routes.otpScreen:
      //   final args = settings.arguments as Map;
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(builder: (context) => OtpScreen(isFromLogin: args['isFromLogin']))
      //       : _FadedTransitionRoute(
      //           widget: OtpScreen(isFromLogin: args['isFromLogin']),
      //           settings: settings
      //         );

      // case Routes.setPassword:
      //   final args = settings.arguments as Map;
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(builder: (context) => SetPasswordScreen(name: args['name'], email: args['email']))
      //       : _FadedTransitionRoute(
      //           widget: SetPasswordScreen(name: args['name'], email: args['email']),
      //           settings: settings
      //         );

      // // Main App Routes
      // case Routes.homeScreen:
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(builder: (context) => const HomeScreen())
      //       : _FadedTransitionRoute(widget: const HomeScreen(), settings: settings);

      // case Routes.navigationScreen:
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(builder: (context) => const NavigationScreen())
      //       : _FadedTransitionRoute(widget: const NavigationScreen(), settings: settings);

      // case Routes.profile:
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(builder: (context) => const ProfileScreen())
      //       : _FadedTransitionRoute(
      //           widget: const ProfileScreen(), settings: settings);

      case Routes.onboardingScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const OnboardingFlow())
            : _FadedTransitionRoute(
                widget: const OnboardingFlow(), settings: settings);

      case Routes.signInScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const SignInScreen())
            : _FadedTransitionRoute(
                widget: const SignInScreen(), settings: settings);

      case Routes.signUpScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const SignUpScreen())
            : _FadedTransitionRoute(
                widget: const SignUpScreen(), settings: settings);

      case Routes.forgotPassScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const ForgotPassScreen())
            : _FadedTransitionRoute(
                widget: const ForgotPassScreen(), settings: settings);

      case Routes.otpScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const VerificationScreen())
            : _FadedTransitionRoute(
                widget: const VerificationScreen(), settings: settings);

      case Routes.setPassword:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const ResetPassScreen())
            : _FadedTransitionRoute(
                widget: const ResetPassScreen(), settings: settings);

      case Routes.homeScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const HomeScreen())
            : _FadedTransitionRoute(widget: const HomeScreen(), settings: settings);

      case Routes.navigationScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const NavigationScreen())
            : _FadedTransitionRoute(widget: const NavigationScreen(), settings: settings);

      case Routes.preferences:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const PreferencesScreen())
            : _FadedTransitionRoute(widget: const PreferencesScreen(), settings: settings);

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}

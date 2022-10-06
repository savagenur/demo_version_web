import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget desktop;
  const Responsive(
      {super.key,
      required this.mobile,
      this.mobileLarge,
      this.tablet,
      required this.desktop});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 500;
  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width <= 700;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1024) {
      return desktop;
    }
    if (_size.width >= 700 && tablet != null) {
      return tablet!;
    }
    if (_size.width >= 450 && mobileLarge != null) {
      return mobileLarge!;
    }
    return mobile;
  }
}

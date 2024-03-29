import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget? ipad;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    this.ipad,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 610;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 610 &&
      MediaQuery.of(context).size.width <= 992;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 992;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 992) {
      return ipad!;
    } else if (size.width >= 610) {
      return tablet;
    } else {
      return mobile;
    }
  }
}

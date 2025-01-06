import 'package:flutter/material.dart';

class responsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;

  responsiveLayout({required this.mobileBody, required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 800) {
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
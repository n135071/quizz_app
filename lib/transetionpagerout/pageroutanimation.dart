import 'package:flutter/cupertino.dart';

class transitionPageRout extends PageRouteBuilder {
  final Widget widget;

  transitionPageRout({required this.widget})
      : super(
      transitionDuration: const Duration(seconds: 2),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,
          Widget child) {
        animation =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        return ScaleTransition(
          scale: animation,
          alignment: Alignment.center,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secAnimation) {
        return widget;
      });
}

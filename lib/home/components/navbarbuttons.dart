import 'package:flutter/material.dart';

import '../../res/constants.dart';

class NavBarButton extends StatelessWidget {
  NavBarButton({Key? key,required this.title, required this.widgetKey, required this.onPressed}) : super(key: key);

  VoidCallback onPressed;

  final String title;
  final GlobalKey widgetKey;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title,style: tabTextTheme,),
    );
  }
}

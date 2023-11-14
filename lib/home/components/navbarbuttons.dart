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
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.brown.withOpacity(0.2))
      ),
      onPressed: onPressed,
      child: Text(title,style: tabTextTheme,),
    );
  }
}

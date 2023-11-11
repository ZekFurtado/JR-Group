import 'package:flutter/material.dart';
import 'package:jr_group/res/constants.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem({Key? key, required this.title, required this.widgetKey, required this.onPressed}) : super(key: key);

  String title;
  GlobalKey widgetKey;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: tabTextTheme,),
      onTap: onPressed,
    );
  }
}

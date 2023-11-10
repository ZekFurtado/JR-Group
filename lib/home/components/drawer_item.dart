import 'package:flutter/material.dart';
import 'package:jr_group/res/constants.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem({Key? key, required this.title, required this.widgetKey}) : super(key: key);

  String title;
  GlobalKey widgetKey;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: tabTextTheme,),
      onTap: (){
        Scaffold.of(context).closeEndDrawer();
        if(widgetKey.currentContext!=null){
          Scrollable.ensureVisible(
              widgetKey.currentContext!,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn
          );
        }
      },
    );
  }
}

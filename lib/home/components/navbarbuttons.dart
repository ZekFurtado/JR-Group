import 'package:flutter/material.dart';

import '../../res/constants.dart';

class NavBarButton extends StatelessWidget {
  const NavBarButton({Key? key,required this.title, required this.widgetKey}) : super(key: key);

  final String title;
  final GlobalKey widgetKey;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(title,style: tabTextTheme,),
      onPressed: (){
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

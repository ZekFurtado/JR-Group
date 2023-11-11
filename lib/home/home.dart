import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr_group/home/components/navbarbuttons.dart';
import 'package:jr_group/home/components/topimage.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../res/constants.dart';
import '../view model/responsive.dart';
import 'components/about.dart';
import 'components/drawer_item.dart';
import 'components/history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItemScrollController _scrollController = ItemScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isVisible = false;

  List<Widget> components(context){
    return [
      ImageCarousel(
        key: homeKey,
      ),
      About(key: aboutKey),
      JRHistory(widgetKey: heritageKey)
    ];
  }

  List<Widget> desktopAppBarActions(context){
    return [
      Responsive.isTablet(context)? Padding(
        padding: const EdgeInsets.only(right: 20),
        child: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (){
            _scaffoldKey.currentState?.openEndDrawer();
          },
        ),
      ):const SizedBox(),
      if(!Responsive.isTablet(context))IconButton(
        tooltip: 'LinkedIn',
        icon: const FaIcon(FontAwesomeIcons.linkedin),
        onPressed: (){

        },
      ),
      if(!Responsive.isTablet(context))IconButton(
        tooltip: 'Instagram',
        icon: const FaIcon(FontAwesomeIcons.instagram),
        onPressed: (){

        },
      ),
      if(!Responsive.isTablet(context))IconButton(
        tooltip: 'Twitter',
        icon: const FaIcon(FontAwesomeIcons.twitter),
        onPressed: (){

        },
      ),
      if(!Responsive.isTablet(context))IconButton(
        tooltip: 'Facebook',
        icon: const FaIcon(FontAwesomeIcons.facebook),
        onPressed: (){

        },
      ),
      if(!Responsive.isTablet(context))SizedBox(width: appBarPadding/3,)
    ];
  }

  @override
  void initState() {
    super.initState();
    // _scrollController = ScrollController();
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels>0) {
    //     if (!_isVisible) {
    //       setState(() {
    //         _isVisible = true;
    //       });
    //     }
    //   } else {
    //     if (_isVisible) {
    //       setState(() {
    //         _isVisible = false;
    //       });
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    edgePadding = MediaQuery.of(context).size.width*0.1;
    appBarPadding = MediaQuery.of(context).size.width*0.15;
    appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Responsive.isTablet(context)?Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/JR_logo.png'),
                      fit: BoxFit.contain
                  )
              ),
            )
        ): const SizedBox(),
        leadingWidth: Responsive.isTablet(context)?appBarPadding:0,
        centerTitle: true,
        title: !Responsive.isTablet(context)?
        Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/JR_logo.png',width: 70,),
              NavBarButton(title: 'HOME', widgetKey: homeKey,),
              // const SizedBox(width: 50,),
              NavBarButton(title: 'ABOUT', widgetKey: aboutKey,),
              NavBarButton(title: 'HERITAGE & CULTURE', widgetKey: heritageKey,),
              NavBarButton(title: 'CSR', widgetKey: csrKey,),
              // const SizedBox(width: 50,),
              NavBarButton(title: 'BLOG', widgetKey: blogKey,),
              // const SizedBox(width: 50,),
              NavBarButton(title: 'CONTACT US', widgetKey: contactKey,),
            ],
          ),
        ):const SizedBox(),
        actions: desktopAppBarActions(context),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            DrawerItem(title: 'HOME',widgetKey: homeKey,),
            DrawerItem(title: 'ABOUT',widgetKey: aboutKey,),
            DrawerItem(title: 'BLOG',widgetKey: blogKey,),
            DrawerItem(title: 'CONTACT US',widgetKey: contactKey,),
          ],
        ),
      ),
      body: ScrollablePositionedList.builder(
        itemScrollController: _scrollController,
        itemCount: 3,
        itemBuilder:(context, index) => components(context).elementAt(index),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: _isVisible?FloatingActionButton(
        tooltip: 'Back to top',
        child: const Icon(Icons.keyboard_arrow_up),
        onPressed: (){
          _scrollController.scrollTo(index: 0, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
        },
      ):null,
    );
  }
}


class Industries extends StatefulWidget {
  const Industries({Key? key}) : super(key: key);

  @override
  State<Industries> createState() => _IndustriesState();
}

class _IndustriesState extends State<Industries> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        setState(() {
          isHovered = !isHovered;
        });
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: isHovered ? 200 : 0,
          child: Container(
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dropdown Item 1'),
                Text('Dropdown Item 2'),
                // Add more dropdown items as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}

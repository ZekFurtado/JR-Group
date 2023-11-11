import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr_group/home/components/navbarbuttons.dart';
import 'package:jr_group/home/components/topimage.dart';

import '../res/constants.dart';
import '../view model/responsive.dart';
import 'components/about.dart';
import 'components/csr.dart';
import 'components/drawer_item.dart';
import 'components/history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isVisible = false;

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
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels>0) {
        if (!_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      } else {
        if (_isVisible) {
          setState(() {
            _isVisible = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    edgePadding = MediaQuery.of(context).size.width*0.1;
    appBarPadding = MediaQuery.of(context).size.width*0.15;

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
              NavBarButton(
                title: 'HOME',
                widgetKey: homeKey,
                onPressed: (){
                  int index = keys.indexOf(homeKey);
                  double offset = 0;
                  for(int i=0;i<index;i++){
                    offset += keys.elementAt(i).currentContext!.size!.height;
                  }
                  _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  // print(widgetKey.currentContext);
                  // if(widgetKey.currentContext!=null){
                  //   Scrollable.ensureVisible(
                  //       widgetKey.currentContext!,
                  //       duration: const Duration(milliseconds: 500),
                  //       curve: Curves.easeIn
                  //   );
                  // }
                },
              ),
              // const SizedBox(width: 50,),
              NavBarButton(
                title: 'ABOUT',
                widgetKey: aboutKey,
                onPressed: (){
                  int index = keys.indexOf(aboutKey);
                  print(index);
                  double offset = 0;
                  for(int i=0;i<index;i++){
                    print(keys.elementAt(i).currentContext!);
                    offset += keys.elementAt(i).currentContext!.size!.height;
                  }
                  _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                },
              ),
              NavBarButton(
                title: 'HERITAGE & CULTURE',
                widgetKey: heritageKey,
                onPressed: (){
                  int index = keys.indexOf(heritageKey);
                  double offset = 0;
                  for(int i=0;i<index;i++){
                    offset += keys.elementAt(i).currentContext!.size!.height;
                  }
                  _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                },
              ),
              NavBarButton(
                title: 'CSR',
                widgetKey: csrKey,
                onPressed: (){
                  int index = keys.indexOf(csrKey);
                  double offset = 0;
                  for(int i=0;i<index;i++){
                    offset += keys.elementAt(i).currentContext!.size!.height;
                  }
                  _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                },
              ),
              // const SizedBox(width: 50,),
              NavBarButton(
                title: 'BLOG',
                widgetKey: blogKey,
                onPressed: (){
                  int index = keys.indexOf(blogKey);
                  double offset = 0;
                  for(int i=0;i<index;i++){
                    offset += keys.elementAt(i).currentContext!.size!.height;
                  }
                  _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                },
              ),
              // const SizedBox(width: 50,),
              NavBarButton(
                title: 'CONTACT US',
                widgetKey: contactKey,
                onPressed: (){
                  int index = keys.indexOf(contactKey);
                  double offset = 0;
                  for(int i=0;i<index;i++){
                    offset += keys.elementAt(i).currentContext!.size!.height;
                  }
                  _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                },
              ),
            ],
          ),
        ):const SizedBox(),
        actions: desktopAppBarActions(context),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            DrawerItem(
              title: 'HOME',
              widgetKey: homeKey,
              onPressed: (){
                int index = keys.indexOf(homeKey);
                double offset = 0;
                for(int i=0;i<index;i++){
                  offset += keys.elementAt(i).currentContext!.size!.height;
                }
                _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                // print(widgetKey.currentContext);
                // if(widgetKey.currentContext!=null){
                //   Scrollable.ensureVisible(
                //       widgetKey.currentContext!,
                //       duration: const Duration(milliseconds: 500),
                //       curve: Curves.easeIn
                //   );
                // }
              },
            ),
            DrawerItem(
              title: 'ABOUT',
              widgetKey: aboutKey,
              onPressed: (){
                int index = keys.indexOf(aboutKey);
                print(index);
                double offset = 0;
                for(int i=0;i<index;i++){
                  print(keys.elementAt(i).currentContext!);
                  offset += keys.elementAt(i).currentContext!.size!.height;
                }
                _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              },
            ),
            DrawerItem(
              title: 'HERITAGE & CULTURE',
              widgetKey: heritageKey,
              onPressed: (){
                int index = keys.indexOf(heritageKey);
                double offset = 0;
                for(int i=0;i<index;i++){
                  offset += keys.elementAt(i).currentContext!.size!.height;
                }
                _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              },
            ),
            DrawerItem(
              title: 'CSR',
              widgetKey: csrKey,
              onPressed: (){
                int index = keys.indexOf(csrKey);
                double offset = 0;
                for(int i=0;i<index;i++){
                  offset += keys.elementAt(i).currentContext!.size!.height;
                }
                _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              },
            ),
            DrawerItem(
              title: 'BLOG',
              widgetKey: blogKey,
              onPressed: (){
                int index = keys.indexOf(blogKey);
                double offset = 0;
                for(int i=0;i<index;i++){
                  offset += keys.elementAt(i).currentContext!.size!.height;
                }
                _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              },
            ),
            DrawerItem(
              title: 'CONTACT US',
              widgetKey: contactKey,
              onPressed: (){
                int index = keys.indexOf(contactKey);
                double offset = 0;
                for(int i=0;i<index;i++){
                  offset += keys.elementAt(i).currentContext!.size!.height;
                }
                _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          controller: _scrollController,
        child: Column(
          children: [
            ImageCarousel(
              key: homeKey,
            ),
            About(key: aboutKey),
            JRHistory(key: heritageKey),
            CSR(key: csrKey)
          ],

        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: _isVisible?FloatingActionButton(
        tooltip: 'Back to top',
        child: const Icon(Icons.keyboard_arrow_up),
        onPressed: (){
          _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
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

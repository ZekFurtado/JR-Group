import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr_group/home/components/navbarbuttons.dart';
import 'package:jr_group/home/components/topimage.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../res/constants.dart';
import '../view model/responsive.dart';
import 'components/about.dart';
import 'components/csr.dart';
import 'components/drawer_item.dart';
import 'components/history.dart';
import 'components/parallax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isVisible = false;
  List<String> images = ['interior1.jpg','interior2.jpg'];
  int index = 0;
  bool visible = false;
  late Timer _timer;

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

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        index = (index + 1) % images.length;
      });
    });
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
    _startTimer();
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
            // ImageCarousel(
            //   key: homeKey,
            // ),
            // About(key: aboutKey),
            // JRHistory(key: heritageKey),
            // CSR(key: csrKey)
            for(int i=0;i<3;i++) SubPages()
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

class SubPages extends StatefulWidget {
  const SubPages({Key? key}) : super(key: key);

  @override
  State<SubPages> createState() => _SubPagesState();
}

class _SubPagesState extends State<SubPages> {
  bool _isVisible = false;
  List<String> images = ['interior1.jpg','interior2.jpg'];
  int index = 0;
  bool visible = false;
  late Timer _timer;

  List<Widget> backgrounds(){
    return [
      AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: Image(
          image: AssetImage("assets/${images[index]}"),
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded){
            return child;
          },
          loadingBuilder: (context, child, loadingProgress){
            if(loadingProgress == null){
              return child;
            }
            else{
              return SizedBox(
                height: MediaQuery.of(context).size.height-kToolbarHeight,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1.0)
                        : null,
                  ),
                ),
              );
            }
          },
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height-kToolbarHeight,
          width: MediaQuery.of(context).size.width,
          key: ValueKey<String>("assets/${images[index]}"),
        ),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
      Container(
        decoration: BoxDecoration(
            color: Color(0xffFBF6ED),
            image: DecorationImage(
                image: AssetImage('assets/about_background.png'),
                fit: MediaQuery.of(context).size.width>1500? BoxFit.fitHeight:BoxFit.fitWidth,
                alignment: Alignment.centerLeft
            )
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height-kToolbarHeight,
        // color: lightColorScheme.onPrimaryContainer,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Parchment-Paper-Texture1.jpg'),
            fit: BoxFit.fitWidth,
          ),
        ),

      ),
    ];
  }

  List<Widget> contents(){
    return [
      Container(
          color: Colors.brown[900]!.withOpacity(0.6),
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Crafting Dreams, Shaping Spaces", style: GoogleFonts.dancingScript(color: Colors.white,fontSize: 100),textAlign: TextAlign.center,)
              )
          )
      ),
      VisibilityDetector(
          key: Key('my-widget-key'),
          onVisibilityChanged: (visibilityInfo){
            print(visibilityInfo.visibleFraction*100);
            setState(() {
              _isVisible = visibilityInfo.visibleFraction*100 > 25.0;
            });
          },
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: _isVisible ? 1.0 : 0.0,
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                transform: Matrix4.translationValues(
                  0.0,
                  _isVisible ? 0.0 : 50.0,
                  0.0,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: edgePadding,right: edgePadding),
                  child: MediaQuery.of(context).size.width>1800? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Who We Are",style: GoogleFonts.playfairDisplay(fontSize: 28,fontWeight: FontWeight.w600),),
                          Text("About",style: GoogleFonts.playfairDisplay(fontSize: 100,fontWeight: FontWeight.w600,color: Color(0xffCF9529)),),
                          Text("        JOGARAM GROUP",style: GoogleFonts.playfairDisplay(fontSize: 50,fontWeight: FontWeight.w600,)),
                          const SizedBox(height: 20,),
                          const SizedBox(
                            width: 70,
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.45,
                            child: Text(
                              "At Joga Ram Group, our mission is to build on our legacy of excellence that began in 1988, by consistently delivering high-quality products and services in the fields of furniture, building contracting, and general trading. We are committed to providing comprehensive solutions for office and residential interiors in the MENA region and beyond. We achieve this by embracing cutting-edge technology, fostering innovation, and most importantly, investing in and retaining the right talent, all while ensuring sustainable support for our core verticals. Our dedication to customer satisfaction and our pursuit of excellence drive us as we",
                              style: GoogleFonts.playfairDisplay(fontSize: 22,fontWeight: FontWeight.w500),textAlign: TextAlign.justify,
                            ),
                          )

                        ],
                      ),
                      Spacer(flex: 1),
                      Transform.rotate(
                          angle: 0.261799,
                          child: Image.asset('assets/about.jpg')
                      )
                      // Image.asset('assets/about.jpg')
                    ],

                  ) : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Who We Are",style: GoogleFonts.playfairDisplay(fontSize: 28,fontWeight: FontWeight.w600),),
                      Text("About",style: GoogleFonts.playfairDisplay(fontSize: 100,fontWeight: FontWeight.w600,color: Color(0xffCF9529)),),
                      Text("JOGARAM GROUP",style: GoogleFonts.playfairDisplay(fontSize: 70,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
                      const SizedBox(
                        width: 70,
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.8,
                        child: Text("At Joga Ram Group, our mission is to build on our legacy of excellence that began in 1988, by consistently delivering high-quality products and services in the fields of furniture, building contracting, and general trading. We are committed to providing comprehensive solutions for office and residential interiors in the MENA region and beyond. We achieve this by embracing cutting-edge technology, fostering innovation, and most importantly, investing in and retaining the right talent, all while ensuring sustainable support for our core verticals. Our dedication to customer satisfaction and our pursuit of excellence drive us as we",style: GoogleFonts.playfairDisplay(fontSize: 22,),textAlign: TextAlign.justify,),
                      ),
                      const SizedBox(height: 150,),
                      Padding(
                        padding: EdgeInsets.only(left: 70,right: 70),
                        child: Transform.rotate(
                            angle: 0.261799,
                            child: Image.asset('assets/about.jpg')
                        ),
                      )
                    ],
                  ),
                )
            ),
          )

      ),
      VisibilityDetector(
          key: const Key('my-key'),
          onVisibilityChanged: (visibilityInfo){
            setState(() {
              _isVisible = visibilityInfo.visibleFraction*100 > 25.0;
            });
          },
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _isVisible ? 1.0 : 0.0,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                transform: Matrix4.translationValues(
                  0.0,
                  _isVisible ? 0.0 : 50.0,
                  0.0,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: edgePadding,right: edgePadding),
                  child: MediaQuery.of(context).size.width>1500? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Inherited",style: GoogleFonts.playfairDisplay(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white),),
                          Text("Timeless",style: GoogleFonts.playfairDisplay(fontSize: 100,fontWeight: FontWeight.w600,color: const Color(0xffCF9529)),),
                          Text("        Heritage & Culture",style: GoogleFonts.playfairDisplay(fontSize: 50,fontWeight: FontWeight.w600,color: Colors.white)),
                        ],
                      ),
                      // const SizedBox(height: 100,),
                      Spacer(),
                      SizedBox(
                          height: 800,
                          width: MediaQuery.of(context).size.width/2,
                          child: Center(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Tile(title: "In 1980's", subtitle: "Riding the rapid development and economic wave", content: "Our remarkable corporate journey",),
                                  Tile(title: "In 1980's", subtitle: "Riding the rapid development and economic wave", content: "Our remarkable corporate journey",),
                                ],
                              )
                              ,
                            ),
                          )
                      ),
                      const SizedBox(height: 200,),
                    ],
                  ) : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Inherited",style: GoogleFonts.playfairDisplay(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white),),
                      Text("Timeless",style: GoogleFonts.playfairDisplay(fontSize: 100,fontWeight: FontWeight.w600,color: const Color(0xffCF9529)),),
                      Text("Heritage & Culture",style: GoogleFonts.playfairDisplay(fontSize: 70,fontWeight: FontWeight.w600, color: Colors.white),textAlign: TextAlign.center,),
                    ],
                  ),
                )
            ),
          )

      )
    ];
  }
  Widget _buildParallaxBackground(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      width: MediaQuery.of(context).size.width,
      child: Flow(
        delegate: ParallaxFlowDelegate(
          scrollable: Scrollable.of(context),
          listItemContext: context,
          backgroundImageKey: backgroundImageKey,
        ),
        children: backgrounds(),
      )
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contents(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildParallaxBackground(context),
        _buildGradient(),
        _buildTitleAndSubtitle(),
      ],
    );
  }
}

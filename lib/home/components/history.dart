import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../res/constants.dart';

class JRHistory extends StatefulWidget {
  const JRHistory({Key? key}) : super(key: key);

  @override
  State<JRHistory> createState() => _JRHistoryState();
}

class _JRHistoryState extends State<JRHistory> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
        Container(
          height: MediaQuery.of(context).size.height-kToolbarHeight,
          color: Colors.brown[900]?.withOpacity(0.6),
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
      ],
    );
  }
}

class Tile extends StatelessWidget {
  Tile({Key? key, required this.title, required this.subtitle, required this.content}) : super(key: key);

  String title,subtitle,content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.5,
      // width: MediaQuery.of(context).size.width*0.2,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            Text(title),
            Text(subtitle),
            Divider(),
            Text(content)
          ],
        ),
      ),
    );
  }
}

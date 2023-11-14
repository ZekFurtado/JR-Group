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
  bool _istile1Visible = false;
  bool _istile2Visible = false;
  bool _istile3Visible = false;
  bool _istile4Visible = false;
  bool _istile5Visible = false;
  bool _istile6Visible = false;


  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height-appBarHeight,
        color: lightColorScheme.onPrimaryContainer,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: -MediaQuery.of(context).size.width*0.45,
                // alignment: Alignment.centerRight,
                child: Image.asset('assets/clock.png',opacity: AlwaysStoppedAnimation(0.5),color: Theme.of(context).colorScheme.inversePrimary,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,)
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
                      onEnd: (){
                        setState(() {
                          _istile1Visible = true;
                        });
                      },
                      transform: Matrix4.translationValues(
                        0.0,
                        _isVisible ? 0.0 : 50.0,
                        0.0,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: edgePadding,right: edgePadding),
                        child: MediaQuery.of(context).size.width>1500? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 100,),
                            Text("Inherited",style: GoogleFonts.playfairDisplay(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white),),
                            Text("Timeless",style: GoogleFonts.playfairDisplay(fontSize: 100,fontWeight: FontWeight.w600,color: const Color(0xffCF9529)),),
                            Text("        Heritage & Culture",style: GoogleFonts.playfairDisplay(fontSize: 50,fontWeight: FontWeight.w600,color: Colors.white)),
                            const SizedBox(height: 100,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AnimatedOpacity(
                                    duration: const Duration(milliseconds: 200),
                                    onEnd: (){
                                      setState(() {
                                        _istile2Visible = true;
                                      });
                                    },
                                    opacity: _istile1Visible ? 1.0 : 0.0,
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      transform: Matrix4.translationValues(
                                        0.0,
                                        _istile1Visible ? 0.0 : 50.0,
                                        0.0,
                                      ),
                                      child: const Tile(title: "In 1980's", subtitle: "Riding the rapid development and economic wave", content: "Our remarkable corporate journey took its inaugural steps in the early 1980's, aligning perfectly with the UAE's ambitious pursuit of global recognition in the realms of business and economics.",),
                                    )
                                ),
                                AnimatedOpacity(
                                    duration: const Duration(milliseconds: 200),
                                    onEnd: (){
                                      setState(() {
                                        _istile3Visible = true;
                                      });
                                    },
                                    opacity: _istile2Visible ? 1.0 : 0.0,
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      transform: Matrix4.translationValues(
                                        0.0,
                                        _istile2Visible ? 0.0 : 50.0,
                                        0.0,
                                      ),
                                      child: const Tile(title: "In 1999's", subtitle: "A milestone year when JOGA RAM FURNITURE LLC was born", content: "This year marked the inception of the subsidiary ventures starting with JOGA RAM FURNITURE LLC. Guided by our unwavering pioneer spirit, we proudly opened our inaugural office, equipped with state-of-the-art interior, fit out, and joinery manufacturing facilities in the dynamic heart of Dubai.",),
                                    )
                                ),
                                AnimatedOpacity(
                                    duration: const Duration(milliseconds: 200),
                                    onEnd: (){
                                      setState(() {
                                        _istile4Visible = true;
                                      });
                                    },
                                    opacity: _istile3Visible ? 1.0 : 0.0,
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      transform: Matrix4.translationValues(
                                        0.0,
                                        _istile3Visible ? 0.0 : 50.0,
                                        0.0,
                                      ),
                                      child: const Tile(
                                        title: "In 2000's",
                                        subtitle: "Venturing into the turnkey solution sector",
                                        content: "During the early 2000's, JOGA RAM GROUP embarked on an expansion into the realm of building contracting and the general trading of building materials. The strategic move allowed us to significantly grow our market presence, establishing a substantial footprint in the turnkey solutions sector.",
                                      ),
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 70),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AnimatedOpacity(
                                    duration: const Duration(milliseconds: 200),
                                    onEnd: (){
                                      setState(() {
                                        _istile5Visible = true;
                                      });
                                    },
                                    opacity: _istile4Visible ? 1.0 : 0.0,
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      transform: Matrix4.translationValues(
                                        0.0,
                                        _istile4Visible ? 0.0 : 50.0,
                                        0.0,
                                      ),
                                      child: const Tile(title: "In 2007's", subtitle: "JOGA RAM Building Materials LLC and JOGA RAM Building Contracting Co LLC were established", content: "This year marked the establishment of two entities - JOGA RAM Building Materials LLC and JOGA RAM Building Contracting Co LLC. These entities have since blossomed into thriving organizations, delivering exceptional services across various sectors with a particular focus on high-end residential and commercial segments, while remaining committed to sustainable development goals.",),
                                    )
                                ),
                                AnimatedOpacity(
                                    duration: const Duration(milliseconds: 200),
                                    onEnd: (){
                                      setState(() {
                                        _istile6Visible = true;
                                      });
                                    },
                                    opacity: _istile5Visible ? 1.0 : 0.0,
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      transform: Matrix4.translationValues(
                                        0.0,
                                        _istile5Visible ? 0.0 : 50.0,
                                        0.0,
                                      ),
                                      child: const Tile(title: "In 2017's", subtitle: "We redefined luxurious living", content: "In 2017, the JOGA RAM GROUP took a bold leap into the realm of ultra-high-end luxury, diving headfirst into the domains of interior design consulting, project management consulting, and interior fit-out contracting. With design as our guiding principle and a commitment to metamorphose spaces into havens of sheer delight, the JOGA RAM GROUP initiated a journey destinated to redefine the very core of luxurious living. As we embarked on this path, we brought to life a series of extraordinary projects, leaving an indelible mark in the history as the visionary creators of enduring landmarks.",),
                                    )
                                ),
                                AnimatedOpacity(
                                    duration: const Duration(milliseconds: 200),
                                    opacity: _istile6Visible ? 1.0 : 0.0,
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      transform: Matrix4.translationValues(
                                        0.0,
                                        _istile6Visible ? 0.0 : 50.0,
                                        0.0,
                                      ),
                                      child: const Tile(title: "In 2023's", subtitle: "Extending our reach with JOGA RAM PROPERTIES", content: "In 2023, we proudly extended our horizon with the introduction of JOGA RAM PROPERTIES, a significant addition to our diverse value chain. This venture encompasses an array of services, including real estate, civil construction, refurbishment, as well as buying, selling, leasing, and brokering services. We are dedicated to providing comprehensive turnkey infrastructure solutions to our esteemed patrons, with a commitment that goes beyond facility management to ensure excellence at every stage of the journey.",),
                                    )
                                ),
                              ],
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
        )
    );
  }
}

class Tile extends StatefulWidget {
  const Tile({Key? key, required this.title, required this.subtitle, required this.content}) : super(key: key);

  final String title,subtitle,content;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool isHovered = false;
  bool isTextVisible = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event){
        setState(() {
          isHovered = true;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: isHovered?MediaQuery.of(context).size.height*0.6:MediaQuery.of(context).size.height*0.3,
        onEnd: (){
          setState(() {
            isTextVisible = true;
          });
        },
        width: MediaQuery.of(context).size.width*0.2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.inversePrimary,
            image: DecorationImage(
              image: AssetImage('assets/parchment.jpg',),
              fit: BoxFit.cover,
              opacity: 0.5
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.title,style: GoogleFonts.tinos(fontWeight: FontWeight.w600,fontSize: 40)),
              Text(widget.subtitle,style: GoogleFonts.tinos(fontWeight: FontWeight.w600,fontSize: 24),textAlign: TextAlign.center,),
              const SizedBox(height: 20),
              LayoutBuilder(builder: (context, constraints)=>AnimatedContainer(
                width: isHovered?constraints.maxWidth-100:0,
                duration: const Duration(milliseconds: 200),
                color: Colors.black,
                height: 1,
                // child: Divider(color: Colors.black,indent: 50,endIndent: 50,),
              )),
              const SizedBox(height: 15),
              isHovered?AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isTextVisible ? 1.0 : 0.0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: Matrix4.translationValues(
                      0.0,
                      isTextVisible ? 0.0 : -20.0,
                      0.0,
                    ),
                    padding: EdgeInsets.all(20),
                    child: Text(widget.content,style: GoogleFonts.tinos(fontWeight: FontWeight.w500,fontSize: 18),textAlign: TextAlign.center,),
                  )
              ):const SizedBox()
            ],
          ),
        ),
      )
    );
  }
}


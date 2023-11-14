import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr_group/res/app_icons_icons.dart';
import 'package:jr_group/res/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';


import '../../view model/responsive.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFBF6ED),
        image: DecorationImage(
          image: const AssetImage('assets/about_background.png'),
          fit: MediaQuery.of(context).size.width>1500? BoxFit.fitHeight:BoxFit.fitWidth,
          alignment: Alignment.centerLeft
        )
      ),
      height: MediaQuery.of(context).size.width>1800? MediaQuery.of(context).size.height-kToolbarHeight:MediaQuery.of(context).size.height*2,
      child: VisibilityDetector(
        key: const Key('my-widget-key'),
        onVisibilityChanged: (visibilityInfo){
          print(visibilityInfo.visibleFraction*100);
          setState(() {
            _isVisible = visibilityInfo.visibleFraction*100 > 25.0;
          });
        },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(  
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 1,
                    width: _isVisible?MediaQuery.of(context).size.width*0.25:0,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 20,),
                  Animate(
                    effects: const [RotateEffect(duration: Duration(milliseconds: 500))],
                    target: _isVisible?1:0,
                    child: SvgPicture.asset(
                      'assets/compass.svg',
                      width: 50,
                    )
                  ),
                  const SizedBox(width: 20,),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 1,
                    width: _isVisible?MediaQuery.of(context).size.width*0.25:0,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ],
              ),
              AnimatedOpacity(
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
            ],
          )

      ),
    );
  }
}

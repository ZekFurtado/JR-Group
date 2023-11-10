import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr_group/res/constants.dart';

import '../../view model/responsive.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFBF6ED),
        image: DecorationImage(
          image: AssetImage('assets/about_background.png'),
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerLeft
        )
      ),
      height: MediaQuery.of(context).size.width>1500? MediaQuery.of(context).size.height:MediaQuery.of(context).size.height*2,
      child: Padding(
        padding: EdgeInsets.only(left: 0,right: 0),
        child: MediaQuery.of(context).size.width>1500? Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Who We Are",style: GoogleFonts.playfairDisplay(fontSize: 28,fontWeight: FontWeight.w600),),
                Text("About",style: GoogleFonts.playfairDisplay(fontSize: 100,fontWeight: FontWeight.w600,color: Color(0xffCF9529)),),
                Text("JOGARAM GROUP",style: GoogleFonts.playfairDisplay(fontSize: 70,fontWeight: FontWeight.w600,)),
                const SizedBox(
                  width: 70,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.45,
                  child: Text("At Joga Ram Group, our mission is to build on our legacy of excellence that began in 1988, by consistently delivering high-quality products and services in the fields of furniture, building contracting, and general trading. We are committed to providing comprehensive solutions for office and residential interiors in the MENA region and beyond. We achieve this by embracing cutting-edge technology, fostering innovation, and most importantly, investing in and retaining the right talent, all while ensuring sustainable support for our core verticals. Our dedication to customer satisfaction and our pursuit of excellence drive us as we",style: GoogleFonts.playfairDisplay(fontSize: 22,),textAlign: TextAlign.justify,),
                )

              ],
            ),
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
            Text("JOGARAM GROUP",style: GoogleFonts.playfairDisplay(fontSize: 70,fontWeight: FontWeight.w600,)),
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
            Transform.rotate(
                angle: 0.261799,
                child: Image.asset('assets/about.jpg')
            )
          ],
        ),
      ),
    );
  }
}

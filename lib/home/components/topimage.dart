import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr_group/res/constants.dart';
import 'package:jr_group/res/transparent_image.dart';
import 'dart:async';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {

  List<String> images = ['interior1.jpg','interior2.jpg'];
  int index = 0;
  bool visible = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        index = (index + 1) % images.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
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
                    height: MediaQuery.of(context).size.height-appBarHeight,
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
              height: MediaQuery.of(context).size.height-appBarHeight,
              width: MediaQuery.of(context).size.width,
              key: ValueKey<String>("assets/${images[index]}"),
            ),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
          Container(
              color: Colors.brown[900]!.withOpacity(0.6),
              height: MediaQuery.of(context).size.height - appBarHeight,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Crafting Dreams, Shaping Spaces", style: GoogleFonts.dancingScript(color: Colors.white,fontSize: 100),textAlign: TextAlign.center,)
                  )
              )
          )
        ],
      )
    );
  }
}

class CarouselText extends StatefulWidget {
  const CarouselText({Key? key}) : super(key: key);

  @override
  State<CarouselText> createState() => _CarouselTextState();
}

class _CarouselTextState extends State<CarouselText> {
  bool _isVisible = false;

  @override
  void initState(){
    super.initState();
    WidgetsFlutterBinding().addPostFrameCallback((timeStamp) { });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: _isVisible ? 1.0 : 0.0,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          transform: Matrix4.translationValues(
            0.0,
            _isVisible ? 0.0 : 50.0,
            0.0,
          ),
          child: Container(
              color: Colors.brown[900]!.withOpacity(0.6),
              height: MediaQuery.of(context).size.height - appBarHeight,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Crafting Dreams, Shaping Spaces", style: GoogleFonts.dancingScript(color: Colors.white,fontSize: 100),textAlign: TextAlign.center,)
                  )
              )
          )
      ),
    );
  }
}


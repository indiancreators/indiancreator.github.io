import 'package:indiancreator/res/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../animation/entranceFader.dart';
import '../responsive.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: cardColor,
          image: DecorationImage(
              image: AssetImage("assets/backgroundimage.png"),
              opacity: 20,
              fit: BoxFit.cover)),
      height: height ,
      width: width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: MediaQuery.of(context).size.width < 850 ? EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/7 , vertical: 90):
                      EdgeInsets.fromLTRB(width * 0.1, height * 0.2, 0, 0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Creating content that \ncaptures attention",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          "We help brands grow by \nsocial media 🚀",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: cardColor),
                                backgroundColor: mColor,
                                elevation: 2),
                            onPressed: () {},
                            child: Text(
                              "Lean How",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white)
                            ).paddingAll(11))
                      ],
                    ),
                  ),
                ),
                if (Responsive.isDesktop(context))
                  Opacity(
                    opacity: 0.9,
                    child: EntranceFader(
                      offset: const Offset(0, 0),
                      delay: const Duration(seconds: 1),
                      duration: const Duration(milliseconds: 800),
                      child: Image.network(
                        'assets/a.png',
                        height: width < 1200 ? height * 0.7 : height * 0.75,
                      ),
                    ),
                  ),
                if(Responsive.isTablet(context))
                  Opacity(

                    opacity: 0.9,
                    child: EntranceFader(
                      offset: const Offset(0, 0),
                      delay: const Duration(seconds: 1),
                      duration: const Duration(milliseconds: 800),
                      child: Image.network(
                        'assets/a.png',
                        height: width < 1200 ? height * 0.4 : height * 0.5,
                      ).paddingOnly(top: 70),
                    ),
                  ),
              ],
            ),
            if (Responsive.isMobile(context))
              Opacity(
                opacity: 0.9,
                child: EntranceFader(
                  offset: const Offset(0, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: Image.network(
                    'assets/a.png',
                    height: MediaQuery.of(context).size.height/2,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

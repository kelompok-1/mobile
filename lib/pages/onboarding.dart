import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:skoolen/onboarding%20screen/content_model.dart';
import 'package:skoolen/pages/login.dart';

import '../auth/main_page.dart';

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  // hexa colors
  Color HexaColor(String strcolor, {int opacity = 15}) {
    //opacity is optional value
    strcolor = strcolor.replaceAll("#", ""); //replace "#" with empty value
    String stropacity =
        opacity.toRadixString(16); //convert integer opacity to Hex String
    return Color(int.parse("$stropacity$stropacity" + strcolor, radix: 16));
    //here color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: SafeArea(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset("assets/pictures/Logo Biru.png",
                                scale: 4),
                            SizedBox(height: 20),
                            Lottie.asset(contents[i].image, height: 300),
                            Text(
                              contents[i].title,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              contents[i].discription,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            width: double.infinity,
            child: TextButton(
              child: Text("Daftar Sekarang"),
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xff00b1d2),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            width: double.infinity,
            child: OutlinedButton(
              child: Text("Masuk"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: const Color(0xff00b1d2),
                side: BorderSide(width: 2, color: const Color(0xff00b1d2)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      margin: EdgeInsets.only(right: 5),
      width: currentIndex == index ? 25 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? const Color(0xff00b1d2) : Colors.grey,
      ),
    );
  }
}

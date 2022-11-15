import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:skoolen/auth/auth_page.dart';
import 'package:skoolen/auth/main_page.dart';
import 'package:skoolen/pages/home_page.dart';
import 'package:skoolen/pages/login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _controller = PageController();

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
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/pictures/Logo Biru.png", scale: 4),
                SizedBox(
                  height: 500,
                  child: PageView(
                    controller: _controller,
                  ),
                ),
                Lottie.asset('assets/animations/27637-welcome.json'),
                // Tombol Daftar Sekarang
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        // opacity ranges from 0-15
                        color: HexaColor("#00b1d2", opacity: 15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Daftar Sekarang',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Tombol Masuk
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        // opacity ranges from 0-15
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xff00b1d2),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                            color: HexaColor("#00b1d2", opacity: 15),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

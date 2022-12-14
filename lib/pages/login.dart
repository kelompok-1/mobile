import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolen/pages/onboarding.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _btnEmailActive = false;
  bool _btnPasswordActive = false;

  // hexa colors
  Color HexaColor(String strcolor, {int opacity = 15}) {
    //opacity is optional value
    strcolor = strcolor.replaceAll("#", ""); //replace "#" with empty value
    String stropacity =
        opacity.toRadixString(16); //convert integer opacity to Hex String
    return Color(int.parse("$stropacity$stropacity" + strcolor, radix: 16));
    //here color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
  }

  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text(
            'Masuk',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 1,
          backgroundColor: Colors.grey[200],
          leading: IconButton(
            splashRadius: 19,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Onboarding()),
              );
            },
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // // Logo
                // Image.asset(
                //   "assets/pictures/Logo Biru.png",
                //   scale: 6,
                // ),

                SizedBox(height: 15),

                // login icon
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/pictures/login_icon.png", scale: 7),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                // Yay! Kamu kembali
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yay! Kamu kembali',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 5),

                // Yuk, lanjutin belajar di Skoolen untuk capai tujuanmu.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        'Yuk, lanjutin belajar di Skoolen untuk capai tujuanmu.',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                // Masukkin E-Mail atau Nomor HP
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        'Masukkin E-Mail atau Nomor HP',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                // email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    cursorColor: const Color(0xffFDDB27),
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_2,
                        color: Color(0xff00B1D2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff00B1D2)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Ketik salah satu di sini',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _btnEmailActive = value.length >= 1 ? true : false;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),

                // Kata Sandi
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        'Kata Sandi',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                // Kata Sandi textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    cursorColor: const Color(0xffFDDB27),
                    controller: _passwordController,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xff00B1D2),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: obscureText
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: Colors.grey,
                              ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff00B1D2)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Ketik di sini',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _btnPasswordActive = value.length >= 1 ? true : false;
                      });
                    },
                  ),
                ),

                SizedBox(height: 10),

                // Lupa kata sandi
                Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        child: Text(
                          "Lupa kata sandi?",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xff00B1D2),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => MainPage()),
                          // );
                        },
                        style: TextButton.styleFrom(
                          disabledBackgroundColor: Colors.amber,
                          backgroundColor: Colors.grey[200],
                          foregroundColor: const Color(0xff00b1d2),
                          side: BorderSide(width: 0, color: Colors.transparent),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                Container(
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Masuk",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _btnEmailActive && _btnPasswordActive == true
                        ? () {}
                        : null,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xff00b1d2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: new Container(
                            margin:
                                const EdgeInsets.only(left: 25.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 0,
                            ),
                          ),
                        ),
                        Text(
                          "atau masuk dengan",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 25.0),
                            child: Divider(
                              color: Colors.black,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10),

                SignInButton(
                  Buttons.Google,
                  text: "Sign in with Google",
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.AppleDark,
                  text: "Sign in with Apple ID",
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.FacebookNew,
                  text: "Sign in with Facebook",
                  onPressed: () {},
                ),

                SizedBox(height: 15),

                // Belum punya akun? Daftar Sekarang
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        // onTap: widget.showRegisterPage,
                        child: Text(
                          ' Registrasi Sekarang',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xff00b1d2),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Syarat Ketentuan & Kebijakan Privasi
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Dengan masuk atau daftar Skoolen, saya menyetujui : ',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        // onTap: widget.showRegisterPage,
                        child: Text(
                          textAlign: TextAlign.start,
                          'Syarat Ketentuan & Kebijakan Privasi',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Color(0xff00b1d2),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Column(
                //   children: <Widget>[
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         new Container(
                //           margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                //           child: SignInButton(
                //             Buttons.Google,
                //             text: "Sign in with Google",
                //             onPressed: () {},
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(20),
                //             ),
                //           ),
                //         ),
                //         new Container(
                //           margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                //           child: SignInButton(
                //             Buttons.Facebook,
                //             mini: true,
                //             onPressed: () {},
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(20),
                //             ),
                //           ),
                //         ),
                //         new Container(
                //           margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                //           child: SignInButton(
                //             Buttons.AppleDark,
                //             mini: true,
                //             onPressed: () {},
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(20),
                //             ),
                //           ),
                //         ),
                //       ],
                //     )
                //   ],
                // ),

                SizedBox(height: 75),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

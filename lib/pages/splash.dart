import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_avision/res/colored.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final int? login = prefs.getInt('login');
      if (mounted) {
        if (login == 1) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/dashboard', (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/login', (Route<dynamic> route) => false);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              HexColor(Colored.bluebg2),
              HexColor(Colored.bluebg1),
              HexColor(Colored.bluebg3)
            ],
          )),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/image/avision.png",
                      fit: BoxFit.fill,
                      height: 175, //full screen
                      width: 300),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/image/human.png",
                    fit: BoxFit.fill,
                    height: 380, //full screen
                    width: 300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

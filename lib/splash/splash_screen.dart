import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_shop_app/login/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  void navigate() async {
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, MyLogin.routeName);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Expanded(
            child: Center(
              child: Container(
                width: double.infinity,
                child: Lottie.asset(
                  "assets/animation/loader.json",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

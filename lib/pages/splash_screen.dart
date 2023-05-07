import 'package:flutter/material.dart';

import '../constants/images.dart';
import 'data_input_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToDataInputPage();
  }

  void navigateToDataInputPage() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, DataInputScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 225, 237, 247),
      backgroundColor: const Color(0xFFDDF0F6),
      body: Center(
        child: Image.asset(
          Images.splash,
          height: 300,
        ),
      ),
    );
  }
}

//  Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const DataInputScreen()));
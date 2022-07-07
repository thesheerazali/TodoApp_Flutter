import 'package:flutter/material.dart';

import '../constants/images.dart';
import 'data_input_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DataInputScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        Images.logo,
        height: 150,
      ),
    ));
  }
}

//  Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const DataInputScreen()));
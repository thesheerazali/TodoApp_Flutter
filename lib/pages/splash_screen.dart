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
      backgroundColor: const Color.fromARGB(255, 225, 237, 247),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.splash,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                'Life should not be reduced to a to do list',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Pacifico',
                  color: Colors.blue.shade600,
                ),
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}

//  Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const DataInputScreen()));
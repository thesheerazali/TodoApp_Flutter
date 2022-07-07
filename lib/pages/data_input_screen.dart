import 'package:flutter/material.dart';

import '../constants/images.dart';

class DataInputScreen extends StatelessWidget {
  const DataInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Data Entry Screen'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check_box),
            iconSize: 30,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(Images.dataimage),
          ),
          const SizedBox(
            width: 350,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Text'),
            ),
          ),
        ],
      ),
    );
  }
}

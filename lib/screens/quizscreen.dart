
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../body/body.dart';
import '../models/questioncontroler.dart';


class QuisScreen extends StatelessWidget {
  const QuisScreen({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuistionController _controler = Get.put(QuistionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: _controler.nextQuestion,
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body:const Body(

      ),
    );
  }
}

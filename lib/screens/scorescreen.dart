import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:quizapp/screens/quizscreen.dart';
import 'package:quizapp/screens/welcomscreen.dart';

import '../models/auth_model.dart';
import '../models/questioncontroler.dart';
import '../transetionpagerout/pageroutanimation.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var hight = size.height;
    var wid = size.width;
    Authen authen=Authen();
    QuistionController _qnControler = Get.put(QuistionController());
    double x = (_qnControler.numOfCorrectAns / 4) * 100;
    String finalReslt = "";

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()async{
            await authen.signOut();
            Get.offAll(const WelcomeScreen());
          }, icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: hight * 0.4,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Colors.blue,
                    ],
                  ),
                ),
                child: Expanded(child: Lottie.asset('assets/welcome.json')),
              ),
            ),
            Center(
              widthFactor: 60,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Score',
                      style: TextStyle(
                        fontSize: 60,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CircularPercentIndicator(
                      animation: true,
                      radius: 130,
                      lineWidth: 20,
                      percent: x / 100,
                      progressColor: x < 50 ? Colors.red : Colors.green,
                      backgroundColor: Colors.red.shade100,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        '$x % ',
                        style: const TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
                    Text(
                        _qnControler.result(finalReslt, x),
                      style: const TextStyle(
                        fontSize: 60,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _qnControler.restart();
                       Get.to(const QuisScreen());
                      },
                      child: Container(
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white24,
                                blurRadius: 10,
                                spreadRadius: 5,
                                offset: Offset(10, 10)),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        width: wid / 3,
                        margin: const EdgeInsets.all(20),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 90),
                          child: Center(
                              child: Text(
                            'Restart Quiz',
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 80);

    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

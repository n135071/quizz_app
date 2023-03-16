import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/screens/quizscreen.dart';
import '../models/auth_model.dart';
import '../models/questioncontroler.dart';
import 'constsnt/constant.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  var name = "";
  Authen authen = Authen();
  bool isname = false;

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var hight = size.height;
    var wid = size.width;

    QuistionController _questioncontroller1 = Get.put(QuistionController());

    return Scaffold(
      body: Stack(
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
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Spacer(
                  flex: 3,
                ),
                Text(
                  'Let`s Play Quiz ',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                   var response= await authen.signInWithGoogle();
                   if(response != null){
                     _questioncontroller1.restart();
                     Get.offAll(const QuisScreen());

                   }

                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20 * 0.75),
                    decoration: const BoxDecoration(
                      gradient: PraimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      'Google sign in',
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          )),
        ],
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
        size.width / 2, size.height / 2, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

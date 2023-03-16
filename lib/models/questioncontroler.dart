import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/scorescreen.dart';

class QuistionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String result(String x, double b) {
    if (b == 0) {
      x = 'Bad';
    }
    if (b < 50) {
      x = 'Low Level';
    }
    if (b >= 50 && b != 100) {
      x = 'Very good';
    }
    if (b == 100) {
      x = 'Excellent';
    }
    return x;
  }

  late AnimationController animationController;
  late Animation _animation;

  Animation get animation => _animation;

  late PageController _pageController;

  Random numbers = Random();
  late int num1 = numbers.nextInt(100);
  late int num2 = numbers.nextInt(100);
  String type = '';

  late String lastType = Type(type);

  PageController get pageController => _pageController;

  @override
  void onInit() {
    // animationController = AnimationController();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
    _animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        update();
      });
    animationController.forward().whenComplete(() => nextQuestion());
    _pageController = PageController();
    super.onInit();
  }

  bool _isAnswered = false;

  bool get isAnswered => _isAnswered;

  late int _correctAns = 0;

  late int _selectAns = 0;

  late int _selectAns1 = 0;

  int get selectAns1 => _selectAns1;

  RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;

  int get numOfCorrectAns => _numOfCorrectAns;
  @override
  void onColse() {
    super.onClose();
    animationController.dispose();
    _pageController.dispose();
  }

  void nextQuestion() {
    if (_questionNumber.value != 4) {
      _isAnswered = false;
      num1 = numbers.nextInt(100);
      num2 = numbers.nextInt(100);
      lastType = Type(type);
      corectans = corect(num1, num2, f, lastType);
      /* _option = [corectans - 2, corectans, corectans + 3, corectans + 2];*/
      _pageController.nextPage(
          duration: const Duration(microseconds: 250),
          curve: Curves.slowMiddle);
      animationController.reset();
      animationController.forward().whenComplete(() => nextQuestion());
    } else {
      Get.to(
        const ScoreScreen(),
      );
    }
  }

  void updatTheQnum(int index) {
    if (index <= 3) {
      _questionNumber.value = index + 1;
    } else {
      index = 0;
    }
  }

  void restart() {
    _isAnswered = false;
    _correctAns = 0;
    _questionNumber = 1.obs;
    _numOfCorrectAns = 0;
    _selectAns = 0;
    _selectAns1 = 0;
    animationController.reset();
    animationController.forward().whenComplete(() => nextQuestion());

    PageView(
      controller: _pageController = PageController(),
    );
  }

  String Type(String s) {
    Random type = Random();
    late int x = type.nextInt(4);
    switch (x) {
      case 0:
        s = '+';
        break;
      case 1:
        s = '*';
        break;
      case 2:
        s = '-';
        break;
      case 3:
        s = '/';
        if (num2 == 0) {
          num2 += 1;
        }
        break;
    }
    return s;
  }

  int f = 0;
  late int corectans = corect(num1, num2, f, lastType);
  late List<int> _option = [
    corectans,
    corectans + 1,
    corectans - 1,
    corectans + 2
  ];

  int corect(int x, int y, int d, String c) {
    switch (c) {
      case '*':
        d = x * y;
        break;
      case '/':
        d = x ~/ y;
        break;
      case '-':
        d = x - y;
        break;
      case '+':
        d = x + y;
        break;
    }

    return d;
  }

  void checkAns(int index, int answer) {
    _isAnswered = true;
    _correctAns = corectans;
    _selectAns = index;
    _selectAns1 = answer;

    if (_correctAns == _selectAns) {
      _numOfCorrectAns++;
    }
    animationController.stop();

    update();

    Future.delayed(
      const Duration(seconds: 1),
      () {
        nextQuestion();
      },
    );
  }

 /*List get option => Shuffle(_option);*/


 /*List Shuffle(List array) {
    Random rand = Random();
    for (var i = array.length - 1; i > 0; i--) {
      var n = rand.nextInt(i + 1);
      var temp = array[i];
      array[i] = array[n];
      array[n] = temp;
    }
    return array;
  }*/


}

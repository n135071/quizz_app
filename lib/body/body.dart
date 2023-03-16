import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../brograsbar.dart';
import '../models/questioncontroler.dart';
import '../screens/constsnt/constant.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuistionController _questioncontroller = Get.put(QuistionController());

    return Stack(
      children: [
        WebsafeSvg.asset('asset', fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: progressBar(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(

                  () => Text.rich(
                    TextSpan(
                        text:
                            "Question ${_questioncontroller.questionNumber.value}",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: KSecondaryColor),
                        children: [
                          TextSpan(
                            text: "/4",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: KSecondaryColor),
                          ),
                        ]),
                  ),
                ),
              ),
              const Divider(
                thickness: 1.5,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: _questioncontroller.updatTheQnum,
                  controller: _questioncontroller.pageController,
                  itemCount: 4,
                  itemBuilder: (context, index) => const QuestionCard(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Option extends StatelessWidget {
  const Option(
      {Key? key, required this.text, required this.index, required this.press})
      : super(key: key);
  final int text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuistionController>(
        init: QuistionController(),
        builder: (qnControler) {
          Color getTheRightColor() {
            if (qnControler.isAnswered) {
              if (text == qnControler.corectans) {
                return KGreenColor;
              } else if (index == qnControler.selectAns1 &&
                  text != qnControler.corectans) {
                return KRedColor;
              }
            }
            return KGrayColor;
          }

          IconData gettherightIcon() {
            return getTheRightColor() == KRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${index + 1}.  $text',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getTheRightColor()),
                      color: getTheRightColor() == KGrayColor
                          ? Colors.transparent
                          : getTheRightColor(),
                    ),
                    child: getTheRightColor() == KGrayColor
                        ? null
                        : Icon(
                            gettherightIcon(),
                            size: 16,
                          ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuistionController _controler = Get.put(QuistionController());
   /* final int number1 = _controler.num1;
    final int number2 = _controler.num2;*/
      List<int>kh = [
      _controler.corectans,
      _controler.corectans + 1,
      _controler.corectans - 1,
      _controler.corectans + 2,
    ];

    List<dynamic> KH = Shuffle(kh);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              " what is the result  ${_controler.num1}  ${_controler.lastType}  ${_controler.num2} ?",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.black,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            ...List.generate(
                4,
                (index) => Option(
                      index: index,
                      text: KH[index],
                      press: () {
                        _controler.checkAns(KH[index], index);
                      },
                    ))
          ],
        ),
      ),
    );
  }

List Shuffle(List array) {
    Random rand = Random();
    for (var i = array.length - 1; i > 0; i--) {
      var n = rand.nextInt(i + 1);
      var temp = array[i];
      array[i] = array[n];
      array[n] = temp;
    }
    return array;
  }

}

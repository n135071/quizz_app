import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/screens/constsnt/constant.dart';

import 'package:websafe_svg/websafe_svg.dart';

import 'models/questioncontroler.dart';


class progressBar extends StatelessWidget {
  const progressBar({
    Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF3F4768),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuistionController>(
          init: QuistionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width:
                    constraints.maxWidth * controller.animation.value,

                    decoration: BoxDecoration(
                      gradient: PraimaryGradient,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: KDefaultPadding / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '${(controller.animation.value * 60).round()} sec'
                        ),
                        WebsafeSvg.asset('asset'),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

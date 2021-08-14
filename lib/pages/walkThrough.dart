import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_compare/components/bezierBackground.dart';
import 'package:price_compare/components/buttons.dart';
import 'package:price_compare/pages/homePage.dart';
import 'package:price_compare/theme/themeStyles.dart';

class WalkThrough extends StatelessWidget {
  Widget _skipButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Text(
              'Skip',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 0,
                right: 10,
                top: 10,
                bottom: 10,
              ),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -Get.height * .15,
              right: -Get.size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: Get.height * .2),
                    SizedBox(height: 50),
                    Text(
                      "Welcome to Price Compare ",
                    ),
                    SizedBox(height: Get.height * .14),
                    RoundedShapeButton(
                      onClick: () {
                        Get.offAll(HomePage());
                      },
                      bgColor: ThemeColor.primeryColor,
                      title: "Continue",
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 0,
              child: _skipButton(),
            ),
          ],
        ),
      ),
    );
  }
}

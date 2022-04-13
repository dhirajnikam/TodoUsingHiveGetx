import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo/widgets/container/containWidget.dart';
import 'package:todo/widgets/text/textWidget.dart';

class Details extends StatelessWidget {
  var title;

  var desc;

  Details({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

// body
  _body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _top(),
            SizedBox(
              height: Get.height * 0.02,
            ),
            _titleText(),
            SizedBox(
              height: Get.height * 0.02,
            ),
            _descText()
          ],
        ),
      ),
    );
  }

// top part of body
  _top() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_backButton(), _title()],
    );
  }

// back button
  _backButton() {
    return ButtonTheme1(tap: () {
      Get.back();
    });
  }

// title
  _title() {
    return Expanded(child: Center(child: TextTitle(title: "Details")));
  }

// todo title text
  _titleText() {
    return TextTitle(title: title);
  }

// todo Desc Text
  _descText() {
    return TextTitle1(title: desc);
  }
}

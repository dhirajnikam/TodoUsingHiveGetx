import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo/widgets/text/textWidget.dart';

// todo Container
class TodoContainer extends StatelessWidget {
  var done;

  var title;

  var Donetap;

  var DetailTab;

  var width;

  var color;

  var deleteTab;

  var donecolor;

  TodoContainer({
    Key? key,
    required this.done,
    required this.title,
    required this.Donetap,
    required this.DetailTab,
    required this.width,
    required this.color,
    required this.deleteTab,
    required this.donecolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: DetailTab,
        child: Stack(
          alignment: Alignment.center,
          children: [_fontbody(), _background()],
        ),
      ),
    );
  }

// done line
  _fontbody() {
    return AnimatedContainer(
      duration: _duration(),
      width: width,
      color: color,
      height: 5,
    );
  }

// List Container body
  _background() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width * 0.02,
        ),
        _doneCheck(),
        SizedBox(
          width: Get.width * 0.02,
        ),
        _title(),
        _delete()
      ],
    );
  }

// done check
  _doneCheck() {
    return GestureDetector(
      onTap: Donetap,
      child: AnimatedContainer(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: donecolor,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20)),
          duration: _duration(),
          child: done),
    );
  }

// title
  _title() {
    return Container(width: Get.width * 0.5, child: TextTitle1(title: title));
  }

// delete button
  _delete() {
    return IconButton(onPressed: deleteTab, icon: Icon(Icons.delete));
  }

  // Duration
  _duration() {
    return Duration(milliseconds: 1200);
  }
}

// back button
class ButtonTheme1 extends StatelessWidget {
  var tap;

  ButtonTheme1({
    Key? key,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black),
        color: Colors.white.withOpacity(0.3),
      ),
      child: GestureDetector(onTap: tap, child: Icon(Icons.arrow_back_ios_new)),
    );
  }
}

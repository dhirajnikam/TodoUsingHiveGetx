import 'package:flutter/material.dart';

// title Text Style
class TextTitle extends StatelessWidget {
  String title;

  TextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
    );
  }
}

// Desc Text Style
class TextTitle1 extends StatelessWidget {
  String title;

  TextTitle1({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
}

// class Text1 extends StatelessWidget {
//   var text;

//   Text1({
//     Key? key,
//     required this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       overflow: TextOverflow.ellipsis,
//       strutStyle: StrutStyle(fontSize: 20,),
//       text: TextSpan(
//           style: TextStyle(color: Colors.black), text: text),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FunctionContainer extends StatefulWidget {
  final double? width;
  final double height;
  final Color? color1;
  final Color? color2;
  final String? title;
  final Color? textcolor;
  final  String? subtitle;
  final Color? subticolor;
  final EdgeInsetsGeometry? padding;

  const FunctionContainer(
      {super.key,
      this.width,
       this.height = 120,
      this.color1,
      this.color2,
      this.title = "Tittle",
      this.textcolor,
      this.subtitle=  "Subtitle",
      this.subticolor,
      this.padding,});

  @override
  State<FunctionContainer> createState() => _FunctionContainerState();
}

class _FunctionContainerState extends State<FunctionContainer> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

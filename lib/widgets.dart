import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  const ResultDisplay({@required this.text, this.result, Key key})
      : super(key: key);

  final int result;
  final String text;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: h/4,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400],
                blurRadius: 20.0,
                offset: Offset(4, 4)),
            BoxShadow(
                color: Colors.white, blurRadius: 30.0, offset: Offset(4, 4)),
          ]),
      child: Container(
        padding: EdgeInsets.only(right: 24, bottom: h/7-80),
        alignment: Alignment.bottomRight,
        child: Text(
          text,
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 50, color: Colors.grey[700]),
        ),
      ),
    );
  }
}

class CalcBtn extends StatelessWidget {
  const CalcBtn(
      {@required this.label,
      @required this.onTap,
      @required this.height,
      @required this.width,
      this.backgroundColor = Colors.white,
      this.labelColor = Colors.grey,
      this.fontWeight,
      Key key})
      : super(key: key);

  final String label;
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color labelColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 20.0,
                    offset: Offset(4, 4)),
                BoxShadow(
                    color: Colors.white,
                    blurRadius: 30.0,
                    offset: Offset(4, 4)),
              ],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: backgroundColor),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
            onTap: onTap,
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                    color: labelColor, fontSize: 24, fontWeight: fontWeight),
              ),
            ),
          )),
    );
  }
}

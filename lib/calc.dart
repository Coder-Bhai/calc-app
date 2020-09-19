import 'package:calc_app/widgets.dart';
import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  Calculation({Key key}) : super(key: key);

  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  int firstOperand;
  String opr;
  int secondOperand;
  int result;

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child:ListView(
            children: [
              ResultDisplay(text: _getDisplayText()),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  CalcBtn(
                      label: '7',
                      onTap: () => numberPressed(7),
                      width: w / 6,
                      height: w / 6),
                  CalcBtn(
                      label: '8',
                      onTap: () => numberPressed(8),
                      width: w / 6,
                      height: w / 6),
                  CalcBtn(
                      label: '9',
                      onTap: () => numberPressed(9),
                      width: w / 6,
                      height: w / 6),
                  SizedBox(
                    width: 20.0,
                  ),
                  CalcBtn(
                    label: 'X',
                    onTap: () => operatorPressed('*'),
                    width: w / 6 + 10,
                    height: w / 6 + 10,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  CalcBtn(
                      label: '4',
                      onTap: () => numberPressed(4),
                      width: w / 6,
                      height: w / 6),
                  CalcBtn(
                      label: '5',
                      onTap: () => numberPressed(5),
                      width: w / 6,
                      height: w / 6),
                  CalcBtn(
                      label: '6',
                      onTap: () => numberPressed(6),
                      width: w / 6,
                      height: w / 6),
                  SizedBox(
                    width: 20.0,
                  ),
                  CalcBtn(
                    label: '/',
                    onTap: () => operatorPressed('/'),
                    width: w / 6 + 10,
                    height: w / 6 + 10,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  CalcBtn(
                      label: '1',
                      onTap: () => numberPressed(1),
                      width: w / 6,
                      height: w / 6),
                  CalcBtn(
                      label: '2',
                      onTap: () => numberPressed(2),
                      width: w / 6,
                      height: w / 6),
                  CalcBtn(
                      label: '3',
                      onTap: () => numberPressed(3),
                      width: w / 6,
                      height: w / 6),
                  SizedBox(
                    width: 20.0,
                  ),
                  CalcBtn(
                    label: '+',
                    onTap: () => operatorPressed('+'),
                    width: w / 6 + 10,
                    height: w / 6 + 10,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  CalcBtn(
                    label: '=',
                    onTap: () => calculateResult(),
                    width: w / 6,
                    height: w / 6,
                    fontWeight: FontWeight.w700,
                  ),
                  CalcBtn(
                    label: '0',
                    onTap: () => numberPressed(0),
                    width: w / 3 + 15,
                    height: w / 6,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CalcBtn(
                    label: '-',
                    onTap: () => operatorPressed('-'),
                    width: w / 6 + 10,
                    height: w / 6,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
              CalcBtn(
                label: 'C',
                onTap: () => clear(),
                width: w - 80,
                height: w / 6,
                fontWeight: FontWeight.w700,
              )
            ],
          ),
    );
  }

  numberPressed(int number) {
    setState(() {
      if (result != null) {
        result = null;
        firstOperand = number;
        return;
      }

      if (firstOperand == null) {
        firstOperand = number;
        return;
      }
      if (opr == null) {
        firstOperand = int.parse('$firstOperand$number');
        return;
      }
      if (secondOperand == null) {
        secondOperand = number;
        return;
      }

      secondOperand = int.parse('$secondOperand$number');
    });
  }

  operatorPressed(String opr) {
    setState(() {
      if (firstOperand == null) {
        firstOperand = 0;
      }
      this.opr = opr;
    });
  }

  calculateResult() {
    if (opr == null || secondOperand == null) {
      return;
    }
    setState(() {
      switch (opr) {
        case '+':
          result = firstOperand + secondOperand;
          break;
        case '-':
          result = firstOperand - secondOperand;
          break;
        case '*':
          result = firstOperand * secondOperand;
          break;
        case '/':
          if (secondOperand == 0) {
            return;
          }
          result = firstOperand ~/ secondOperand;
          break;
      }

      firstOperand = result;
      opr = null;
      secondOperand = null;
      result = null;
    });
  }

  clear() {
    setState(() {
      firstOperand = null;
      secondOperand = null;
      opr = null;
      result = null;
    });
  }

  String _getDisplayText() {
    if (result != null) {
      return '$result';
    }
    if (secondOperand != null) {
      return '$firstOperand$opr$secondOperand';
    }

    if (opr != null) {
      return '$firstOperand$opr';
    }

    if (firstOperand != null) {
      return '$firstOperand';
    }

    return '0';
  }
}

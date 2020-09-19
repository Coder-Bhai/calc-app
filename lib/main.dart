import 'package:flutter/material.dart';
import 'dart:async';
import 'calc.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Simple Calculator',
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/Calculation': (BuildContext context) =>
          Scaffold(body: new Calculation())
    },
  ));
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Calculation');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image(
            image: AssetImage('assets/calc.jpg'),
            height: 100.0,
            width: 100.0,
          ),
          SizedBox(height: 30.0,),
          Text('Calculator', style: TextStyle(color: Colors.grey),),
          SizedBox(height: 30.0,),
          CircularProgressIndicator()
        ]),
      ),
    );
  }
}

// class CalcApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Simple Calculator',
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Calculation()
//       ),
//     );
//   }
// }

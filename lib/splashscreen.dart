import 'package:flutter/material.dart';
import 'loginpage.dart';

void main() => runApp(SplashScreen());

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logon.png',
                width: 220,
                height: 220,
              ),
              SizedBox(
                height: 20,
              ),
              new ProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
} 

class ProgressIndicator extends StatefulWidget {
  @override
  _ProgressIndicatorState createState() => _ProgressIndicatorState();
} 

class _ProgressIndicatorState extends State<ProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
        animation = Tween(begin: 0.0, end: 1.0).animate(controller) 
        ..addListener(() {
          setState(() {
            if (animation.value > 0.99){
              //Nagivation to new page is here 
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()
                )
              );
            }
          });
        });
        controller.repeat();
  }
  
  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
          width: 200,
          color: Colors.redAccent,
          child: LinearProgressIndicator(
            value: animation.value,
            backgroundColor: Colors.black,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
    ));
  }
}

Map<int, Color> color = {
  50: Color.fromRGBO(159, 30, 99, .1),
  100: Color.fromRGBO(159, 30, 99, .2),
  200: Color.fromRGBO(159, 30, 99, .3),
  300: Color.fromRGBO(159, 30, 99, .4),
  400: Color.fromRGBO(159, 30, 99, .5),
  500: Color.fromRGBO(159, 30, 99, .6),
  600: Color.fromRGBO(159, 30, 99, .7),
  700: Color.fromRGBO(159, 30, 99, .8),
  800: Color.fromRGBO(159, 30, 99, .9),
  900: Color.fromRGBO(159, 30, 99, 1),
};
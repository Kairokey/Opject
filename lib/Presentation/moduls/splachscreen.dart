import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import '../../costants/imagePathes.dart';
class SplashScreen extends StatelessWidget {
  final Widget? nextScreen;
  const SplashScreen({Key? key,this.nextScreen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var wScreen=MediaQuery.of(context).size.width;
    var hScreen=MediaQuery.of(context).size.height;
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: Colors.green,
        duration:3000,
        nextScreen:nextScreen!,
        splash: LayoutBuilder(
          builder: (context, cons) =>
              Center(
                child: Container(
          child: Image.asset(logoPath),
                  width: wScreen,
                  height: hScreen,

          ),
              )
        ),
      ),
    );
  }
}

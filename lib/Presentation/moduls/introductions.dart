
import 'package:flutter/material.dart';
import 'package:myopject/Presentation/moduls/SignIn.dart';
import 'package:myopject/costants/Screen.dart';
import 'package:myopject/costants/imagePathes.dart';
import 'package:myopject/data/CacheHelper.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
List  Images=[
   "assets/images/88-882410_food-dish-png.png",
   "assets/images/istockphoto-585093266-612x612.jpg",
   "assets/images/R.jpg"
];
class Introduction extends StatelessWidget {
      Introduction({Key? key}) : super(key: key);

  var controller = PageController(viewportFraction: 0.8, keepPage: true);
  List pages = List.generate(
      3,
          (index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Container(
          height: 280,
          child: Center(
              child: Image.asset(Images[index],fit: BoxFit.cover,),
          ),
        ),
      ));
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  InkWell(
                      onTap:()
                   {
                     controller.jumpToPage(2);
                     },
                      child: Text("Skip",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),)),
                  Spacer(),
                  Text("عربي",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),)
                ],
              ),
            ),
            SizedBox(
              height: 240,
              child: PageView.builder(
                controller: controller,
                // itemCount: pages.length,
                itemBuilder: (_, index) {
                  return pages[index % pages.length];
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: ExpandingDotsEffect(
                dotHeight: 16,
                dotWidth: 16,
                activeDotColor: Colors.green

              ),
            ),
            Container(
              height: 120,
              width:350,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Welcome Back !",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                    ),
                SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Center(child: Text("Stay signed in with your account to make searching easier",style: TextStyle(fontSize: 13.sp),))),
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: InkWell(
                onTap: (){
                  CacheHelper.putBool("onBoarding", true);
                  Navigator.pushNamed(context, SignInPath);
                },
                child: Container(
                  color: Colors.green,
                  height: 80,
                  width: 90,
                  child:
                  SvgPicture.asset(arrowIcon)
                  ,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

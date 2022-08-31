import 'package:flutter/material.dart';
import 'package:instagram/login.dart';
import 'package:instagram/screens/activity_screen.dart';
import 'package:instagram/screens/add_content.dart';
import 'package:instagram/screens/home_screens.dart';
import 'package:instagram/screens/main_screen.dart';
import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/user_profile_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
            headline4: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: TextStyle(
                fontFamily: 'GB', fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(
              duration: 3,
              goToPage: MainScreen(),
            ),
        // '/': (context) => SplashFuturePage(),
        '/home': (context) => MainScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashScreen({required this.duration, required this.goToPage});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        repeat: ImageRepeat.repeat,
        image: AssetImage('images/pattern.png'),
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  child: Image(image: AssetImage('images/Startlogo.png')),
                ),
              ),
              Positioned(
                bottom: 32,
                child: Column(
                  children: [
                    Text(
                      "From",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      "Karami Company",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

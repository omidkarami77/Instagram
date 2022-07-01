import 'package:flutter/material.dart';
import 'package:instagram/screens/switch_account_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SwitchAccountScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
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
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Card(
                    elevation: 10,
                    color: Colors.transparent,
                    child: Container(
                      width: 155,
                      height: 77,
                      alignment: Alignment.center,
                      child: Image(image: AssetImage('images/Startlogo.png')),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    children: [
                      Text(
                        'From',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      Text(
                        'Karami Company',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}

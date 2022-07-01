import 'dart:ui';

import 'package:flutter/material.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Column(children: [
        Expanded(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/switch_account_background.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 200,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    width: 340,
                    height: 352,
                    child: Column(children: [
                      SizedBox(
                        height: 32,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image(
                            width: 129,
                            height: 129,
                            image: AssetImage("images/omid.jpeg"),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text("omid karami",
                          style: Theme.of(context).textTheme.headline4),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 46,
                        width: 129,
                        child: ElevatedButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed: () {},
                          child: Text("Confirm"),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text("switch account",
                          style: Theme.of(context).textTheme.headline4),
                    ]),
                  ),
                ),
              ),
            )
          ],
        )),
        Padding(
          padding: EdgeInsets.only(bottom: 63, top: 132),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "don't have an account ? / ",
                style: TextStyle(
                    fontFamily: "GB", color: Colors.grey[700], fontSize: 16),
              ),
              Text(
                "Sign up",
                style: TextStyle(
                    fontFamily: "GB", color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

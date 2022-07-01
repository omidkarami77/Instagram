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
                  filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
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
                      Text(
                        "omid karami",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: Color(0xffF35383)),
                        onPressed: () {},
                        child: Text("Confirm"),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "switch account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                ),
              ),
            )
          ],
        )),
        Padding(
          padding: EdgeInsets.only(bottom: 63, top: 132),
          child: Text(
            "don't have an account ? / ",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]),
    );
  }
}

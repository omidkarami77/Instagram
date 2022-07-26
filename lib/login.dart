import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();

  @override
  void initState() {
    focusEmail.addListener(() {
      setState(() {});
    });
    focusPassword.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xff323A99),
            Color(0xffF98BFC),
          ])),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // The containers in the background
            imageContainers(),
            getContainerBox(),
          ],
        ),
      ),
    );
  }

  Widget getContainerBox() {
    return Column(
      children: [
        Expanded(child: Container()),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff1C1F2E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in to ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Image(
                        image: AssetImage('images/mod.png'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 44, left: 44),
                    child: TextField(
                      focusNode: focusEmail,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        labelText: "Email",
                        labelStyle: TextStyle(
                            fontFamily: 'GM',
                            fontSize: 20,
                            color: focusEmail.hasFocus
                                ? Colors.pink
                                : Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(color: Color(0xffC5C5C5), width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: Color(0xffF35383),
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 44, left: 44),
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      focusNode: focusPassword,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        labelText: "Password",
                        labelStyle: TextStyle(
                            fontFamily: 'GM',
                            fontSize: 20,
                            color: focusPassword.hasFocus
                                ? Colors.pink
                                : Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(color: Color(0xffC5C5C5), width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: Color(0xffF35383),
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: 129,
                    height: 46,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 16, fontFamily: "GB"),
                        ),
                        style: Theme.of(context).elevatedButtonTheme.style),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't have an account ? / ",
                          style: TextStyle(
                              fontFamily: "GB",
                              color: Colors.grey[700],
                              fontSize: 16),
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                              fontFamily: "GB",
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }

  Widget imageContainers() {
    return Positioned(
      top: 80,
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Image(
                image: AssetImage('images/rock.png'),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    focusEmail.dispose();
    focusPassword.dispose();
    super.dispose();
  }
}

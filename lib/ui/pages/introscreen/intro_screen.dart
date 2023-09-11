import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahil_ps_demo/ui/pages/login/signup_page.dart';

class IntroScreen extends StatefulWidget {
  int selectedPage = 0;

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
//class IntroScreen extends State<MyApp> {


  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients)
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    // for portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);



    var headingStyle = TextStyle(
      color: Color(0xffae94d9),
      fontSize: 21.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'gotham_medium',
    );
    var descStyle = TextStyle(
        color: Color(0xFF8E8E8E),
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'gotham_book');
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(alignment: Alignment.center, children: <Widget>[
          PageView(
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      color: Colors.white,
                      child: Center(
                        child: Image.asset(
                          'assets/images/youth.png',
                          height: 250,
                          width: 250,
                        ),
                      )),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          margin: EdgeInsets.only(top: 35, left: 20, right: 20),
                          child: new Text(
                            'Connect with Employees',
                            style: headingStyle,
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: EdgeInsets.only(top: 12, left: 20, right: 20),
                      child: new Text(
                        'Reach out to issues of the employee eaily .',
                        style: descStyle,
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
//                                    margin: EdgeInsets.only(left: 5, right: 5),
                      height: MediaQuery.of(context).size.height * 0.35,
                      color: Colors.white,
                      child: Center(
                        child: Image.asset(
                          'assets/images/youth.png',
                          height: 250,
                          width: 250,
                        ),
                      )),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          margin: EdgeInsets.only(top: 35, left: 20, right: 20),
//                    height: MediaQuery.of(this.context).size.height /2.5,
                          child: new Text(
                            'Your Place, Your Work',
                            textAlign: TextAlign.center,
                            style: headingStyle,
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: EdgeInsets.only(top: 12, left: 20, right: 20),
                      child: new Text(
                        'Manage your office employee form remote location ',
                        textAlign: TextAlign.center,
                        style: descStyle,
                      )),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      color: Colors.white,
                      child: Center(
                          child: Image.asset(
                            'assets/images/youth.png',
                            height: 250,
                            width: 250,
                          ))),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          margin: EdgeInsets.only(top: 35, left: 20, right: 20),
//                    height: MediaQuery.of(this.context).size.height /2.5,
                          child: Text(
                            'All Management under one roof ',
                            textAlign: TextAlign.center,
                            style: headingStyle,
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: EdgeInsets.only(top: 12, left: 20, right: 20),
                      child: new Text(
                        'Get all the employee data at one point',
                        style: descStyle,
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ],
            onPageChanged: (value) {
              print("$value values");
              setState(() {
                widget.selectedPage = value;
              });
            },
          ),
          Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.48,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 5, left: 5),
                    width: 34,
                    height: 3,
                    decoration: BoxDecoration(
                        color: widget.selectedPage == 0
                            ? Color(0xffae94d9)
                            : Color(0xffE6E6E6),
                        borderRadius:
                        new BorderRadius.all(Radius.circular(2.0))),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5, left: 5),
                    width: 34,
                    height: 3,
                    decoration: BoxDecoration(
                        color: widget.selectedPage == 1
                            ? Color(0xffae94d9)
                            : Color(0xffE6E6E6),
                        borderRadius:
                        new BorderRadius.all(Radius.circular(2.0))),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5, left: 5),
                    width: 34,
                    height: 3,
                    decoration: BoxDecoration(
                        color: widget.selectedPage == 2
                            ? Color(0xffae94d9)
                            : Color(0xffE6E6E6),
                        borderRadius:
                        new BorderRadius.all(Radius.circular(2.0))),
                  ),
                ],
              )),
          Column(
            children: <Widget>[
              Spacer(),
              Container(
                margin: EdgeInsets.only(
                  bottom: 50,
                ),
                // height: 55,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Colors.amber),
                      overlayColor: MaterialStatePropertyAll(Colors.amber),
                      textStyle: MaterialStatePropertyAll(TextStyle(
                        color: Colors.white,
                      )),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30),
                          side: BorderSide(color: Colors.amber))),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 5.0),
                      child: new Text(
                        "Get Started !",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "gotham_book",
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      print("this pressed");
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

//class IntroScreen extends StatefulWidget {
//  @override
//  _IntroScreenState createState() => _IntroScreenState();
//}
//
//class _IntroScreenState extends State<IntroScreen> {

class PageViewCustom extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    var currentPageValue = 0.0;

    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });

    // TODO: implement build
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, position) {
        if (position == currentPageValue.floor()) {
          return Transform(
            transform: Matrix4.identity()..rotateX(currentPageValue - position),
            child: Container(
              color: position % 2 == 0 ? Colors.blue : Colors.pink,
              child: Center(
                child: Text(
                  "Page",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
            ),
          );
        } else if (position == currentPageValue.floor() + 1) {
          return Transform(
            transform: Matrix4.identity()..rotateX(currentPageValue - position),
            child: Container(
              color: position % 2 == 0 ? Colors.blue : Colors.pink,
              child: Center(
                child: Text(
                  "Page",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
            ),
          );
        } else {
          return Container(
            color: position % 2 == 0 ? Colors.blue : Colors.pink,
            child: Center(
              child: Text(
                "Page",
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ),
          );
        }
      },
      itemCount: 10,
    );
  }
}

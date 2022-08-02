import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram/screens/share_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var it;
    List<String> imgList = [
      'images/1.png',
      'images/1.png',
      'images/1.png',
      'images/1.png',
      'images/1.png',
      'images/1.png',
      'images/1.png',
      'images/1.png',
      'images/1.png',
      'images/1.png',
    ];
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff1C1F2E),
          title: Container(
              width: 128,
              height: 124,
              child: Image.asset('images/moodinger_logo.png')),
          actions: [
            Container(
              height: 24,
              width: 24,
              margin: EdgeInsets.only(right: 18),
              child: Image.asset('images/icon_direct.png'),
            )
          ],
        ),
        backgroundColor: Color(0xff1C1F2E),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ElevatedButton(
                  child: Text("open bottom sheet"),
                  onPressed: () {
                    showModalBottomSheet(
                        barrierColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return DraggableScrollableSheet(
                              initialChildSize: 0.4,
                              minChildSize: 0.2,
                              maxChildSize: 0.7,
                              builder: (context, controller) {
                                return ShareBottomSheet(
                                  controller: controller,
                                );
                              });
                        });
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: getListStory(),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: imgList.length,
                (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 34,
                      ),
                      getHeaderPost(),
                      SizedBox(
                        height: 24,
                      ),
                      getPostContent(imgList[index]),
                    ],
                  );
                },
              ))
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 63,
          width: 428,
          decoration: BoxDecoration(
            color: Color(0xff272B40),
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15)),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Image.asset("images/icon_home.png"),
            Image.asset("images/icon_search.png"),
            Image.asset("images/icon_add.png"),
            Image.asset("images/heart.png"),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 35,
                width: 35,
                color: Colors.amber,
                child: Image.asset('images/omid.jpeg'),
              ),
            ),
          ]),
        ));
  }

  Widget getListStory() {
    return Container(
      height: 120,
      child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return index == 0 ? getAddStoryBox() : getStoryListBox();
          }),
    );
  }

  Widget getPostList(List imgList) {
    return ListView.builder(
      itemCount: imgList.length,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            SizedBox(
              height: 34,
            ),
            getHeaderPost(),
            SizedBox(
              height: 24,
            ),
            getPostContent(imgList[index]),
          ],
        );
      }),
    );
  }

  Widget getPostContent(var img) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 440,
        width: 394,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(
              top: 0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(37),
                  child: Image.asset(img)),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: Image.asset('images/icon_video.png'),
            ),
            Positioned(
              bottom: 15,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: Container(
                    height: 46,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.5),
                          Color.fromRGBO(255, 255, 255, 0.2),
                        ],
                      ),
                    ),
                    child: Row(children: [
                      SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          Image.asset('images/icon_hart.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '2.5k',
                            style: TextStyle(
                                fontFamily: "GB",
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 42,
                      ),
                      Row(
                        children: [
                          Image.asset('images/icon_comments.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '2.5k',
                            style: TextStyle(
                                fontFamily: "GB",
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Image.asset('images/icon_share.png'),
                      SizedBox(
                        width: 54,
                      ),
                      Image.asset('images/icon_save.png'),
                    ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getHeaderPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          getStoryBox(),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'omid karami',
                  style: TextStyle(
                      fontFamily: "GB", color: Colors.white, fontSize: 12),
                ),
                Text(
                  'ّبرنامه نویس موبایل',
                  style: TextStyle(color: Colors.white, fontFamily: "SM"),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset(
            'images/icon_menu.png',
          ),
        ],
      ),
    );
  }

  Widget getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      color: Color(0xffF35383),
      strokeWidth: 2,
      dashPattern: [40, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 38,
          width: 38,
          color: Colors.amber,
          child: Image.asset('images/omid.jpeg'),
        ),
      ),
    );
  }

  Widget getStoryListBox() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(17),
              padding: EdgeInsets.all(4),
              color: Color(0xffF35383),
              strokeWidth: 2,
              dashPattern: [40, 10],
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 58,
                  width: 58,
                  color: Colors.amber,
                  child: Image.asset('images/omid.jpeg'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "omid",
              style: TextStyle(color: Colors.white),
            )
          ],
        ));
  }

  Widget getAddStoryBox() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
              width: 64,
              height: 64,
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xff1C1F2E),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset('images/icon_plus.png'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "add story",
              style: TextStyle(color: Colors.white),
            )
          ],
        ));
  }
}

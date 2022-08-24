import 'package:flutter/material.dart';
import 'package:instagram/model/enums/activity_type_enu.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 70,
            child: TabBar(
                labelStyle: TextStyle(fontSize: 20, fontFamily: "GB"),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                indicatorWeight: 4,
                indicatorColor: Color(0xffF35383),
                controller: tabController,
                tabs: [
                  Tab(
                    text: "You",
                  ),
                  Tab(
                    text: "Following",
                  ),
                ]),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [getSampleList(), getSampleList()],
            ),
          ),
        ],
      )),
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
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
      ),
    );
  }

  Widget getSampleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              "New",
              style: TextStyle(
                  fontSize: 16, fontFamily: "GB", color: Colors.white),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return getRow(ActivityStatus.likes);
          }, childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              "Today",
              style: TextStyle(
                  fontSize: 16, fontFamily: "GB", color: Colors.white),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return getRow(ActivityStatus.followBack);
          }, childCount: 3),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              "This Week",
              style: TextStyle(
                  fontSize: 16, fontFamily: "GB", color: Colors.white),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return getRow(ActivityStatus.following);
          }, childCount: 2),
        ),
      ],
    );
  }

  Widget getRow(ActivityStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration:
                BoxDecoration(color: Color(0xffF35383), shape: BoxShape.circle),
          ),
          SizedBox(
            width: 7,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: FittedBox(
                child: Image.asset('images/item8.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "omid karami",
                    style: TextStyle(
                        fontFamily: "GB", fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "started following",
                    style: TextStyle(
                        fontFamily: "GM",
                        fontSize: 12,
                        color: Color(0xffC5C5C5)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "you",
                    style: TextStyle(
                        fontFamily: "GB", fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "3min",
                    style: TextStyle(
                        fontFamily: "GM",
                        fontSize: 12,
                        color: Color(0xffC5C5C5)),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          _getActionActivityRow(status),
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus activityStatus) {
    switch (activityStatus) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: TextStyle(
                fontFamily: 'GB', fontSize: 16, fontWeight: FontWeight.w700),
          ),
          onPressed: () {},
          child: Text("Follow"),
        );
      case ActivityStatus.likes:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: FittedBox(
              child: Image.asset('images/item1.png'),
              fit: BoxFit.cover,
            ),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'message',
            style: TextStyle(
                fontFamily: 'GB', fontSize: 12, color: Color(0xffC5C5C5)),
          ),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color(0xffC5C5C5), width: 2)),
        );
      default:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'message',
            style: TextStyle(
                fontFamily: 'GB', fontSize: 12, color: Color(0xffC5C5C5)),
          ),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color(0xffC5C5C5), width: 2)),
        );
    }
  }
}

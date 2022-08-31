import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1C1F2E),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  toolbarHeight: 80,
                  actions: [
                    Padding(
                        padding: EdgeInsets.only(right: 18, top: 18),
                        child: Icon(Icons.menu))
                  ],
                  bottom: PreferredSize(
                    child: Container(
                      height: 14,
                      decoration: BoxDecoration(
                        color: Color(0xff1C1F2E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                    ),
                    preferredSize: Size.fromHeight(10),
                  ),
                  backgroundColor: Colors.transparent,
                  expandedHeight: 170,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "images/sliver_appbar.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: getHeaderProfile(),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: 195,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 18, right: 18, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "برنامه نویس فلاتر و اندروید",
                            style: TextStyle(
                                color: Colors.white, fontFamily: "SM"),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "در فناوری اطلاعات رجا و شرکت داتین",
                            style: TextStyle(
                                color: Colors.white, fontFamily: "SM"),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Image.asset("images/icon_link.png"),
                              ),
                              TextButton(
                                  onPressed: () {
                                    _launchUrl();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "zil.ink/_omidkaramiii",
                                      style: TextStyle(
                                          color: Color(
                                            0xff55B9F7,
                                          ),
                                          fontFamily: "GB",
                                          fontSize: 15),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                    floating: true,
                    pinned: true,
                    delegate: TabBarViewDelegate(TabBar(
                      indicatorPadding: EdgeInsets.only(bottom: 4),
                      indicatorWeight: 2,
                      indicatorColor: Color(0xffF35383),
                      tabs: [
                        Tab(
                          icon: Image.asset("images/icon_post.png"),
                        ),
                        Tab(
                          icon: Image.asset("images/save_icon.png"),
                        ),
                      ],
                    )))
              ];
            }),
            body: TabBarView(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(top: 20),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: FittedBox(
                                    fit: BoxFit.cover,
                                    child:
                                        Image.asset("images/item$index.png")),
                              ),
                            );
                          },
                          childCount: 10,
                        ),
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: [
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(top: 20, left: 18, right: 18),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: FittedBox(
                                    fit: BoxFit.cover,
                                    child:
                                        Image.asset("images/item$index.png")),
                              ),
                            );
                          },
                          childCount: 10,
                        ),
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: [
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget getHeaderProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Color(0xffF35383),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(17),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset("images/omid.jpeg"),
                  )),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 70,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "امید کرمی برنامه نویس موبایل",
                    style: TextStyle(
                        color: Colors.white, fontFamily: "SM", fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "omidkarami",
                    style: TextStyle(
                        color: Color(0xffC5C5C5),
                        fontFamily: "GB",
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset('images/icon_medad.png'),
        ],
      ),
    );
  }

  final Uri _url = Uri.parse('https://zil.ink/_omidkaramiii');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  TabBarViewDelegate(this._tabBar);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      color: Color(0xff1C1F2E),
      child: _tabBar,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}

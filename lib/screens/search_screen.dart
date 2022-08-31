import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: getContent(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset("images/item$index.png")),
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
                  QuiltedGridTile(2, 1),
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1)
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget getContent() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
          child: Container(
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xff272B40),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Image.asset('images/icon_search_not_active.png')),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Image.asset('images/iconsea.png')),
                ],
              ),
            ),
          ),
        ),
        getListText(),
      ],
    );
  }

  Widget getListText() {
    List<String> kalameh = [
      'all',
      'account',
      'hashtag',
      'caption',
      'story',
      'comment',
      'lifestyle',
      'gym',
      'wwe',
    ];
    return Container(
      height: 23,
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      child: ListView.builder(
          itemCount: kalameh.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xff272B40),
              ),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Text(
                  "${kalameh[index]}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'GM',
                  ),
                ),
              )),
            );
          }),
    );
  }
}

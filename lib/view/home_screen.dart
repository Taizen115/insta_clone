import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/view/activities/pages/activities_page.dart';
import 'package:insta_clone/view/feed/pages/feed_page.dart';
import 'package:insta_clone/view/post/pages/post_page.dart';
import 'package:insta_clone/view/profiles/pages/profiles_page.dart';
import 'package:insta_clone/view/search/pages/search_page.dart';
import '../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _pages = [];
  int _currentIndex = 0;


  @override
  void initState() {
    _pages = [
      FeedPage(),
      SearchPage(),
      PostPage(),
      ActivitiesPage(),
      ProfilesPage(),
    ];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
          label: S.of(context).home),

          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
              label: S.of(context).search),

          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.squarePlus),
              label: S.of(context).add),

          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart),
              label: S.of(context).activities),

          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user),
              label: S.of(context).user),


        ],

      ),
    );
  }
}

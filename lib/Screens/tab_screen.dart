import 'package:flutter/material.dart';
import 'package:l0rem/widget/allpost.dart';
import 'package:l0rem/widget/profile.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = './tabsScreen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // drawer: const Drawer(), //can be use later
        appBar: AppBar(
          leading: const Padding(
              padding: EdgeInsets.only(right: 10), child: Icon(Icons.menu)),
          title: const Text('Lorem Ipsum'),
          actions: const [
            Padding(
                padding: EdgeInsets.only(right: 10), child: Icon(Icons.search))
          ],
          bottom: const TabBar(tabs: [
            Tab(
              text: 'All POSTS',
            ),
            Tab(
              text: 'PROFILE',
            )
          ]),
        ),
        body: TabBarView(children: [
          AllPost(),
          const Profile(),
        ]),
      ),
    );
  }
}

import 'package:devfest_18_kolkata/home_screen/hiding_app_bar.dart';
import 'package:devfest_18_kolkata/screens/invitiation_detail_screen/invitation_detail_screen.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers_details_screen.dart';
import 'package:devfest_18_kolkata/screens/quick_links_screen/quick_links_screen.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_detail_screen.dart';
import 'package:devfest_18_kolkata/screens/speakers_screen/speakers_screen.dart';
import 'package:devfest_18_kolkata/screens/testimonial_screen/chit_chat_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        TabBarView(
          controller: _tabController,
          children: <Widget>[
            SessionDetailScreen(),
            InvitationDetailScreen(),
            QuickLinksScreen(),
            ChitChatScreen(),
            SpeakersScreen(),
            OrganisersDetailsScreen(),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: HidingAppBar(
            tabController: _tabController,
          ),
        ),
      ],
    );
  }
}

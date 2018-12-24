import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HidingAppBar extends StatefulWidget {
  final TabController tabController;

  const HidingAppBar({Key key, this.tabController}) : super(key: key);

  @override
  _HidingAppBarState createState() => _HidingAppBarState();
}

class _HidingAppBarState extends State<HidingAppBar>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<Offset> position;
  Timer hideTimer;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    position = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, 1.0))
        .animate(CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOut,
            reverseCurve: Curves.bounceIn));
    widget.tabController.addListener(() {
      if (hideTimer.isActive) hideTimer.cancel();
      animationController.reverse();
      hideTimer = Timer(
          Duration(milliseconds: 2000), () => animationController.forward());
    });
    hideTimer =
        Timer(Duration(seconds: 3), () => animationController.forward());
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color iconColor = Theme.of(context).hintColor;
    return SlideTransition(
      position: position,
      child: Material(
        child: TabBar(
          indicatorColor: Theme.of(context).highlightColor,
          indicatorWeight: 5.0,
          controller: widget.tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                MdiIcons.theater,
                color: iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                MdiIcons.script,
                color: iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                MdiIcons.linkVariant,
                color: iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                MdiIcons.commentPlusOutline,
                color: iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                MdiIcons.starFace,
                color: iconColor,
              ),
            ),
            Tab(
              icon: Icon(
                MdiIcons.google,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

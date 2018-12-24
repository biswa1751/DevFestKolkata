
import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/helper/widgets/colorful_bottom_border_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeftDisplayCard extends StatefulWidget {
  final Session session;
  final int index;

  const LeftDisplayCard({Key key, this.session, this.index}) : super(key: key);

  @override
  _LeftDisplayCardState createState() => _LeftDisplayCardState();
}

class _LeftDisplayCardState extends State<LeftDisplayCard>
    with TickerProviderStateMixin {
  Session get _session => widget.session;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('hh:mm a');

    DateTime _fromTime =_session.fromTime;
    DateTime _toTime = _session.toTime;

    double width = MediaQuery.of(context).size.width / 1.6;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: AnimatedContainer(
        width: width,
        height: 60.0,
        duration: Duration(milliseconds: 300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
                child: Column(
                  children: <Widget>[
                    Text(_session.title, maxLines: 1, overflow: TextOverflow.fade,),
                    Text(
                      '${format.format(_fromTime)} - ${format.format(_toTime)}',
                    ),
                  ],
                )),
            SizedBox(height: 10.0),
            bottomBorder(width: width),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
// import 'package:kalendar/kalendar.dart';
// import 'package:table_calendar/table_calendar.dart';

class ShelfDetailPage extends StatefulWidget {
  final String title;

  ShelfDetailPage(this.title);

  @override
  _ShelfDetailPageState createState() => _ShelfDetailPageState();
}

class _ShelfDetailPageState extends State<ShelfDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // UI를 그리기 위해 Todo를 사용합니다.
    return ListView(
      children: <Widget>[
        Text('${widget.title}'),
        Text('data2'),
        Text('data3'),
        Text('data2'),
        Text('data3'),
        Text('data2'),
        Text('data3'),
        Text('data2'),
        Text('data3'),
        Text('data2'),
        Text('data3'),
        Text('data2'),
        Text('data3'),
        Text('data2'),
        Text('data3'),
        Text('data2'),
        Text('data3'),
        Text('data2'),
        Text('data3'),
        Text('data2'),
        Text('data3'),
        Text('data4'),
        Text('data5')
      ],
    );
  }
}

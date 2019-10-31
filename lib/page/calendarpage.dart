import 'package:flutter/material.dart';
// import 'package:kalendar/kalendar.dart';
import 'package:table_calendar/table_calendar.dart';

class NewPage extends StatefulWidget {
  final String title;

  NewPage(this.title);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // UI를 그리기 위해 Todo를 사용합니다.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          TableCalendar(
            calendarController: _calendarController,
            startingDayOfWeek: StartingDayOfWeek.saturday,
            // rowHeight: 100,
            builders: CalendarBuilders(
              selectedDayBuilder: (context,date,events)=>
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage('https://opgg-static.akamaized.net/images/lol/champion/Poppy.png?image=w_140&v=1'),fit: BoxFit.cover)
                ),
                child: Column(
                  children: <Widget>[
                    Text(date.day.toString(), style: TextStyle(color: Colors.white)),
                    // Image.network('https://opgg-static.akamaized.net/images/lol/champion/Poppy.png?image=w_140&v=1'),
                    // Image.network('https://opgg-static.akamaized.net/images/lol/champion/Jax.png?image=w_140&v=1'),

                  ],
                ),
              ),
              
            ),
          ),
          Text('data1'),
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
      ),
    );
  }
}

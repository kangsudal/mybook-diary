import 'package:flutter/material.dart';
import 'package:hope_your_real_victory/page/shelfdetailpage.dart';

import 'page/calendarpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> myShelves = ['책장 모아 보기'];
  int totalShelves = 1;
  int currentShelf = 0;

  PageController _pageController = PageController(
    initialPage: 0,
  );

  void _addShelf(String newShelf) {
    setState(() {
      myShelves.add(newShelf);
      totalShelves = myShelves.length;
    });
  }

  Future<String> _asyncInputDialog(BuildContext context) async {
    String shelfName = '';
    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('책장 추가'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: '이름', hintText: 'eg. 회계, 주택관리'),
                onChanged: (value) {
                  shelfName = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(shelfName);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (BuildContext context, int position) {
          int tempBook = position*10;
          //tempBook 임시값 바꿔줘야함
          return ShelfDetailPage(
              myShelves[position], tempBook); //_pageBuilder();
        },
        itemCount: myShelves.length,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("User name"),
              accountEmail: Text("email@email.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text('책장 모아보기'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => CalendarPage("Page two")));
              },
            ),
            ListTile(
              title: Text('책장 추가'),
              onTap: () async {
                final String newShelf = await _asyncInputDialog(context);
                print("New shelf name is $newShelf");
                _addShelf(newShelf);
              },
            ),

            //MyShelves
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return listItem(index);
                },
                itemCount: myShelves.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
              ),
            ),
            
            ListTile(
              title: Text('달력'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CalendarPage("독서 캘린더")));
              },
            ),
            ListTile(
              title: Text('설정'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(int index) {
    return ListTile(
      title: Text('${myShelves[index]}'),
      onTap: () {
        // Update the state of the app
        _pageController.jumpToPage(index);
        // Then close the drawer
        Navigator.pop(context);
      },
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:kalendar/kalendar.dart';
// import 'package:table_calendar/table_calendar.dart';

class ShelfDetailPage extends StatefulWidget {
  final String bookShelfName;
  final int books;

  ShelfDetailPage(this.bookShelfName,this.books);

  @override
  _ShelfDetailPageState createState() => _ShelfDetailPageState();
}

class _ShelfDetailPageState extends State<ShelfDetailPage> {
  int _bookCounter = 0;

  void _incrementCounter() {
    setState(() {
      _bookCounter++;
    });
    print(_bookCounter);
  }

  @override
  void initState() {
    super.initState();
    _bookCounter = widget.books;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // UI를 그리기 위해 Todo를 사용합니다.
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.bookShelfName}/$_bookCounter"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.edit),color: Colors.white,),
          IconButton(icon: Icon(Icons.delete_forever),color: Colors.white,)
        ],
      ),
      body: Center(
        child: 
            GridView.builder(
              shrinkWrap: true,
              itemCount: _bookCounter,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
              itemBuilder: (BuildContext context, int index) {
                return Container(padding: EdgeInsets.all(8),child: Placeholder());
              },
            )
          
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}

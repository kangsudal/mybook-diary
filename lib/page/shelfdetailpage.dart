import 'package:flutter/material.dart';
import 'package:mybook_diary/list_model.dart';
import 'package:mybook_diary/page/book_item.dart';
// import 'package:kalendar/kalendar.dart';
// import 'package:table_calendar/table_calendar.dart';

class ShelfDetailPage extends StatefulWidget {
  final String bookShelfName;
  final int books;

  ShelfDetailPage(this.bookShelfName, this.books);

  @override
  _ShelfDetailPageState createState() => _ShelfDetailPageState();
}

class _ShelfDetailPageState extends State<ShelfDetailPage> {
  int _bookCounter = 0;
  ListModel<dynamic> _list;

  void _incrementCounter() {
    setState(() {
      _bookCounter++;
    });
    print(_bookCounter);
  }

  @override
  void initState() {
    super.initState();
    _list = ListModel<dynamic>(initItems: <dynamic>["가", "나"]);
    _bookCounter = _list.length;
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
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete_forever),
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              color: Colors.deepPurple[300],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: _bookCounter,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: _buildItem,
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return BookItem(
      item: _list[index],
    );
  }
}

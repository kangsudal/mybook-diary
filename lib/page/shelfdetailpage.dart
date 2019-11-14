import 'package:flutter/material.dart';
import 'package:mybook_diary/book_model.dart';
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

enum Answer { REMOVE, EDIT }

class _ShelfDetailPageState extends State<ShelfDetailPage> {
  int _bookCounter = 0;
  ListModel<dynamic> _bookList;
  dynamic selectedItem;

  void setBookList(ListModel value) {
    setState(() {
      _bookList = value;
    });
  }

  Future<Null> _pick(int index) async {
    switch (await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("책 수정 방법을 선택해주세요."),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("수정"),
                onPressed: () {
                  Navigator.pop(context, Answer.EDIT);
                },
              ),
              SimpleDialogOption(
                child: Text("삭제"),
                onPressed: () {
                  Navigator.pop(context, Answer.REMOVE);
                },
              )
            ],
          );
        })) {
      case Answer.EDIT:
        //edit dialog
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("책 수정"),
                content: Row(
                  //TODO: 진짜 FORM만들기
                  children: <Widget>[
                    Flexible(
                        child: Image(image: AssetImage("images/book.png"))),
                    Column(
                      children: <Widget>[
                        Text("Form"),
                        Text("제목:___________"),
                        Text("저자:___________"),
                        Text("총 페이지:______"),
                        Text("책장:___________"),
                        Text("상태:___________"),
                      ],
                    )
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('취소'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text('저장하기'),
                    onPressed: () {
                      //TODO: 저장기능 붙이기
                    },
                  ),
                ],
              );
            });
        //update _bookList
        print("수정하는작업");
        break;
      case Answer.REMOVE:
        //check remove dialog
        //update _bookList
        print("삭제하는작업");
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("경고"),
                content: Text("정말 삭제하시겠습니까?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text('아니오'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text('예'),
                    onPressed: () {
                      setState(() {
                        _bookList.removeAt(index);
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
        break;
    }
  }

  void _addBook() async {
    BookModel newBook = await _asyncInputDialog(context);
    print("New book name is ${newBook.title}");
    print("newBook: ${newBook.runtimeType}");
    //dissmiss 처리
    if (newBook != null && newBook.title != '') {
      int index = selectedItem == null
          ? _bookList.length
          : _bookList.indexOf(selectedItem);
      setState(() {
        _bookList.insert(index, newBook);
      });
      print('책 개수: ${_bookList.length}');
    }
  }

  Future<BookModel> _asyncInputDialog(BuildContext context) async {
    String bookName = '';
    return showDialog<BookModel>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('책 추가'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: '이름', hintText: 'eg. 나의 아름다운 정원'),
                onChanged: (value) {
                  bookName = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context)
                    .pop(BookModel(title: bookName, author: '컨트롤즤'));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _bookList = ListModel<dynamic>(initItems: <dynamic>[
      BookModel(title: "가"),
      BookModel(title: "나"),
    ]);
    _bookCounter = _bookList.length;
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
              itemCount: _bookList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: _buildItem,
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addBook,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          print("IDX:$index 책 상세보기페이지");
        },
        onLongPress: () {
          print("IDX:$index 책 수정 방법을 선택해주세요.");
          //TODO: Dialog 띄워서 edit/ remove 선택할수있게 하기
          _pick(index);
          //객체 갖고와서 수정하기
          //삭제하기
        },
        child: BookItem(
          item: _bookList[index],
        ));
  }
}

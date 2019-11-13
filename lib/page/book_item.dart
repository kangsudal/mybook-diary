import 'package:flutter/material.dart';
import 'package:mybook_diary/book_model.dart';

class BookItem extends StatelessWidget {
  // final String bookName='book name';
  final BookModel item;

  const BookItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage("images/book.png");
    Image image = Image(
      image: assetImage,
    );
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){print("상세보기페이지");},
          onLongPress: (){print("책 수정 방법을 선택해주세요.");},
          child: Column(
            children: <Widget>[Flexible(child: image), Text(item.title)],
          ),
        ));
  }
}

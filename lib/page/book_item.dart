import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {

  // final String bookName;
  // final int bookNum;

  // const BookItem({Key key, this.bookName, this.bookNum}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage("images/book.png");
    Image image = Image(image: assetImage,);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: 
            image
        
    );
  }
}
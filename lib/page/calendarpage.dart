import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String title;

  NewPage(this.title);

  @override
  Widget build(BuildContext context) {
    // UI를 그리기 위해 Todo를 사용합니다.
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('new page'),
      ),
    );
  }
}

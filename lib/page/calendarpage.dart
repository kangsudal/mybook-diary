import 'package:flutter/material.dart';
import 'package:kalendar/kalendar.dart';

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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Kalendar(),
      ),
    );
  }
}

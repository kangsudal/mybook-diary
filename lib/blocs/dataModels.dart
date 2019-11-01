import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class Shelf{
  int id;
  String shelfName;
  dynamic books; 

  Shelf({this.id,this.shelfName,this.books});
}

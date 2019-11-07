import 'package:flutter/material.dart';

class ListModel<E>{
  final List<E> _items;

  ListModel({@required Iterable<E> initItems})
  : assert(initItems!=null),_items = List<E>.from(initItems ?? <E>[]);

  void insert(int index, E element){
    _items.insert(index, element);
  }

  E removeAt(int index){
    final removedItem = _items.removeAt(index);
    return removedItem;
  }

  int get length{
    return _items.length;
  }

  E operator [](int index) => _items[index];

  int indexOf(E element) => _items.indexOf(element);
  // ListModel
}
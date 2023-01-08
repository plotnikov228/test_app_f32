import 'package:flutter/cupertino.dart';

abstract class MainEvent {}

class SetupMainEvent extends MainEvent {
  final BuildContext context;
  final int pageIndex;

  SetupMainEvent(this.pageIndex, this.context);
}

class ChangeCategoryMainEvent extends MainEvent {
  final int id;

  ChangeCategoryMainEvent(this.id);
}



class ChangeFilterStateMainEvent extends MainEvent {
}
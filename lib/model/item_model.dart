import 'dart:ffi';

class ItemModel {
  String? name;
  String? url;

  ItemModel({this.name, this.url});
}

class ItemModelDay {
  String? day;
  String? status;

  ItemModelDay({this.day, this.status});
}

class ItemModelUser {
  String email;
  int quyen;

  ItemModelUser({required this.email, required this.quyen});
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tt3/Home/widget_appbar.dart';
import 'package:tt3/Theme/theme_color.dart';
import '../model/item_model.dart';

class ListHS extends StatefulWidget {
  const ListHS({Key? key}) : super(key: key);

  @override
  State<ListHS> createState() => _ListHSState();
}

class _ListHSState extends State<ListHS> {

  static List<ItemModel> obj = [
    ItemModel(name: 'Huy', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png'),
    ItemModel(name: 'Hai', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Trang', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Huyền', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Trâm', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Đức', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Đức', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Đức', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Đức', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Đức', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Đức', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerBar('danh sách học sinh', true),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: obj.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text('${index+1}'),
                    const SizedBox(width: 20,),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('${obj[index].url}'),
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('Học sinh ', style: TextStyle(color: ColorPalette.oragerColor),),
                            Text('${obj[index].name}')
                          ],
                        ),
                        const Text('02/02/2022', style: TextStyle(color: Colors.grey),),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        )
      ),
    );
  }
}

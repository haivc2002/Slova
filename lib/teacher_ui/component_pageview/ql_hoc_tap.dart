import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tt3/Home/widget_appbar.dart';
import 'package:tt3/Teacher_UI/bai_tap.dart';
import 'package:tt3/Teacher_UI/danh_sach_hs.dart';
import 'package:tt3/Theme/theme_color.dart';

class QLHocTap extends StatefulWidget {
  const QLHocTap({Key? key}) : super(key: key);

  @override
  State<QLHocTap> createState() => _QLHocTapState();
}

class _QLHocTapState extends State<QLHocTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroudApp,
      appBar: headerBar('Quản lý học tập', true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            component('Lớp học', lophoc()),
            component('Thông báo', thongbao()),
            component('Môn học', monhoc()),
          ],
        ),
      ),
    );
  }

  bool expande = false;

  Widget component(String text, Widget widgetcomponent) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Container(
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
        ),
        child: ExpansionTile(
          title: Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.w600
            ),
          ),
          trailing: SizedBox(
            width: 80,
            child: Row(
              children: [
                Expanded(child: Container()),
                Icon(
                  expande ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ],
            ),
          ),
          onExpansionChanged: (bool expanded) {
            setState(() {
              expande = expanded;
            });
          },
          children: [
            widgetcomponent
          ],
        ),
      ),
    );
  }

  Widget lophoc() {
    return Column(
      children: [
        ListTile(
          trailing: const Icon(Icons.arrow_forward_ios, color: ColorPalette.oragerColor, size: 15,),
          title: const Text('1. Danh sách lớp học', style: TextStyle(fontSize: 14),),
          onTap: () {
            Navigator.push(context,
              CupertinoPageRoute(builder: (context) => const ListHS())
            );
          },
        ),
        const ListTile(
          trailing: Icon(Icons.arrow_forward_ios, color: ColorPalette.oragerColor, size: 15,),
          title: Text('2. Điểm môn học', style: TextStyle(fontSize: 14),),
        ),
        itembutton('Xem điểm môn', Colors.white, Icons.file_copy, ColorPalette.oragerColor, const BaiTapScreen()),
        itembutton('Cập nhật điểm', Colors.black, Icons.file_copy, Colors.white, const BaiTapScreen()),
        const SizedBox(height: 20,)
      ],
    );
  }

  Widget thongbao() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text('Thông báo 1: ', style: TextStyle(color: ColorPalette.oragerColor),),
              Spacer(),
              Text('Bỏ ghim', style: TextStyle(color: Colors.red),),
            ],
          ),
          Text('1. Lorem Ipsum is simply dummy text of the hăefibwehidfg', style: TextStyle(color: Colors.grey), overflow: TextOverflow.ellipsis,),
          SizedBox(height: 20,),
          Row(
            children: [
              Text('Tạo thông báo mới + ', style: TextStyle(color: ColorPalette.oragerColor),),
              Spacer(),
              Text('Mở rộng', style: TextStyle(color: Color(0xFF172F69)),),
            ],
          ),
        ],
      ),
    );
  }

  Widget monhoc() {
    return Column(
      children: [
        itembutton('Xem bài tập', Colors.white, Icons.file_copy_rounded, ColorPalette.oragerColor, const BaiTapScreen()),
        itembutton('Tạo bài tập mới', Colors.black, Icons.add_link, Colors.white, const BaiTapScreen()),
        itembutton('Tạo bài kiểm tra', Colors.black, Icons.add_link, Colors.white, const BaiTapScreen()),
        itembutton('Chầm điểm', Colors.black, Icons.draw, Colors.white, const BaiTapScreen()),
        const SizedBox(height: 20,)
      ],
    );
  }

  Widget  itembutton(String ? textile, Color theme, IconData ic, Color themebackground, Widget nextpage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
          CupertinoPageRoute(builder: (context) => nextpage)
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: themebackground,
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.4)
          )
        ),
        child: ListTile(
          title: Text(textile!, style: TextStyle(color: theme),),
          leading: Icon(ic, color: theme, size: 18,),
        ),
      ),
    );
  }
}

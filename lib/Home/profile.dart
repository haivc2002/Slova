import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tt3/Home/WidgetAppbar.dart';

import '../Theme/Color.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: headerBar('Thông tin cá nhân', true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Center(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 4, color: Colors.grey),
                                image: const DecorationImage(
                                  image: NetworkImage('https://emplab.org/wp-content/themes/empowerment/img/catalog/image-2.png'),
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Column(
                          children: [
                            Expanded(child: Container()),
                            Row(
                              children: [
                                Expanded(child: Container()),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFFD2B2),
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.camera_alt, color: ColorPalette.oragerColor,),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Text('Lê Minh Quyền', style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                  ),),
                  const Text('quyenlm@gobiz.vn', style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              height: MediaQuery.of(context).size.height*0.35,
              decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Expanded(child: infomation('Thông tin cá nhân:','Chỉnh sửa')),
                  Expanded(child: infomation('Họ & Tên:', 'Lê Minh Quyền')),
                  Expanded(child: infomation('Lớp:', '12A4')),
                  Expanded(child: infomation('Số điện thoại:', '0981268736')),
                  Expanded(child: infomation('Email', 'ádiasndoasa@gmail .com')),
                  Expanded(child: infomation('Trường:', 'THPT Dân Lập Lương Thế Vinh')),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: double.infinity,
              // height: MediaQuery.of(context).size.height*0.4,
              decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(children: [
                    SizedBox(width: 15,),
                    Text('Cài đặt', style: TextStyle(color: Colors.grey),),
                  ],),
                  selecOption('Hỗ trợ'),
                  selecOption('Đổi mật khẩu'),
                  selecOption('Chính sách Bảo mật'),
                  selecOption('Điều khoản Sửa dụng'),
                  selecOption('Đăng xuất'),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      )
    );
  }

  Widget infomation(String titleInfo, String info) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(titleInfo, style: const TextStyle(color: Colors.grey),),
          // Expanded(child: Container()),
          const Spacer(),
          Text(info)
        ],
      ),
    );
  }

  Widget selecOption(String textOption) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          Text(textOption,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: ColorPalette.oragerColor,)
        ],
      ),
    );
  }
}

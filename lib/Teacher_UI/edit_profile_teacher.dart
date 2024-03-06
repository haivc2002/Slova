import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tt3/Home/WidgetAppbar.dart';

import '../Theme/Color.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroudApp,
      appBar: headerBar('Chỉnh sửa thông tin cá nhân', true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
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
                              const Spacer(),
                              Row(
                                children: [
                                  const Spacer(),
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
            ),
            inputEdit('Họ và tên'),
            inputEdit('Số điện thoại'),
            inputEdit('Email'),
            inputEdit('Trường'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorPalette.oragerColor,
              ),
              child: const Center(
                child: Text('Cập nhật', style: TextStyle(color: Colors.white),),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget inputEdit(String plancehoder) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: plancehoder,
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.4)
          ),
          isDense: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),

      ),
    );
  }
}

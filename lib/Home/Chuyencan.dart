import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tt3/Home/Detailchuyencan.dart';
import 'package:tt3/Home/WidgetAppbar.dart';
import 'package:tt3/Theme/Color.dart';
import 'package:intl/intl.dart';

import '../ Model/itemModel.dart';

class Chuyencan extends StatefulWidget {
  const Chuyencan({Key? key}) : super(key: key);

  @override
  State<Chuyencan> createState() => _ChuyencanState();
}

class _ChuyencanState extends State<Chuyencan> {

  static List<ItemModelday> dayy = [
    ItemModelday(day: '2022-11-3 (Thứ 4)', status: 'Đúng giờ'),
    ItemModelday(day: '2022-11-3 (Thứ 4)', status: 'Đúng giờ'),
    ItemModelday(day: '2022-11-3 (Thứ 4)', status: 'Đúng giờ'),
    ItemModelday(day: '2022-11-3 (Thứ 4)', status: 'Muộn giờ'),
    ItemModelday(day: '2022-11-3 (Thứ 4)', status: 'Đúng giờ'),
    ItemModelday(day: '2022-11-3 (Thứ 4)', status: 'Đúng giờ'),
    ItemModelday(day: '2022-11-3 (Thứ 4)', status: 'Đúng giờ'),
  ];

  static List<ItemModelday> dayy2 = [
    ItemModelday(day: '2022-11-3 (Thứ 4)', status: 'Không phép'),
    ItemModelday(day: '2022-11-3 (Thứ 4)', status: ''),
    ItemModelday(day: '2022-11-3 (Thứ 4)', status: ''),
  ];

  bool expande = false;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);

    return Scaffold(
      backgroundColor: ColorPalette.backgroudApp,
      appBar: headerBar('Chuyên cần', true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                              image: NetworkImage('https://scontent.fhan3-2.fna.fbcdn.net/v/t39.30808-6/410901502_1064741344675258_6524863206527149438_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=dd5e9f&_nc_eui2=AeHTTPgyIimQp_GRwRVGIFfaGPBdOLhPQKcY8F04uE9ApwhVlMk9aU_NaGYsVGYGpfHfl9IGLb83TmePogL4XvBY&_nc_ohc=QZ-_kDtcaeoAX_2cYSw&_nc_ht=scontent.fhan3-2.fna&cb_e2o_trans=t&oh=00_AfAVjgZxwxlvbOBsI57jYBKw6X5Pve-muaM68rKy6WKlJw&oe=65EBD0E7'),
                              fit: BoxFit.cover
                          )
                      ),

                    ),
                    const SizedBox(width: 20,),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lê Minh Quyền',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text('Điểm Danh: THPT Cầu Giấy',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.orange.withOpacity(0.3),
                      ),
                      child: Center(
                        child: Text(
                          formattedDate,
                          style: const TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: expan(),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        color: Colors.white,
        height: 80,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => const Detail())
                  );
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 15, 5, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: ColorPalette.oragerColor
                    )
                  ),
                  child: const Center(
                    child: Text('Thống kê',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ColorPalette.oragerColor
                      ),
                    ),
                  )
                ),
              )
            ),
            Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(5, 15, 20, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorPalette.oragerColor
                    ),
                    child: const Center(
                      child: Text('Về trang chủ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      )
    );
  }

  Widget expan() {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: const Text('Ngày lên lớp:',
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
            ),
            trailing: SizedBox(
              width: 80,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Text('${dayy.length} ngày'),
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: dayy.length,
                itemBuilder: (context, index) {
                  Color themeStatus = Colors.green;

                  if (dayy[index].status == 'Muộn giờ') {
                    themeStatus = Colors.orange;
                  }
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Row(
                      children: [
                        Text('${dayy[index].day}'),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              color: themeStatus.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                child: Text('${dayy[index].status}',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: themeStatus
                                  ),
                                )
                            ),
                          ),
                        )

                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: const Text('Ngày vắng:',
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
            ),
            trailing: SizedBox(
              width: 80,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Text('${dayy2.length} ngày'),
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: dayy2.length,
                itemBuilder: (context, index) {
                  Color themeStatus = Colors.transparent;

                  if (dayy2[index].status == 'Không phép') {
                    themeStatus = const Color(0xFFFF9D99);
                  }
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Row(
                      children: [
                        Text('${dayy2[index].day}'),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: themeStatus
                          ),
                          child: Center(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                child: Text('${dayy2[index].status}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red
                                  ),
                                )
                            ),
                          ),
                        )

                      ],
                    ),
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}

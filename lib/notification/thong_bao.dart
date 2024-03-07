import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tt3/Home/WidgetAppbar.dart';
import 'package:tt3/Theme/Color.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroudApp,
      appBar: headerBar('Thông báo', false),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Hôm nay'),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 40, width: 40,
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
                              Row(
                                children: [
                                  Text('[Bài tập] ', style: TextStyle(color: ColorPalette.oragerColor),),
                                  Text('Cô Thảo (GV toán) đã thêm'),
                                ],
                              ),
                              Text('1 bài tập'),
                              Text('1 giờ trước', style: TextStyle(fontSize: 10),),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Trước đó'),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 40, width: 40,
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
                              Row(
                                children: [
                                  Text('[Bài tập] ', style: TextStyle(color: ColorPalette.oragerColor),),
                                  Text('Cô Thảo (GV toán) đã thêm'),
                                ],
                              ),
                              Text('1 bài tập'),
                              Text('2 ngày trước', style: TextStyle(fontSize: 10),),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

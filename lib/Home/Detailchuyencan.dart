import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tt3/Home/WidgetAppbar.dart';
import 'package:tt3/Theme/Color.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  DateTime today = DateTime.now();
  void _ondayselected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroudApp,
      appBar: headerBar('Chi tiết chuyên cần', true),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Chi tiết'),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        const Text('Lê Minh Quyền',
                          style: TextStyle(
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    TableCalendar(
                      availableGestures: AvailableGestures.none,
                      focusedDay: today,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                      selectedDayPredicate: (day) => isSameDay(day, today),
                      onDaySelected: _ondayselected,
                      calendarStyle: CalendarStyle(
                        selectedDecoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPalette.oragerColor, // Change this color to your desired color
                        ),
                        todayDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPalette.oragerColor.withOpacity(0.4), // Change this color to your desired color for today
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    timeWork('Điểm Danh lúc 07:12'),
                    timeWork('Ra về lúc 17:12'),
                  ],
                ),
              )

            ],
          ),
        ),
      )
    );
  }

  Widget timeWork(String ? data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Icon(Icons.timer_sharp, color: ColorPalette.oragerColor,),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data!),
                Text(
                  'Trường THPT Cầu Giấy, Số 12, ngõ 118 Nguyễn Khánh Toàn, QuanHoa, Cầu Giấy, Hà Nội, Việt Nam',
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.7)
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          child: Text('đúng giờ', style: TextStyle(
                            color: Colors.green
                          ),)
                        ),
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tt3/Teacher_UI/edit_profile_teacher.dart';
import 'package:tt3/Theme/theme_color.dart';

import '../Auth/login_screen.dart';

class HomeTeacher extends StatefulWidget {
  const HomeTeacher({Key? key}) : super(key: key);

  @override
  State<HomeTeacher> createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {

  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Map<String, String>> subjects = [
    {
      'row': '6',
      'col': '5',
      'data': 'Lớp 12A2',
    },
    {
      'row': '5',
      'col': '1',
      'data': 'Lớp 12A2',
    },
    {
      'row': '0',
      'col': '0',
      'data': 'Lớp 12A2',
    },
    {
      'row': '1',
      'col': '0',
      'data': 'Lớp 12A2',
    },
    {
      'row': '0',
      'col': '1',
      'data': 'Lớp 12A2',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroudApp,
      appBar: AppBar(),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width*0.9,
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: itemDrawer(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Quản lý lớp học', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  gridviewdemo('https://hawaii.edu.vn/wp-content/uploads/2020/07/3647051-1.jpg', 'Quản lý'),
                  const Text('Thông tin nhà trường', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  gridviewdemo('https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZ63p2YqmE5jy6tP5xEYEit7SrmRIjEydbhqPvWF35TvOIvZ4-', 'thông tin'),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Thời khóa biểu', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),),
                    Text('Tuần này bạn có ${subjects.length} tiết dạy')
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: MediaQuery.of(context).size.width*2,
                child: schedule(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
          });
        },
        showSelectedLabels: false,
        selectedItemColor: ColorPalette.oragerColor,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: [
          itemBottom(Icons.home),
          itemBottom(Icons.calendar_month),
          itemBottom(Icons.account_balance_wallet_rounded),
          itemBottom(Icons.notifications),
          itemBottom(Icons.messenger_outline),
        ],
      ),
    );
  }

  BottomNavigationBarItem itemBottom(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: '',
    );
  }

  Widget gridviewdemo(String url, String textdata) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1/1,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 30,
                    offset: const Offset(0, 3),
                  ),
                ]
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(url, height: 80,),
                  Text(textdata, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Widget itemDrawer() {
    return ListView(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: ColorPalette.oragerColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                        image: NetworkImage('https://scontent.fhan4-1.fna.fbcdn.net/v/t1.6435-9/151787522_353089146036355_1458616978185420519_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=300f58&_nc_eui2=AeHVKCMgP_UA0F4AK7U3z7KpQlH_y0CVS85CUf_LQJVLzicLfnRhxrS6DEwA6qsyBHpv23zWnCI1GWlXBdC6I4aa&_nc_ohc=kD74ZsJKt1oAX8sqea6&_nc_ht=scontent.fhan4-1.fna&cb_e2o_trans=t&oh=00_AfC-DYfQgYKxe2FYUWz8gtmj1_t8qm14zJI97Z9z4Sp7nA&oe=660E7808'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              title: const Text('Lê Minh Quyền', style: TextStyle(color: Colors.white),),
              subtitle: const Text('quyenlm @gobiz.vn', style: TextStyle(fontSize: 10, color: Colors.white),),
              trailing: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('<<', style: TextStyle(color: Colors.white),),
                ),
              )
          ),
        ),
        ListTile(
          title: const Text('Thông tin cá nhân'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, 
              CupertinoPageRoute(builder: (context) => const EditProfile())
            );
          },
          trailing: const Text('Chỉnh sửa', style: TextStyle(color: ColorPalette.oragerColor),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              infoTeacher('Họ & tên', 'Lê Minh Quyền'),
              infoTeacher('Số điện thoại', '0981268736'),
              infoTeacher('Email', 'ádiasndoasa@gmail .com'),
              infoTeacher('Trường', 'THPT Dân Lập Lương Thế Vinh'),
              infoTeacher('Chức vụ', 'Giáo viên Chủ Nhiệm Lớp 12A4, Giáo viên Toán Lớp 12A1, 12A2, 11D1'),
            ],
          ),
        ),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Cài đặt'),
              listSetting('Hỗ trợ', null),
              listSetting('Đổi mật khẩu', null),
              listSetting('Chính sách bảo mật', null),
              listSetting('Điều khoản sử dụng', null),
              listSetting('Đăng xuất', const Login()),
            ],
          ),
        )
      ],
    );
  }

  Widget listSetting(String nameSetting, Widget ? destination) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => destination!));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(nameSetting, style: const TextStyle(fontWeight: FontWeight.w600),),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16,)
          ],
        ),
      ),
    );
  }

  double size=100;

  Widget infoTeacher(String nameInfo, String dataInfo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: size,child: Text('$nameInfo:')),
          Expanded(
            child: Text(
              dataInfo,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget schedule() {
    int row = 7;
    int col = 10;
    bool manage = true;

    return Column(
      children: [
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width*2,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: row,
            itemBuilder: (context, index) {
              double cellWidth = MediaQuery.of(context).size.width*2 / row;
              if(index == 6) {
                manage = false;
              }
              return SizedBox(
                height: 50,
                width: cellWidth,
                child: Center(
                  child: Text(manage ? 'thứ ${index+2}' : 'chủ nhật'),
                ),
              );
            },
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 2 / 1,
          ),
          itemCount: col * row,
          itemBuilder: (context, index) {
            int rowIndex = index % row;
            int colIndex = index ~/ row;

            String? cellData = getCellData(rowIndex.toString(), colIndex.toString());

            return Padding(
              padding: const EdgeInsets.all(0.5),
              child: Container(
                color: cellData != null ? ColorPalette.oragerColor : Colors.white,
                child: Center(
                  child: Text('$cellData \n Tiết ${colIndex+1}' ?? '', style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  String? getCellData(String row, String col) {
    Map<String, String>? cellData = subjects.firstWhere(
          (data) => data['row'] == row && data['col'] == col,
      orElse: () => Map<String, String>.from({}),
    );

    return cellData != null ? cellData['data'] : null;
  }

}

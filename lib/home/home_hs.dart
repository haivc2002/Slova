import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tt3/Home/Chuyencan.dart';
import 'package:tt3/Home/profile.dart';
import 'package:tt3/Notification/Thongbao.dart';

import '../ Model/item_model.dart';
import '../Theme/Color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  static List<ItemModel> obj = [
    ItemModel(name: 'Toán', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png'),
    ItemModel(name: 'Sinh học', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Văn học', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Âm nhạc', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Địa lý', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
    ItemModel(name: 'Lịch sử', url: 'https://www.m5s.vn/images/category/icon-1665373458-toan-hoc.png',),
  ];
  int _currentIndex = 0;
  final PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                slideHeader(),
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Môn học'),
                          Text('Năm nay có 12 bạn học môn')
                        ],
                      ),
                      Spacer(),
                      Text('Xem tất cả', style: TextStyle(color: ColorPalette.oragerColor),)
                    ],
                  ),
                ),
                cobonentsubject()
              ],
            ),
          ),
          const Notifications(),
        ],
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outline),
            label: 'Order',
          ),
        ],
      ),
    );
  }

  Widget slideHeader() {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.45,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width,
                child: Swiper(
                  itemBuilder: (BuildContext context,int index) {
                    return Image.network('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FceCAFN%2FbtrwTNXuBpt%2FjwSCbk8imvYZ8JS6QAjPw0%2Fimg.png',
                      fit: BoxFit.fitWidth,
                    );
                  },
                  itemCount: 5,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height*0.45,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Spacer(),
              Container(
                height: MediaQuery.of(context).size.height*0.18,
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Expanded(child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Image.network('https://media.licdn.com/dms/image/C560BAQEEj9L0ly0tnw/company-logo_200_200/0/1630634530364/sagra_technology_logo?e=2147483647&v=beta&t=3rG7BVSP1NzW6fi5rR3qyNbNiIhY4uboXqH-M27x6ig', height: 40,),
                          const SizedBox(width: 10,),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Chào, Minh Quyền'),
                              Text("Lớp 12A4")
                            ],
                          )
                        ],
                      ),
                    )),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: componentBar(Icons.face, 'Chuyên cần', const Chuyencan())),
                          Expanded(child: componentBar(Icons.featured_play_list_sharp, 'Bảng điểm', Profile())),
                          Expanded(child: componentBar(Icons.calendar_month, 'Năm học', Profile())),
                          Expanded(child: componentBar(Icons.person, 'Cá nhân', const Profile())),
                        ],
                      ),
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget componentBar(IconData ic, String title, Widget destination) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => destination));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(ic, color: ColorPalette.oragerColor,),
          Text(title,
            style: const TextStyle(
                fontSize: 10
            ),
          )
        ],
      ),
    );
  }

  Widget cobonentsubject() {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.3,
      width: MediaQuery.of(context).size.width*0.8,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2/2,
        ),
        itemCount: obj.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFF48628D)
                  ),
                  child: Center(child: Image.network('${obj[index].url}', height: 30,)),
                ),
                Text('${obj[index].name}')
              ],
            )
          );
        }
      ),
    );
  }
}

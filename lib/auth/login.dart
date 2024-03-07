import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt3/Home/home_hs.dart';
import 'package:tt3/Teacher_UI/Component_Pageview/synthetic.dart';
import '../Theme/theme_color.dart';
import '../model/item_model.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

bool isChecked = false;

class _LoginState extends State<Login> {


  static List<ItemModelUser> login = [
    ItemModelUser(email: 'testemail', quyen: 1),
    ItemModelUser(email: 'testemail2', quyen: 0),
  ];

  void loginUser() {
    for (var user in login) {
      if (user.email == textcontroller.text) {
        if (user.quyen == 1) {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (context) => const HomeScreen()),
          );
        } else if (user.quyen == 0) {
          // Navigator.push(
          //   context,
          //   CupertinoPageRoute(builder: (context) => const Synthetic()),
          // );

          Navigator.pushNamed(
            context,
            '/synthetic',
          );
        }
        return;
      }
    }
  }

  TextEditingController textcontroller = TextEditingController(text: 'testemail2');

  @override
  Widget build(BuildContext context) {

    final colorPalette = ColorPaletteProvider.of(context)!.colorPalette;

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                forminput('Email hoặc số điện thoại', 'Nhập email hoặc số điện thoại', Icons.person),
                forminput('Mất khẩu', 'Nhập mật khẩu', Icons.lock),
                const Text('Mật khẩu ít nhất có 8 ký tự'),
                Wrap(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                    const Text(
                      'Tôi đồng ý với',
                      overflow: TextOverflow.visible,
                    ),
                    const Text(
                      ' chính sách & điều khoản ',
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        // color: colorPalette
                        color: ColorPalette.oragerColor
                      ),
                    ),
                    const Text('của Slova')
                  ],
                ),
                const SizedBox(height: 40,),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Material(
                    borderRadius: BorderRadius.circular(6),
                    color: textcontroller.text.isNotEmpty ? ColorPalette.oragerColor : Colors.grey.withOpacity(0.3),
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(context,
                        //   PageRouteBuilder(
                        //     pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
                        //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        //       const begin = Offset(1.0, 0.0);
                        //       const end = Offset.zero;
                        //       const curve = Curves.easeInOut;
                        //       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                        //       return SlideTransition(
                        //         position: animation.drive(tween),
                        //         child: child,
                        //       );
                        //     },
                        //     transitionDuration: const Duration(milliseconds: 300),
                        //   ),
                        // );
                        loginUser();
                      },
                      child: const Center(
                        child: Text('Đăng nhập'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget forminput(String titleinput, String plancehoder, IconData iconHeder) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleinput),
          TextField(
            controller: textcontroller,
            decoration: InputDecoration(
                hintText: plancehoder,
                isDense: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)), // Đặt giá trị theo ý muốn
                  borderSide: BorderSide(color: Colors.black), // Màu sắc của đường viền
                ),
                prefixIcon: Icon(iconHeder)),

          )
        ],
      ),
    );
  }
}

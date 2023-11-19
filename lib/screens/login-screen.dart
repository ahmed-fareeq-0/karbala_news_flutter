import 'package:application_sus/screens/home-screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application_sus/services/auth_service.dart';
import '../pallete.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoding = true;
  String emailValue = '';
  String passValue = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/background.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'اخبار كربلاء',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: "Cairo-Medium",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextField(
                          controller: emailController,
                          onChanged: (value) {
                            setState(() {
                              emailValue = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                FontAwesomeIcons.envelope,
                                size: 28,
                                color: kWhite,
                              ),
                            ),
                            hintText: "البريد الأكتروني",
                            hintStyle: kBodyText,
                          ),
                          style: kBodyText,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextField(
                          controller: passwordController,
                          onChanged: (value) {
                            setState(() {
                              passValue = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                FontAwesomeIcons.lock,
                                size: 28,
                                color: kWhite,
                              ),
                            ),
                            hintText: "كلمة المرور",
                            hintStyle: kBodyText,
                          ),
                          style: kBodyText,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child: Text(
                      'هل نسيت كلمة المرور؟',
                      style: kBodyText.copyWith(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    height: size.height * 0.06,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kBlue,
                    ),
                    child: TextButton(
                        onPressed: () {
                          if (emailValue.isNotEmpty) {
                            print('قيمة حقل البريد الإلكتروني: $emailValue');
                            AuthService.login(
                              emailController.text.toString(),
                              passwordController.text.toString(),
                              (result) {
                                setState(() {
                                  isLoding = result;
                                });

                                if (result) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                }
                              },
                            );
                          } else {
                            print('يرجى إدخال قيمة لحقل البريد الإلكتروني');
                          }
                        },
                        child: isLoding
                            ? Text(
                                "تسجيل دخول",
                                style: kBodyText.copyWith(
                                    fontWeight: FontWeight.bold),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                child: Container(
                  child: Text(
                    'انشاء حساب جديد',
                    style: kBodyText,
                  ),
                  decoration:
                      BoxDecoration(border: Border(bottom: BorderSide.none)),
                ),
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        )
      ],
    );
  }
}

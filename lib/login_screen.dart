import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './panel_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var user = '';
  var password = '';
  var ipek = '';
  var dataScreen = false;
  var loginScreen = true;
  var offchc = false;
  var dio = Dio();
  @override
  void initState() {
    super.initState();
    defShPr();
    dio.options.receiveTimeout = 3000;
    dio.options.connectTimeout = 3000;
    dio.options.sendTimeout = 3000;
  }

  Future defShPr() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      user = prefs.getString('userShP') ?? 'admin';
      password = prefs.getString('passwordShP') ?? 'admin';
      ipek = prefs.getString('ipekShP') ?? '192.168.0.8';
    });
  }

  void saveShPr() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('userShP', user);
      prefs.setString('passwordShP', password);
      prefs.setString('ipekShP', ipek);
    });
  }

  Future<void> login() async {
    try {
      print(ipek + password + user);
      Response response = await dio.get('http://' + ipek);
      print('login status');
      print(response.statusCode);
    } on DioError catch (e) {
      setState(() {
        offchc = true;
        dataScreen = false;
      });
    }
    try {
      print(ipek + password + user);
      Response response = await dio.get('http://' +
          ipek +
          '/login.html?Login=' +
          user +
          '&Password=' +
          password);
      print('login status');
      print(response.statusCode);
      var loginCheck = response.data;
      var len = loginCheck.length;
      print(len);
      print(loginCheck[len - 20] +
          loginCheck[len - 19] +
          loginCheck[len - 18] +
          loginCheck[len - 17] +
          loginCheck[len - 16]);
      if (response.statusCode == 200 && len > 20000) {
        setState(() {
          dataScreen = true;
          loginScreen = false;
          offchc = false;
        });
      }
    } on DioError catch (e) {
      setState(() {
        offchc = true;
        dataScreen = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFF0080FF),
              Colors.white,
            ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Color(0xFF32B2FF),
              title: const Text('Logowanie'),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      print('Menu górne');
                    },
                  );
                },
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 80.0,
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: TextField(
                                decoration: InputDecoration(
                                    border: const UnderlineInputBorder(),
                                    hintText: user),
                                onChanged: (text) {
                                  user = text;
                                }),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: Center(
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: TextField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: '*****',
                              ),
                              onChanged: (text) {
                                password = text;
                              },
                              obscureText: true,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 220.0),
                        child: Center(
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: const UnderlineInputBorder(),
                                  hintText: ipek,
                                ),
                                onChanged: (text) {
                                  ipek = '$text';
                                }),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 320.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  print(user);
                                  saveShPr();
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [
                                        Colors.lightBlue,
                                        Colors.blue
                                      ]),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: const Text('Save'),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  await login();
                                  print(dataScreen);
                                  if (dataScreen) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PanelScreen(ip: ipek)),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [
                                        Colors.blue,
                                        Colors.lightBlue
                                      ]),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: const Text('Login'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      if (offchc)
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'OFFLINE',
                            style: TextStyle(color: Colors.red, fontSize: 25.0),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            )));
  }
}

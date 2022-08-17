import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import './login_screen.dart';

class PanelScreen extends StatefulWidget {
  final String ip;
  const PanelScreen({Key? key, required this.ip}) : super(key: key);

  @override
  State<PanelScreen> createState() => _PanelScreenState();
}

class _PanelScreenState extends State<PanelScreen> {
  double _currentSliderValue = 0;
  var data_from_kcx = 'off';
  var fannaw = '';
  var fanwyw = '';
  var nastawa = '';
  var temp = '';

  var dio = Dio();
  late Timer _periodicT;

  @override
  void initState() {
    super.initState();
    dio.options.receiveTimeout = 3000;
    dio.options.connectTimeout = 3000;
    dio.options.sendTimeout = 3000;
    var ipek = widget.ip;
    data_kcx();
    _periodicT = Timer.periodic(Duration(seconds: 5), (timer) {
      data_kcx();
      print('http');
    });
    //startTimer();
    print(ipek + ' 123');
  }

  @override
  void dispose() {
    super.dispose();
    _periodicT.cancel();
  }

  String setimage() {
    if (data_from_kcx == 'OFF') {
      return 'assets/Off.PNG';
    } else if (data_from_kcx == 'ECO') {
      return 'assets/Eco.PNG';
    } else if (data_from_kcx == 'Komfort') {
      return 'assets/Komfort.PNG';
    } else if (data_from_kcx == 'MAX') {
      return 'assets/Max.PNG';
    } else if (data_from_kcx == 'Kal') {
      return 'assets/Kal.PNG';
    } else {
      return 'assets/Off.PNG';
    }
  }

  Future<void> logout() async {
    var ipek = widget.ip;
    setState(() {});
    http.get(Uri.parse('http://' + ipek));
  }

  void offkcx() async {
    var ipek = widget.ip;
    http.get(Uri.parse('http://' + ipek + '/C=01760201040000000053bf'));
    print(ipek);
    setState(() {
      data_from_kcx = 'OFF';
    });
  }

  void ecokcx() async {
    var ipek = widget.ip;
    http.get(Uri.parse('http://' + ipek + '/C=0176020104010000005243'));
    setState(() {
      data_from_kcx = 'ECO';
    });
  }

  void komfort() async {
    var ipek = widget.ip;
    http.get(Uri.parse('http://' + ipek + '/C=01100010000204000200005363'));
    setState(() {
      data_from_kcx = 'Komfort';
    });
  }

  void maxkcx() async {
    var ipek = widget.ip;
    http.get(Uri.parse('http://' + ipek + '/C=017602010404000000528f'));
    setState(() {
      data_from_kcx = 'MAX';
    });
  }

  void kal() async {
    var ipek = widget.ip;
    http.get(Uri.parse('http://' + ipek + '/C=01100010000204000800007361'));
    setState(() {
      data_from_kcx = 'Kal';
    });
  }

  void minusthree() async {
    var ipek = widget.ip;
    print('m3');
    http.get(Uri.parse('http://' + ipek + '/C=017602010500fdfffffe3f'));
  }

  void minustwo() async {
    var ipek = widget.ip;
    print('m2');
    http.get(Uri.parse('http://' + ipek + '/C=017602010500feffff0e3f'));
  }

  void minusone() async {
    var ipek = widget.ip;
    print('m1');
    http.get(Uri.parse('http://' + ipek + '/C=017602010500ffffff5fff'));
  }

  void zero() async {
    var ipek = widget.ip;
    print('zero');
    http.get(Uri.parse('http://' + ipek + '/C=0176020105000000006e7f'));
  }

  void plusone() async {
    var ipek = widget.ip;
    print('p1');
    http.get(Uri.parse('http://' + ipek + '/C=0176020105000100003fbf'));
  }

  void plustwo() async {
    var ipek = widget.ip;
    print('p2');
    http.get(Uri.parse('http://' + ipek + '/C=017602010500020000cfbf'));
  }

  void plusthree() async {
    var ipek = widget.ip;
    print('p3');
    http.get(Uri.parse('http://' + ipek + '/C=0176020105000300009e7f'));
  }

  String plus(x, y, z, v, e) {
    var first = 0;
    var second = 0;
    var third = 0;
    var fourth = 0;
    num c = 0;
    if (x == '0') {
      first = 0;
    }
    if (x == '1') {
      first = 1;
    }
    if (x == '2') {
      first = 2;
    }
    if (x == '3') {
      first = 3;
    }
    if (x == '4') {
      first = 4;
    }
    if (x == '5') {
      first = 5;
    }
    if (x == '6') {
      first = 6;
    }
    if (x == '7') {
      first = 7;
    }
    if (x == '8') {
      first = 8;
    }
    if (x == '9') {
      first = 9;
    }
    if (x == 'a') {
      first = 10;
    }
    if (x == 'b') {
      first = 11;
    }
    if (x == 'c') {
      first = 12;
    }
    if (x == 'd') {
      first = 13;
    }
    if (x == 'e') {
      first = 14;
    }
    if (x == 'f') {
      first = 15;
    }
    if (y == '0') {
      second = 0;
    }
    if (y == '1') {
      second = 1 * 16;
    }
    if (y == '2') {
      second = 2 * 16;
    }
    if (y == '3') {
      second = 3 * 16;
    }
    if (y == '4') {
      second = 4 * 16;
    }
    if (y == '5') {
      second = 5 * 16;
    }
    if (y == '6') {
      second = 6 * 16;
    }
    if (y == '7') {
      second = 7 * 16;
    }
    if (y == '8') {
      second = 8 * 16;
    }
    if (y == '9') {
      second = 9 * 16;
    }
    if (y == 'a') {
      second = 10 * 16;
    }
    if (y == 'b') {
      second = 11 * 16;
    }
    if (y == 'c') {
      second = 12 * 16;
    }
    if (y == 'd') {
      second = 13 * 16;
    }
    if (y == 'e') {
      second = 14 * 16;
    }
    if (y == 'f') {
      second = 15 * 16;
    }
    if (z == '0') {
      third = 0;
    }
    if (z == '1') {
      third = 1 * 16 * 16;
    }
    if (z == '2') {
      third = 2 * 16 * 16;
    }
    if (z == '3') {
      third = 3 * 16 * 16;
    }
    if (z == '4') {
      third = 4 * 16 * 16;
    }
    if (z == '5') {
      third = 5 * 16 * 16;
    }
    if (z == '6') {
      third = 6 * 16 * 16;
    }
    if (z == '7') {
      third = 7 * 16 * 16;
    }
    if (z == '8') {
      third = 8 * 16 * 16;
    }
    if (z == '9') {
      third = 9 * 16 * 16;
    }
    if (z == 'a') {
      third = 10 * 16 * 16;
    }
    if (z == 'b') {
      third = 11 * 16 * 16;
    }
    if (z == 'c') {
      third = 12 * 16 * 16;
    }
    if (z == 'd') {
      third = 13 * 16 * 16;
    }
    if (z == 'e') {
      third = 14 * 16 * 16;
    }
    if (z == 'f') {
      third = 15 * 16 * 16;
    }
    if (v == '0') {
      fourth = 0;
    }
    if (v == '1') {
      fourth = 1 * 16 * 16 * 16;
    }
    if (v == '2') {
      fourth = 2 * 16 * 16 * 16;
    }
    if (v == '3') {
      fourth = 3 * 16 * 16 * 16;
    }
    if (v == '4') {
      fourth = 4 * 16 * 16 * 16;
    }
    if (v == '5') {
      fourth = 5 * 16 * 16 * 16;
    }
    if (v == '6') {
      fourth = 6 * 16 * 16 * 16;
    }
    if (v == '7') {
      fourth = 7 * 16 * 16 * 16;
    }
    if (v == '8') {
      fourth = 8 * 16 * 16 * 16;
    }
    if (v == '9') {
      fourth = 9 * 16 * 16 * 16;
    }
    if (v == 'a') {
      fourth = 10 * 16 * 16 * 16;
    }
    if (v == 'b') {
      fourth = 11 * 16 * 16 * 16;
    }
    if (v == 'c') {
      fourth = 12 * 16 * 16 * 16;
    }
    if (v == 'd') {
      fourth = 13 * 16 * 16 * 16;
    }
    if (v == 'e') {
      fourth = 14 * 16 * 16 * 16;
    }
    if (v == 'f') {
      fourth = 15 * 16 * 16 * 16;
    }
    if (e == '1') {
      c = (first + second + third + fourth) / 256;
      c = c.roundToDouble();
    }
    if (e == '0') {
      c = first + second + third + fourth;
    }
    return c.toString();
  }

  void data_kcx() async {
    print(dio.options.receiveTimeout);
    print(dio.options.connectTimeout);
    print(dio.options.sendTimeout);
    var ipek = widget.ip;
    try {
      Response response =
          await dio.get('http://' + ipek + '/C=0170004001f00002000124');
      //offchc = false;
      setState(() {
        data_from_kcx = response.data[497];
      });

      if (data_from_kcx == 'h') {
        Navigator.pop(context);
      }

      if (data_from_kcx == '0') {
        data_from_kcx = 'OFF';
      }
      if (data_from_kcx == '1') {
        data_from_kcx = 'ECO';
      }
      if (data_from_kcx == '2') {
        data_from_kcx = 'Komfort';
      }
      if (data_from_kcx == '4') {
        data_from_kcx = 'MAX';
      }
      if (data_from_kcx == '8') {
        data_from_kcx = 'Kal';
      }
      print(data_from_kcx);
      print(response.statusCode);

      setState(() {
        fannaw =
            plus(response.data[391], response.data[390], '0', '0', '0') + '%';
        fanwyw =
            plus(response.data[457], response.data[456], '0', '0', '0') + '%';
        nastawa = plus(response.data[317], response.data[316],
            response.data[315], response.data[314], '1');
        temp = plus(response.data[247], response.data[246], response.data[245],
            response.data[244], '1');
        print(fannaw);
      });
    } on DioError catch (e) {
      if (e.response != null) {
        //e.response != null && dataScreen ==true
        print('404');
        Navigator.pop(context);
        setState(() {
          //offchc = true;
        });
      } else {
        if (true) {
          //dataScreen==true
          Navigator.pop(context);
          print('no');
          setState(() {
            //offchc = true;
            fannaw = '';
            fanwyw = '';
            nastawa = '';
            temp = '';
          });
        }
      }
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
            Color(0xFF0080FF),
            Colors.white,
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color(0xFF32B2FF), //ED592B Colors.blueGrey
            title: Text('User ' + widget.ip),
          ),
          body: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(6.0),
                        child: const Image(
                            image: AssetImage(
                                'assets/Panel3.png'))), // główne tło panelu ,),

                    Container(
                      padding: const EdgeInsets.all(25.0),
                      child: Image(
                        image: AssetImage(
                            setimage()), //w orginale set image, usunąć const
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 162.0, left: 150.0),
                      child: Row(children: [
                        const Text(
                          'Nastawa: ',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        Text(
                          nastawa,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25.0),
                        ),
                      ]),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 187.0, left: 150.0),
                      child: Row(children: [
                        const Text(
                          '   Odczyt: ',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        Text(
                          temp,
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                      ]),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 212.0, left: 152.0),
                      child: Row(children: [
                        const Text(
                          '   Nawiew: ',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        Text(
                          '$fannaw',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                      ]),
                    ),

                    Container(
                      padding: const EdgeInsets.only(top: 237.0, left: 150.0),
                      child: Row(children: [
                        const Text(
                          '   Wywiew: ',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        Text(
                          '$fanwyw',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                      ]),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        offkcx();
                        print('1');
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Colors.lightBlue, Colors.blue]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 70,
                          height: 40,
                          alignment: Alignment.center,
                          child: const Text('Off'),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ecokcx();
                        print('2');
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Colors.lightBlue, Colors.blue]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 70,
                          height: 40,
                          alignment: Alignment.center,
                          child: const Text('Eco'),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        komfort();
                        print('3');
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Colors.lightBlue, Colors.blue]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 70,
                          height: 40,
                          alignment: Alignment.center,
                          child: const Text('Prek'),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        maxkcx();
                        print('4');
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Colors.lightBlue, Colors.blue]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 70,
                          height: 40,
                          alignment: Alignment.center,
                          child: const Text('Komf'),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        kal();
                        print('5');
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Colors.lightBlue, Colors.blue]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 70,
                          height: 40,
                          alignment: Alignment.center,
                          child: const Text('Kal'),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: const Text(
                    'Korekta nastawy',
                    style: TextStyle(color: Colors.black54, fontSize: 25.0),
                  ),
                ),
                Container(
                    //padding:const EdgeInsets.only(top:0.0, left:0.0),
                    child: Slider(
                  value: _currentSliderValue,
                  min: -3,
                  max: 3,
                  divisions: 6,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blue,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                    if (value == -3) {
                      minusthree();
                      print('1');
                    }
                    if (value == -2) {
                      minustwo();
                      print('2');
                    }
                    if (value == -1) {
                      minusone();
                      print('3');
                    }
                    if (value == 0) {
                      zero();
                      print('4');
                    }
                    if (value == 1) {
                      plusone();
                      print('5');
                    }
                    if (value == 2) {
                      plustwo();
                      print('6');
                    }
                    if (value == 3) {
                      plusthree();
                      print('7');
                    }
                  },
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await logout();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Colors.lightBlue, Colors.blue]),
                            borderRadius: BorderRadius.circular(50)),
                        child: Container(
                          width: 70,
                          height: 40,
                          alignment: Alignment.center,
                          child: const Text('Logout'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

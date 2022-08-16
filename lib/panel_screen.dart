import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './login_screen.dart';

class PanelScreen extends StatefulWidget {
  final String ip;
  const PanelScreen({Key? key, required this.ip}) : super(key: key);

  @override
  State<PanelScreen> createState() => _PanelScreenState();
}

class _PanelScreenState extends State<PanelScreen> {
  double _currentSliderValue = 0;
  var data_from_kcx = '';
  @override

  void initState() {
    super.initState();
    var ipek = widget.ip;
    print(ipek+' 123');
  }
  Future <void> logout() async {
    var ipek = widget.ip;
    setState(() {
    });
    http.get(Uri.parse('http://' + ipek));
  }
  void offkcx() async{
    var ipek = widget.ip;
    http.get(Uri.parse('http://' + ipek + '/C=01760201040000000053bf'));
    print(ipek);
    setState(() {
      data_from_kcx='OFF';
    });
  }
  void ecokcx() async{
    var ipek = widget.ip;
    http.get(Uri.parse('http://' + ipek + '/C=0176020104010000005243'));
    setState(() {
      data_from_kcx='ECO';
    });
  }
  void komfort() async{
    var ipek = widget.ip;
    http.get(Uri.parse('http://' + ipek + '/C=01100010000204000200005363'));
    setState(() {
      data_from_kcx='Komfort';
    });
  }

  void maxkcx() async{
    var ipek = widget.ip;
    http.get(Uri.parse('http://' + ipek + '/C=017602010404000000528f'));
    setState(() {
      data_from_kcx='MAX';
    });
  }
  void kal() async{
    var ipek = widget.ip;
    http.get(Uri.parse('http://' + ipek + '/C=01100010000204000800007361'));
    setState(() {
      data_from_kcx='Kal';
    });
  }
  void minusthree() async{
    var ipek = widget.ip;
    print('m3');
    http.get(Uri.parse('http://' + ipek + '/C=017602010500fdfffffe3f'));
  }
  void minustwo() async{
    var ipek = widget.ip;
    print('m2');
    http.get(Uri.parse('http://' + ipek + '/C=017602010500feffff0e3f'));
  }
  void minusone() async{
    var ipek = widget.ip;
    print('m1');
    http.get(Uri.parse('http://' + ipek + '/C=017602010500ffffff5fff'));


  }
  void zero() async{
    var ipek = widget.ip;
    print('zero');
    http.get(Uri.parse('http://' + ipek + '/C=0176020105000000006e7f'));


  }
  void plusone() async{
    var ipek = widget.ip;
    print('p1');
    http.get(Uri.parse('http://' + ipek + '/C=0176020105000100003fbf'));
  }

  void plustwo() async{
    var ipek = widget.ip;
    print('p2');
    http.get(Uri.parse('http://' + ipek + '/C=017602010500020000cfbf'));
  }
  void plusthree() async{
    var ipek = widget.ip;
    print('p3');
    http.get(Uri.parse('http://' + ipek + '/C=0176020105000300009e7f'));
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
                      child: const Image(
                          image: AssetImage(
                              'assets/Off.PNG') //w orginale set image, usunąć const
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
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
                      print('1');
                    }
                    if (value == -2) {
                      print('2');
                    }
                    if (value == -1) {
                      print('3');
                    }
                    if (value == 0) {
                      print('4');
                    }
                    if (value == 1) {
                      print('5');
                    }
                    if (value == 2) {
                      print('6');
                    }
                    if (value == 3) {
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
                              builder: (context) =>
                                  LoginScreen()),
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

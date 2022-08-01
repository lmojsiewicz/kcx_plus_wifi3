import 'package:flutter/material.dart';
import './panel_screen.dart';

class LoginScreen extends StatefulWidget {
  final String ipek1;
  const LoginScreen({Key? key, required this.ipek1}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var ipek = widget.ipek1;
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
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: 'Lukasz',
                                ),
                                onChanged: (text) {}),
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
                              onChanged: (text) {},
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
                                  print('Tekst');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PanelScreen(ip: ipek)),
                                  );
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
                                onPressed: () {
                                  print('Tekst');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PanelScreen(ip: ipek)),
                                  );
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
                    ],
                  ),
                ],
              ),
            )));
  }
}

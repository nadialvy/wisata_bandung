import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Wisata Bandung',
      theme: ThemeData(),
      home: const DetailScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget{
  const DetailScreen({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea( //digunakan untuk perangkat yang memiliki notch
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //memaksimalkan lebar column
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text(
                'Farm House Lembang',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      const Icon(Icons.calendar_today),
                      Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: const Text(
                          'Open Everyday',
                          style: TextStyle(
                            fontSize: 12.0
                          ),
                        )
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.access_time),
                      Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: const Text(
                          '09.00 - 20.00',
                          style: TextStyle(
                            fontSize: 12.0
                          ),
                        )
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.monetization_on),
                      Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: const Text(
                          'Rp.25000',
                          style: TextStyle(
                            fontSize: 12.0
                          ),
                        )
                      )
                    ],
                  ),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
              child: const Text(
                'Magna ullamco ex eiusmod sit do anim esse quis. Reprehenderit quis officia et qui ipsum esse. Quis culpa nulla reprehenderit aute deserunt sunt nostrud commodo enim laboris velit deserunt cillum. Voluptate reprehenderit labore irure duis tempor dolor do eiusmod voluptate cillum. Anim proident sint ea mollit deserunt velit. Elit nostrud enim minim irure nisi ipsum esse anim consectetur. Consequat deserunt duis ea sint commodo officia amet est ut culpa amet cillum consectetur laboris.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      )
    );
  }
}
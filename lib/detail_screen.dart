import 'package:flutter/material.dart';


class DetailScreen extends StatelessWidget{
  const DetailScreen({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea( //digunakan untuk perangkat yang memiliki notch
        child: SingleChildScrollView( //supaya bisa discroll
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.stretch, //memaksimalkan lebar column
            children: <Widget>[
              Image.asset(
                'images/farm-house.jpg'
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: const Text(
                  'Farm House Lembang',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    
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
              Container(
                height: 150,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 4,
                      blurRadius: 20
                    )
                  ]
                ),
                child: ListView( //listview tidak bisa diletakkan didalam column karena sama" punya atribut height yang memakan space disepanjang layar, maka dari itu harus dibungkus ke container/sized box untuk ditambahkan height (list view tidak punya height)
                  // def nya, scroll listview adalah vertikal, untuk mengubah menjadi horizontal tambahkan scroll direction
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'
                        ), 
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'
                        ), 
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
                        ),
                      ),
                    ),
                  ],
                ), 
              ),
            ],
          ),
        )
      )
    );
  }
}
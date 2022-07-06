import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';

import 'detail_screen.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Bandung')
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          final TourismPlace place = tourismPlaceList[index];

          return InkWell(
            onTap: (){
              Navigator.push(context, PageRouteBuilder(
                // transitionDuration: const Duration(seconds: 1),
                // reverseTransitionDuration: const Duration(seconds: 1),
                pageBuilder: (_, __, ___) => DetailScreen(place)
              ));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Hero(
                      tag: 'animate-${place.imageAsset}',
                      child: Image.asset(place.imageAsset)
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            place.name,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(place.location)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      )
    );
  }
}
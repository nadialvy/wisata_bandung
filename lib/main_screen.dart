import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wisata_bandung/model/tourism_place.dart';

import 'detail_screen.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata Bandung . Size: ${MediaQuery.of(context).size.width}')
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          if (constraints.maxWidth<= 600){
            return const TourismPlaceList();
          }else if(constraints.maxWidth <= 900){
            return TourismPlaceGrid(gridCount: 4);
          } else {
            return TourismPlaceGrid(gridCount: 6);
          }
        },
    ));
  }
}

class TourismPlaceList extends StatelessWidget{
  const TourismPlaceList({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return ListView.builder(
        itemBuilder: (context, index){
          final TourismPlace place = tourismPlaceList[index];

          return InkWell(
            onTap: (){
              Navigator.push(context, PageRouteBuilder(
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
      );
  }
}

class TourismPlaceGrid extends StatelessWidget{
  final int gridCount;

  TourismPlaceGrid({required this.gridCount});

  @override 
  Widget build(BuildContext context){
    return Scrollbar(
      thumbVisibility: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          //        ambil langsung dari file tourism_dart
          children: tourismPlaceList.map((place){
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailScreen(place);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Image.asset(
                          place.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        place.name,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    // SizedBox(height: -10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 8),
                      child: Text(
                        place.location,
                        style: const TextStyle(
                          fontSize: 10
                        ),
                      ),
                    )
                  ],
                )
              ),
            );
          }).toList()
        ),
      ),
    );
  }
}

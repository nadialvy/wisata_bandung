import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';
import 'dart:io';

class DetailScreen extends StatelessWidget{
  final TourismPlace place;
  DetailScreen(this.place);

  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        if (constraints.maxWidth > 800){
          return DetailWebPage(place: place);
        }else {
          return DetailMobilePage(place);
        }
      })
    ;
  }
}

class DetailMobilePage extends StatelessWidget{
  final TourismPlace place;
  DetailMobilePage(this.place);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(
              onPressed: () { 
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            );
          },
        ),
        actions: const [
          FavoriteButton()
        ]
      ),
      body: SingleChildScrollView( //supaya bisa discroll
        child: Column (
        crossAxisAlignment: CrossAxisAlignment.stretch, //memaksimalkan lebar column
        children: <Widget>[
          Hero(
            tag: 'animate-${place.imageAsset}',
            child: Image.asset(place.imageAsset)
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Text(
              place.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
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
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 200,
                          minWidth: 100,
                        ),
                        child: Text(
                          place.openDays,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
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
                      child: Text(
                        place.openTime,
                        style: const TextStyle(
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
                      child: Text(
                        place.ticketPrice,
                        style: const TextStyle(
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
            child: Text(
              place.description,
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: place.imageUrls.map((urlImage){
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: Image.network(urlImage),
                  )
                );
              }).toList(),
            ),
          ),
        ],
      ),
      )
    );
  }
}

class DetailWebPage extends StatelessWidget{
  final TourismPlace place;
  DetailWebPage({required this.place});
  

  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Text(
                  'WISATA BANDUNG',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            place.imageAsset
                          ),
                        ),
                        Container(
                          height: 150,
                          margin: const EdgeInsets.all(8),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: place.imageUrls.map((urlImage){
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(3.0),
                                  child: Image.network(urlImage),
                                )
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Flexible(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              place.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_today),
                                        Container(
                                          margin: const EdgeInsets.only(left: 10),
                                          child: Text(place.openDays)
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.access_time),
                                        Container(
                                          margin: const EdgeInsets.only(left: 10),
                                          child: Text(place.openTime)
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.monetization_on),
                                        Container(
                                          margin: const EdgeInsets.only(left: 10),
                                          child: Text(place.openDays)
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    FavoriteButton()
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              place.description,
                              textAlign: TextAlign.justify,
                            )
                          ],
                        ),
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget{
  const FavoriteButton({Key? key}) : super(key: key);

  @override 
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override 
  Widget build(BuildContext context){
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: (){
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}


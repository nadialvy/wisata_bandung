import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';


class DetailScreen extends StatelessWidget{
  final TourismPlace place;
  DetailScreen(this.place);

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
              padding: const EdgeInsets.all(10),
              shape: const CircleBorder(),
              fillColor: Color.fromARGB(75, 158, 158, 158),
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
          Image.asset(place.imageAsset),
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
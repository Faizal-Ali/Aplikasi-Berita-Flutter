// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, unused_import, unrelated_type_equality_checks

import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoDetailBerita {
  final String link;
  final String title;
  final String author;
  final String desc;
  final String published;
  final String content;

  const MoDetailBerita(this.link, this.title, this.author, this.desc, this.published, this.content);
}

void main() {
  // runApp(MyApp());
  runApp(MaterialApp(
   home: MyApp(),
 ));
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CarouselController _controller = CarouselController();
  Future getHeadlines() async {
    var keyApi = "fdd0c78b51684898aa426d9477eb459e";

    // headline
    var dataJsonHeadline = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=id&apiKey=$keyApi"));
    var dataHeadline = jsonDecode(dataJsonHeadline.body)['articles'] as List;

    // sports
    var dataJsonSports = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=sports&apiKey=$keyApi"));
    var dataSports = jsonDecode(dataJsonSports.body)['articles'] as List;

    // wars
    var dataJsonWars = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=wars&apiKey=$keyApi"));
    var dataWars = jsonDecode(dataJsonWars.body)['articles'] as List;

    // politics
    var dataJsonPolitics = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=politics&apiKey=$keyApi"));
    var dataPolitics = jsonDecode(dataJsonPolitics.body)['articles'] as List;

    // movie
    var dataJsonMovie = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=movies&apiKey=$keyApi"));
    var dataMovie = jsonDecode(dataJsonMovie.body)['articles'] as List;

    // return data.map((i) => Text(i['title'])).toList();
    var headerSlide =  dataHeadline
        .map((i) => 
        InkWell( child:
            Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.blue,
                          width: double.infinity,
                        ),
                        (i['urlToImage'] != null
                            ? Image.network(i['urlToImage'].toString(),
                                fit: BoxFit.cover, width: 1000.0)
                            : FlutterLogo()),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: const [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${i['title']} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),onTap: () { 
                var link = i['url'].toString();
                var title = i['title'].toString();
                var author = i['author'].toString();
                var desc = i['desc'].toString();
                var urlToImage = i['urlToImage'].toString();
                var published = i['published'].toString();
                var content = i['content'];

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailBerita(link: link, title: title, author: author, desc: desc, published: published, content: content,urlToImage:urlToImage),
                  ),
                );
            },),
            ).toList();
    //
    // 
    var sport = dataSports
        .map((i) => 
        InkWell( child:
            Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.blue,
                          width: double.infinity,
                        ),
                        (i['urlToImage'] != null
                            ? Image.network(i['urlToImage'].toString(),
                                fit: BoxFit.cover, width: 1000.0)
                            : FlutterLogo()),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: const [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${i['title']} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),onTap: () { 
                var link = i['url'].toString();
                var title = i['title'].toString();
                var author = i['author'].toString();
                var desc = i['desc'].toString();
                var urlToImage = i['urlToImage'].toString();
                var published = i['published'].toString();
                var content = i['content'];

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailBerita(link: link, title: title, author: author, desc: desc, published: published, content: content,urlToImage:urlToImage),
                  ),
                );
            },),
            ).toList();
    //
    var war = dataWars
        .map((i) => 
        InkWell( child:
            Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.blue,
                          width: double.infinity,
                        ),
                        (i['urlToImage'] != null
                            ? Image.network(i['urlToImage'].toString(),
                                fit: BoxFit.cover, width: 1000.0)
                            : FlutterLogo()),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: const [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${i['title']} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),onTap: () { 
                var link = i['url'].toString();
                var title = i['title'].toString();
                var author = i['author'].toString();
                var desc = i['desc'].toString();
                var urlToImage = i['urlToImage'].toString();
                var published = i['published'].toString();
                var content = i['content'];

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailBerita(link: link, title: title, author: author, desc: desc, published: published, content: content,urlToImage:urlToImage),
                  ),
                );
            },),
            ).toList(); 
    // 
    var politic = dataPolitics
        .map((i) => 
        InkWell( child:
            Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.blue,
                          width: double.infinity,
                        ),
                        (i['urlToImage'] != null
                            ? Image.network(i['urlToImage'].toString(),
                                fit: BoxFit.cover, width: 1000.0)
                            : FlutterLogo()),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: const [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${i['title']} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),onTap: () { 
                var link = i['url'].toString();
                var title = i['title'].toString();
                var author = i['author'].toString();
                var desc = i['desc'].toString();
                var urlToImage = i['urlToImage'].toString();
                var published = i['published'].toString();
                var content = i['content'];

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailBerita(link: link, title: title, author: author, desc: desc, published: published, content: content,urlToImage:urlToImage),
                  ),
                );
            },),
            ).toList(); 
    // 
    var movie = dataMovie
        .map((i) => 
        InkWell( child:
            Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.blue,
                          width: double.infinity,
                        ),
                        (i['urlToImage'] != null
                            ? Image.network(i['urlToImage'].toString(),
                                fit: BoxFit.cover, width: 1000.0)
                            : FlutterLogo()),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: const [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${i['title']} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),onTap: () { 
                var link = i['url'].toString();
                var title = i['title'].toString();
                var author = i['author'].toString();
                var desc = i['desc'].toString();
                var urlToImage = i['urlToImage'].toString();
                var published = i['published'].toString();
                var content = i['content'];

print(urlToImage);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailBerita(link: link, title: title, author: author, desc: desc, published: published, content: content,urlToImage:urlToImage),
                  ),
                );
            },),
            ).toList(); 
    // 
      return [headerSlide,sport,war,politic,movie];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Berita2'),
      ),
      body: FutureBuilder(
        //method to be waiting for in the future
        future: getHeadlines(),
        builder: (contx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var list = snapshot.data;
            var header = list[0];
            var sport = list[1];
            var war = list[2];
            var politic = list[3];
            var movie = list[4];
            return ListView(
            children: [
              Expanded(
                    child: CarouselSlider(
                  items: header,
                  carouselController: _controller,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                  ),
                )),
                Container(
                  padding:
                      EdgeInsets.all(20),
                  margin: EdgeInsets.all(5),
                  child: Text(
                    "Sports",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: CarouselSlider(
                  items: sport,
                  carouselController: _controller,
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                  ),
                )),
                Container(
                  padding:
                      EdgeInsets.all(20),
                  margin: EdgeInsets.all(5),
                  child: Text(
                    "Wars",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: CarouselSlider(
                  items: war,
                  carouselController: _controller,
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                  ),
                )),
                Container(
                  padding:
                      EdgeInsets.all(20),
                  margin: EdgeInsets.all(5),
                  child: Text(
                    "Politics",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: CarouselSlider(
                  items: politic,
                  carouselController: _controller,
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                  ),
                )),
                Container(
                  padding:
                      EdgeInsets.all(20),
                  margin: EdgeInsets.all(5),
                  child: Text(
                    "Movies",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: CarouselSlider(
                  items: movie,
                  carouselController: _controller,
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                  ),
                )),
            ]
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }
}

class DetailBerita extends StatelessWidget {

  const DetailBerita({super.key, required this.link, required this.title, required this.author, required this.desc, required this.published, required this.content, required this.urlToImage});
  final String link;
  final String title;
  final String urlToImage;
  final String author;
  final String desc;
  final String published;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita2'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10.0),
        child: ListView(children: [
          Text(title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          (urlToImage != null
                            ? Image.network(urlToImage,
                                fit: BoxFit.cover, width: 1000.0)
                            : FlutterLogo()),
          Text("$author -$published",style: TextStyle(
            fontSize: 10
          ),),
          Text(content)
        ]),
      )
    );
  }
}
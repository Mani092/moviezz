import 'package:flutter/material.dart';
import 'package:movie_app/list/toprated.dart';
import 'package:movie_app/modified_text.dart';
import 'package:movie_app/list/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'list/tv.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
      home:Home(),
    );
  }
}

class Home extends StatefulWidget {


 const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies=[];
  List toRatedMovies=[];
  List tv=[];
  final String apiKey='4ea6bad41e914aac7366acde3c27d2b6';
  final readaccesstoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZWE2YmFkNDFlOTE0YWFjNzM2NmFjZGUzYzI3ZDJiNiIsInN1YiI6IjY0ZGU1MDQzYTNiNWU2MDBhY2MyYWFkNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.COjDcMyPHZ5NCqTMB88Wld7VX4Hcw9pxoFiLYWDNAos';

  @override
  void initState(){
    loadMovies();
    super.initState();
  }

  loadMovies()async{
    TMDB tmdbLogs=TMDB(ApiKeys(apiKey,readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    )
    );
    Map trendingresult=await tmdbLogs.v3.trending.getTrending();
    Map toRatedresult=await tmdbLogs.v3.movies.getTopRated();
    Map tvresult=await tmdbLogs.v3.tv.getPopular();
    setState(() {
      trendingMovies= trendingresult['results'];
      toRatedMovies=toRatedresult['results'];
      tv=tvresult['results'];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Center(
          child: ModifyText(
            text: "Movie App",
          size: 25,),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            TV(tv: tv,),
            TrendingMovies(trending: trendingMovies,),
            TopRated(toprated: toRatedMovies),
          ],
        ),
      ),
    );
  }
}



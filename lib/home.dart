import 'package:flutter/material.dart';
import 'package:movies_app/util/text.dart';
import 'package:movies_app/widgets/toprated.dart';
import 'package:movies_app/widgets/trending.dart';
import 'package:movies_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  final apiKey = 'ec9296fde9f4d9725f8ce2fca40dd23f';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzkyOTZmZGU5ZjRkOTcyNWY4Y2UyZmNhNDBkZDIzZiIsInN1YiI6IjY0ZDlhOGRjY2M5NjgzMDBjN2Q5M2Y0NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nv8dg-l0ToRcmerDsrqAoTHBV_Jc7GwiJ9acfJnoDFA';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showErrorLogs: true, showLogs: true));
    Map tredingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = tredingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ModifiedText(
            text: 'MoviesFlix', color: Colors.white, size: 26),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingMovies),
          TopRatedMovies(topRated: topRatedMovies),
          TvShows(trending: tv),
        ],
      ),
    );
  }
}

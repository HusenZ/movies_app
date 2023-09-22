import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/util/text.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({Key? key, required this.topRated}) : super(key: key);
  final List<dynamic> topRated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Top Rated Movies',
            color: Colors.white,
            size: 26,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: 'https://image.tmdb.org/t/p/w500' +
                            topRated[index]['poster_path'],
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        imageBuilder: (context, ImageProvider) {
                          return Container(
                            height: 180,
                            width: 130,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ImageProvider, fit: BoxFit.fill),
                            ),
                          );
                        },
                      ),
                      Container(
                        child: ModifiedText(
                          text: topRated[index]['title'] ?? 'loading...',
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

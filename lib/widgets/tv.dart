import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/util/text.dart';

class TvShows extends StatelessWidget {
  const TvShows({Key? key, required this.trending}) : super(key: key);
  final List<dynamic> trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'TV shows',
            color: Colors.white,
            size: 26,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        // ignore: prefer_interpolation_to_compose_strings
                        imageUrl: 'https://image.tmdb.org/t/p/w500' +
                            trending[index]['poster_path'],
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
                            alignment: Alignment.bottomLeft,
                            child: ModifiedText(
                              text:
                                  trending[index]['original_name'] ?? 'loading',
                              color: Colors.white,
                              size: 16,
                            ),
                          );
                        },
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

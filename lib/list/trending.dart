import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/modified_text.dart';

class TrendingMovies extends StatelessWidget {

  final List trending;
  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return  Container(
      // padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifyText(
            text: 'Trending Movies',
            size: 25,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 290,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Description(
                        name: trending[index]['title'],
                        bannerUrl:
                        'https://image.tmdb.org/t/p/w500' +
                            trending[index]['backdrop_path'],
                        posterUrl:
                        'https://image.tmdb.org/t/p/w500' +
                            trending[index]['poster_path'],
                        desc: trending[index]['overview'],
                        vote: trending[index]['vote_average']
                            .toString(),
                        launchOn: trending[index]
                        ['release_date'],
                      )));
                    },
                    child:trending[index]['title']!=null? Container(
                      width: 120,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                                  )
                              )
                            ),
                          ),
                          Container(
                            child: ModifyText(
                              text: trending[index]['title']!=null ?
                              trending[index]['title']:'Loading',
                            ),
                          )
                        ],
                      ),
                    ):Container(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

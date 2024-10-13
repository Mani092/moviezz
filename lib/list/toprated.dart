import 'package:flutter/material.dart';
import 'package:movie_app/modified_text.dart';

import '../description.dart';

class TopRated extends StatelessWidget {

  final List toprated;
  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return  Container(
      // padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifyText(
            text: 'Top Rated Movies',
            size: 25,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 290,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Description(
                        name: toprated[index]['title'],
                        bannerUrl:
                        'https://image.tmdb.org/t/p/w500' +
                            toprated[index]['backdrop_path'],
                        posterUrl:
                        'https://image.tmdb.org/t/p/w500' +
                            toprated[index]['poster_path'],
                        desc: toprated[index]['overview'],
                        vote: toprated[index]['vote_average']
                            .toString(),
                        launchOn: toprated[index]
                        ['release_date'],
                      )));
                    },
                    child:toprated[index]['title']!=null ?Container(
                      width: 120,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                                    )
                                )
                            ),
                          ),
                          Container(
                            child: ModifyText(
                              text: toprated[index]['title']!=null ?
                              toprated[index]['title']:'Loading',
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

import 'package:flutter/material.dart';
import 'package:movie_app/modified_text.dart';

import '../description.dart';

class TV extends StatelessWidget {

  final List tv;
  const TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return  Container(
      // padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifyText(
            text: 'Popular Tv Shows',
            size: 25,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Description(
                        name: tv[index]['original_name'],
                        bannerUrl:
                        'https://image.tmdb.org/t/p/w500' +
                            tv[index]['backdrop_path'],
                        posterUrl:
                        'https://image.tmdb.org/t/p/w500' +
                            tv[index]['poster_path'],
                        desc: tv[index]['overview'],
                        vote: tv[index]['vote_average']
                            .toString(),
                        launchOn: tv[index]
                        ['first_air_date'],
                      )));
                    },
                    child:  tv[index]['original_name']!=null?Container(
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path']
                                    ),
                                  fit: BoxFit.cover
                                )
                            ),
                          ),
                          Container(
                            child: ModifyText(
                              text: tv[index]['original_name']!=null ?
                              tv[index]['original_name']:'Loading',
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

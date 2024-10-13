import 'package:flutter/material.dart';
import 'package:movie_app/modified_text.dart';

class Description extends StatelessWidget {
  final String? name;
  final String desc;
  final String bannerUrl;
  final String posterUrl;
  final String vote;
  final String launchOn;
  const Description({super.key, required this.name, required this.desc, required this.bannerUrl, required this.posterUrl, required this.vote, required this.launchOn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerUrl,fit: BoxFit.cover,),

                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: ModifyText(
                      text: '  ⭐ Average Rating:'+ vote+' / 10' ,
                      size: 18,
                    ),
                  ),
                  Positioned(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    top: 10,
                    left: 10,
                  ),
                ],
              ),
            ) ,
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifyText(
                text: name!=null?name:'Not Loaded',
                size: 24,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifyText(
                text: 'Releasing on: '+launchOn,
                size: 14,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 130,
                  child: Image.network(posterUrl),
                ),
                Flexible(
                  child: Container(
                    child: ModifyText(
                      text: desc,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

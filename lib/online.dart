import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'variables.dart' as vary;

class Online extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Cardd(vary.image1, vary.link1, vary.name1),
            Cardd(vary.image2, vary.link2, vary.name2),
            Cardd(vary.image3, vary.link3, vary.name3),
          ],
        ),
      ],
    );
  }
}

class Cardd extends StatelessWidget {
  String img;
  String link;
  String name;
  Cardd(this.img, this.link, this.name);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launch(link),
      child: Container(
        margin: EdgeInsets.all(10),
        //width: double.infinity,
        //height: double.infinity,
        child: Column(
          children: [
            Card(
              elevation: 10,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset(
                    img,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 5, 8, 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LikeButton(
                            mainAxisAlignment: MainAxisAlignment.start,
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                Icons.favorite,
                                color: isLiked
                                    ? Colors.deepPurpleAccent
                                    : Colors.grey,
                                //size: buttonSize,
                              );
                            },
                          ),
                          SizedBox(width: 70),
                          Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.pink,
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

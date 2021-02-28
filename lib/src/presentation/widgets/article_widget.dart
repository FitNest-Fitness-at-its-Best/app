import 'package:fitnest/src/utils/global_themes.dart';
import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';

import '../../data/models/article.dart';
import '../../services/url_launcher/launcher.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  const ArticleWidget({
    Key key,
    @required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius5,
      ),
      color: accentColor,
      margin: EdgeInsets.all(8),
      child: InkWell(
        borderRadius: borderRadius5,
        onTap: () => launchURL(context, article.link),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (article.img != null)
              // Image.network(
              //   article.img,
              // ),
              // SelectableText(),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: ProgressiveImage(
                  placeholder: NetworkImage(article.img.replaceFirst(
                    RegExp(r'/max/[0-9]{0,4}/'),
                    '/max/100/',
                  )),
                  // size: 1.87KB
                  thumbnail: NetworkImage(article.img.replaceFirst(
                    RegExp(r'/max/[0-9]{0,4}/'),
                    '/max/300/',
                  )),
                  // size: 1.29MB
                  image: NetworkImage(article.img.replaceFirst(
                    RegExp(r'/max/[0-9]{0,4}/'),
                    '/max/1920/',
                  )),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: ListTile(
                title: Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("${article.author}, ${article.pubDate.substring(0, 16)}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

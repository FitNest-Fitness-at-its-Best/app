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
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () => launchURL(context, article.link),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (article.img != null)
                // Image.network(
                //   article.img,
                // ),
                // SelectableText(),
                ProgressiveImage(
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
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(article.author),
                contentPadding: EdgeInsets.zero,
                subtitle: Text(article.pubDate.substring(0, 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

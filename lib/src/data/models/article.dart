import 'dart:convert';

List<Article> articleFromJson(String str) =>
    List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

String articleToJson(List<Article> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Article {
  Article({
    this.id,
    this.title,
    this.link,
    this.pubDate,
    this.author,
    this.img,
  });

  String id;
  String title;
  String link;
  String pubDate;
  String author;
  String img;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        link: json["link"],
        pubDate: json["pub_date"],
        author: json["author"],
        img: json["img"] == null ? null : json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "link": link,
        "pub_date": pubDate,
        "author": author,
        "img": img == null ? null : img,
      };
}

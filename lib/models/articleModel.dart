class ArticleModel {
  late Source source;
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  ArticleModel(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    author = json['author'] == null ? "Shashank" : json['author'];
    title = json['title'] == null ? "No Title" : json['title'];
    description =
        json['description'] == null ? "No Description" : json['description'];
    url = json['url'] == null ? "No Url" : json['url'];
    urlToImage =
        json['urlToImage'] == null ? "No UrlToImage" : json['urlToImage'];
    publishedAt =
        json['publishedAt'] == null ? "No PublishedAt" : json['publishedAt'];
    content = json['content'] == null ? "No Content" : json['content'];

    // print(json['source'] != null);
    print("author: $author");
    // print(title);
    // print(description);

    if (json['source'] != null) {
      //print("he");
      source = Source.fromJson(json['source']);
      //print(123232);
    } else {
      source = Source(id: "1", name: "NPR");
    }
    //source = (json['source'] != null ? Source.fromJson(json['source']) : null)!;
    //print(1222);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class Source {
  late String id;
  late String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    //print("1");
    final id = json['id'] == null ? "1" : json['id'];
    final name = json['name'];
    //print(name);
    return (Source(id: id, name: name));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    print("data[id] ${data['id']}");
    data['id'] = this.id;
    data['name'] = this.name;
    print("Data");
    return data;
  }
}










// class ArticleModel {
//   late Source source;
//   late String author;
//   late String title;
//   late String description;
//   late String url;
//   late String urlToImage;
//   late String publishedAt;
//   late String content;

//   ArticleModel(
//       {required this.source,
//       required this.author,
//       required this.title,
//       required this.description,
//       required this.url,
//       required this.urlToImage,
//       required this.publishedAt,
//       required this.content});

//   ArticleModel.fromJson(Map<String, dynamic> json) {
//     source =
//         (json['source'] != null ? new Source.fromJson(json['source']) : null)!;
//     author = json['author'];
//     title = json['title'];
//     description = json['description'];
//     url = json['url'];
//     urlToImage = json['urlToImage'];
//     publishedAt = json['publishedAt'];
//     content = json['content'];
    
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.source != null) {
//       data['source'] = this.source.toJson();
//     }
//     data['author'] = this.author;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['url'] = this.url;
//     data['urlToImage'] = this.urlToImage;
//     data['publishedAt'] = this.publishedAt;
//     data['content'] = this.content;
//     return data;
//   }
// }

// class Source {
//   late String id;
//   late String name;

//   Source({required this.id, required this.name});

//   Source.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

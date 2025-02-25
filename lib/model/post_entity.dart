import 'package:intl/intl.dart';

class PostEntity {
  String modifiedGmt = '';
  PostEmbedded extra = PostEmbedded(author: [], categories: [], image: []);
  String link = '';
  int id = 0;
  String title  = '';
  String content = '';

  /// featured image getter with checks for no image
  String get image =>  extra?.image != null ? extra.image[0]?.sourceUrl ?? '' : '';

  String get category => extra?.categories != null ? extra.categories[0]?.name ?? '' : '';

  String get date => DateFormat('MMM. dd - h:mm a').format(DateTime.parse(this.modifiedGmt)).toString();

  bool isDetailCard = false;

  PostEntity({required this.modifiedGmt, required this.extra, required this.link, required this.id, required this.title, required this.content});

  PostEntity.fromJson(Map<String, dynamic> json) {
    modifiedGmt = json['modified_gmt'];
    extra = (json['_embedded'] != null ? new PostEmbedded.fromJson(json['_embedded']) : null)!;
    link = json['link'];
    id = json['id'];
    title = json['title'] != null ? json['title']['rendered'] : null;
    content = json['content'] != null ? json['content']['rendered'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modified_gmt'] = this.modifiedGmt;
    if (this.extra != null) {
      data['_embedded'] = this.extra.toJson();
    }
    data['link'] = this.link;
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}

class PostEmbedded {
  List<PostEmbeddedAuthor> author = [];
  List<PostCategory> categories = [];
  List<FeaturedImage> image = [];

  PostEmbedded({required this.author, required this.categories, required this.image});

  PostEmbedded.fromJson(Map<String, dynamic> json) {
    if (json['author'] != null) {
      author = [];
      (json['author'] as List).forEach((v) {
        author.add(new PostEmbeddedAuthor.fromJson(v));
      });
    }
    if (json['wp:term'] != null) {
      categories = [];
      (json['wp:term'][0] as List).forEach((v) {
        categories.add(new PostCategory.fromJson(v));
      });
    }
    if (json['wp:featuredmedia'] != null) {
      image = [];
      (json['wp:featuredmedia'] as List).forEach((v) {
        image.add(new FeaturedImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.author != null) {
      data['author'] = this.author.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['wp:term'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.image != null) {
      data['wp:featuredmedia'] = this.image.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostEmbeddedAuthor {
  String avatar = '';
  String name = '';
  String link = '';
  int id = 0;

  PostEmbeddedAuthor({required this.avatar, required this.name, required this.link, required this.id});

  PostEmbeddedAuthor.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar_urls'] != null ? json['avatar_urls']['96'] : null;
    name = json['name'];
    link = json['link'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avatar != null) {
      data['avatar_urls']['96'] = this.avatar;
    }
    data['name'] = this.name;
    data['link'] = this.link;
    data['id'] = this.id;
    return data;
  }
}

class PostCategory {
   String name = '';
   int id = 0;

  PostCategory({required this.name, required this.id});

  PostCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class FeaturedImage {
  String file = '';
  String mimeType = '';
  int width = 0;
  String sourceUrl = "";
  int height = 0;

  FeaturedImage({required this.file, required this.mimeType, required this.width, required this.sourceUrl, required this.height});

  FeaturedImage.fromJson(Map<String, dynamic> json) {
    if (json['media_details'] == null) return;

    json = json['media_details']['sizes']['full'];

    file = json['file'];
    mimeType = json['mime_type'];
    width = json['width'];
    sourceUrl = json['source_url'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['mime_type'] = this.mimeType;
    data['width'] = this.width;
    data['source_url'] = this.sourceUrl;
    data['height'] = this.height;
    return data;
  }
}

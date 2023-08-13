// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Feed {
  const Feed({
    required this.url,
    required this.title,
    required this.author,
    required this.description,
    required this.link,
    required this.section,
  });
  final String url;
  final String title;
  final String author;
  final String description;
  final String link;
  final String section;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'title': title,
      'author': author,
      'description': description,
      'link': link,
      'section': section,
    };
  }

  factory Feed.fromMap(Map<String, dynamic> map) {
    return Feed(
      url: map['url'] as String,
      title: map['title'] as String,
      author: map['author'] as String,
      description: map['description'] as String,
      link: map['link'] as String,
      section: map['section'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Feed.fromJson(String source) =>
      Feed.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Feed other) {
    /// Allows testing by comparing two instances of the model class

    if (identical(this, other)) return true;

    return other.url == url &&
        other.title == title &&
        other.author == author &&
        other.description == description &&
        other.link == link &&
        other.section == section;
  }

  @override
  int get hashCode {
    return url.hashCode ^
        title.hashCode ^
        author.hashCode ^
        description.hashCode ^
        link.hashCode ^
        section.hashCode;
  }
}

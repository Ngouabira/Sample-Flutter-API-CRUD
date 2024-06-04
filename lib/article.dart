class Article {
  int _id;
  String _title, _description;

  Article(this._id, this._title, this._description);

  int get id => _id;
  String get title => _title;
  String get description => _description;

  set id(int id) {
    _id = id;
  }

  set title(String title) {
    _title = title;
  }

  set description(String description) {
    _description = description;
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      json["id"],
      json["title"],
      json["description"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": _id,
      "title": _title,
      "description": _description,
    };
  }

  static List<Article> toList(json) {
    return json.map((data) => Article.fromJson(data)).toList();
  }
}

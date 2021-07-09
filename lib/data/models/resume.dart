class Resume {
  String name;
  String url;

  Resume({
    required this.name,
    required this.url,
  });

  static Resume fromMap(Map<String, dynamic> map) {
    return Resume(
      name: map['name'],
      url: map['url'],
    );
  }
}

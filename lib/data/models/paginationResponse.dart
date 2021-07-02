class PaginationResponse {
  int count;
  String next;
  String? previous;
  dynamic results;

  PaginationResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  static PaginationResponse fromMap(Map<String, dynamic> map) {
    return PaginationResponse(
      count: map['count'],
      next: map['next'],
      previous: map['previous'],
      results: map['results'],
    );
  }
}

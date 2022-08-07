class Response {
  String winning_restaurant;
  bool found;
  Response(this.winning_restaurant, this.found);

  factory Response.fromJson(dynamic json) {
    return Response(json['winning_restaurant'] as String, json['found'] as bool);
  }
  @override
  String toString() {
    return '{ ${this.winning_restaurant}, ${this.found} }';
  }
}
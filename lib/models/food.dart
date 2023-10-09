// ignore_for_file: public_member_api_docs, sort_constructors_first
class Food {
  String name;
  String price;
  String imagePath;
  String rating;
  String description;

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.description,
  });

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
  String get _description => description;
}

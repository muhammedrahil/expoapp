class book{
  String type;
  String name;
  String publisher;
  DateTime date;
  String imgUrl;
  num score;
  num rating;
  String review;
  num height;

  book(
    this.type,
    this.name,
    this.publisher,
    this.date,
    this.imgUrl,
    this.score,
    this.rating,
    this.review,
    this.height
  );
  static List<book> generateBooks(){
    return [
      book('type', 'name', 'publisher', DateTime(2019,3,23), 'assets/b.jpg', 10, 29, 'review', 30)
    ];
  }
}
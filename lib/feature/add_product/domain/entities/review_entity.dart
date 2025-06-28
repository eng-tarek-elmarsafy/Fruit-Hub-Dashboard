class ReviewEntity {
  ReviewEntity({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });

  final String name;
  final String imageUrl;
  final num rating;
  final String date;
  final String reviewDescription;
}

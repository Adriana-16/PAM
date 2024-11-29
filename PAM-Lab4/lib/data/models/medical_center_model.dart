import '../../domain/entities/medical_center.dart';

class MedicalCenterModel extends MedicalCenter {
  MedicalCenterModel({
    required String image,
    required String title,
    required String locationName,
    required double reviewRate,
    required int countReviews,
    required double distanceKm,
    required int distanceMinutes,
  }) : super(
    image: image,
    title: title,
    locationName: locationName,
    reviewRate: reviewRate,
    countReviews: countReviews,
    distanceKm: distanceKm,
    distanceMinutes: distanceMinutes,
  );

  factory MedicalCenterModel.fromJson(Map<String, dynamic> json) {
    return MedicalCenterModel(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      locationName: json['location_name'] ?? '',
      reviewRate: (json['review_rate'] as num).toDouble(),
      countReviews: json['count_reviews'] ?? 0,
      distanceKm: (json['distance_km'] as num).toDouble(),
      distanceMinutes: json['distance_minutes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'location_name': locationName,
      'review_rate': reviewRate,
      'count_reviews': countReviews,
      'distance_km': distanceKm,
      'distance_minutes': distanceMinutes,
    };
  }
}

import '../../../domain/entities/doctor.dart';

class DoctorModel extends Doctor {
  DoctorModel({
    required String image,
    required String fullName,
    required String typeOfDoctor,
    required String locationOfCenter,
    required double reviewRate,
    required int reviewsCount,
  }) : super(
    image: image,
    fullName: fullName,
    typeOfDoctor: typeOfDoctor,
    locationOfCenter: locationOfCenter,
    reviewRate: reviewRate,
    reviewsCount: reviewsCount,
  );

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      image: json['image'] ?? '',
      fullName: json['full_name'] ?? '',
      typeOfDoctor: json['type_of_doctor'] ?? '',
      locationOfCenter: json['location_of_center'] ?? '',
      reviewRate: (json['review_rate'] as num).toDouble(),
      reviewsCount: json['reviews_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'full_name': fullName,
      'type_of_doctor': typeOfDoctor,
      'location_of_center': locationOfCenter,
      'review_rate': reviewRate,
      'reviews_count': reviewsCount,
    };
  }
}

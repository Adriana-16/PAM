import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/doctor_model.dart';
import '../models/medical_center_model.dart';

class DataService {
  static const String _jsonFilePath = 'assets/v1.json';

  Future<Map<String, dynamic>> _loadJsonData() async {
    try {
      final String response = await rootBundle.loadString(_jsonFilePath);
      return json.decode(response) as Map<String, dynamic>;
    } catch (e) {
      print('Error loading JSON data from $_jsonFilePath: $e');
      throw Exception('Failed to load JSON data');
    }
  }

  Future<List<BannerModel>> loadBanners() async {
    final data = await _loadJsonData();
    final banners = data['banners'];
    if (banners != null && banners is List) {
      return banners
          .map((i) => BannerModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Banners data not found or invalid format');
    }
  }

  Future<List<CategoryModel>> loadCategories() async {
    final data = await _loadJsonData();
    final categories = data['categories'];
    if (categories != null && categories is List) {
      return categories
          .map((i) => CategoryModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Categories data not found or invalid format');
    }
  }

  Future<List<MedicalCenterModel>> loadNearbyCenters() async {
    final data = await _loadJsonData();
    if (data['nearby_centers'] != null) {
      return (data['nearby_centers'] as List)
          .map((i) => MedicalCenterModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Nearby Centers data not found or invalid format');
    }
  }

  Future<List<DoctorModel>> loadDoctors() async {
    final data = await _loadJsonData();
    final doctors = data['doctors'];
    if (doctors != null && doctors is List) {
      return doctors
          .map((i) => DoctorModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Doctors data not found or invalid format');
    }
  }
}

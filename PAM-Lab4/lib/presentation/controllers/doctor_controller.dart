import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/models/doctor_model.dart';

class DoctorController extends GetxController {
  var doctors = <DoctorModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  void fetchDoctors() async {
    try {
      final String response = await rootBundle.loadString('assets/v1.json');
      final data = json.decode(response) as Map<String, dynamic>;
      final List<dynamic> doctorList = data['doctors'];
      doctors.assignAll(doctorList.map((json) => DoctorModel.fromJson(json)).toList());
    } catch (e) {
      print('Error fetching doctors: $e');
    }
  }
}

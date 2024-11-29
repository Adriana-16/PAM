import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/doctor_controller.dart';
import '../widgets/cards/doctor_card.dart';

class DoctorsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DoctorController doctorController = Get.find<DoctorController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Doctors',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Obx(() {
        if (doctorController.doctors.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: doctorController.doctors.length,
          itemBuilder: (context, index) {
            return DoctorCard(doctor: doctorController.doctors[index]);
          },
        );
      }),
    );
  }
}

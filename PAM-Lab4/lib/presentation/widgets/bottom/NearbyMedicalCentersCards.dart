import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/medical_center.dart';
import '../../controllers/nearby_center_controller.dart';


class NearbyMedicalCentersCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nearbyCenterController = Get.find<NearbyCenterController>();

    return Obx(() {
      if (nearbyCenterController.nearbyCenters.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return Container(
        height: 330,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: nearbyCenterController.nearbyCenters.length,
          itemBuilder: (context, index) {
            var center = nearbyCenterController.nearbyCenters[index];
            return _buildMedicalCenterCard(center);
          },
        ),
      );
    });
  }

  Widget _buildMedicalCenterCard(MedicalCenter center) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              center.image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              center.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              center.locationName,
              style: TextStyle(color: Colors.grey[600]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${center.reviewRate} ⭐'),
                Text('${center.distanceKm} km - ${center.distanceMinutes} min'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


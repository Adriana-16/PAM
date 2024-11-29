import 'package:flutter/material.dart';

import '../../../data/models/doctor_model.dart';


class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorCard({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Margini mai mari pentru spațiu
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Colțuri mai rotunjite
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0), // Padding mai mare
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imaginea pătrată a doctorului din URL
            ClipRRect(
              borderRadius: BorderRadius.circular(8), // Colțuri rotunjite pentru imagine
              child: Image.network(
                doctor.image,
                width: 90, // Dimensiune mai mare pentru imagine
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://via.placeholder.com/80', // Placeholder pentru fallback
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(width: 12), // Spațiu mai mare între imagine și text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          doctor.fullName,
                          style: const TextStyle(
                            fontSize: 18, // Font mai mare pentru nume
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis, // Trunchiere text dacă este prea lung
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.black54,
                        size: 20, // Icon mai mare
                      ),
                    ],
                  ),
                  const SizedBox(height: 6), // Spațiu mai mare între rânduri
                  Text(
                    doctor.typeOfDoctor,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.black45, size: 16),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          doctor.locationOfCenter,
                          style: const TextStyle(fontSize: 14, color: Colors.black38),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 5),
                      Text(
                        '${doctor.reviewRate}',
                        style: const TextStyle(fontSize: 14, color: Colors.black45),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${doctor.reviewsCount} Reviews',
                        style: const TextStyle(fontSize: 14, color: Colors.black38),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

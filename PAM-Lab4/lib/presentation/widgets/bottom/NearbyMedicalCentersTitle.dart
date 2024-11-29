import 'package:flutter/material.dart';

class NearbyMedicalCentersTitle extends StatelessWidget {
  final VoidCallback onSeeAll;

  NearbyMedicalCentersTitle({required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Nearby Medical Centers',
            style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: const Text(
              'See All',
              style: TextStyle(fontSize: 20, color: Colors.black38),
            ),
          ),
        ],
      ),
    );
  }
}

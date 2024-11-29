import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String selectedCity;
  final VoidCallback onTap;
  final bool isExpanded;

  LocationWidget({required this.selectedCity, required this.onTap, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          const Icon(Icons.location_on_rounded, color: Colors.black),
          const SizedBox(width: 8),
          Text(
            selectedCity,
            style: const TextStyle(fontSize: 20, color: Colors.black87),
          ),
          const SizedBox(width: 8),
          Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

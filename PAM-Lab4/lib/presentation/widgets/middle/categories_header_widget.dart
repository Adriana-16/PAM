import 'package:flutter/material.dart';

class CategoriesHeaderWidget extends StatelessWidget {
  final bool isSeeAll;
  final VoidCallback onSeeAllToggle;

  CategoriesHeaderWidget({required this.isSeeAll, required this.onSeeAllToggle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onSeeAllToggle,
            child: Text(
              isSeeAll ? 'See Less' : 'See All',
              style: const TextStyle(fontSize: 20, color: Colors.black38),
            ),
          ),
        ],
      ),
    );
  }
}

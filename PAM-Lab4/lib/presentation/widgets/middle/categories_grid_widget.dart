import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/category_controller.dart';

class CategoriesGridWidget extends StatelessWidget {
  final bool isSeeAll;
  final List<Color> categoryColors;

  CategoriesGridWidget({required this.isSeeAll, required this.categoryColors});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();

    return Obx(() {
      int itemCount = isSeeAll ? categoryController.categories.length : 4;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: SizedBox(
          height: 200, // Adjust the height as needed
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              var category = categoryController.categories[index];
              return Column(
                children: [
                  Container(
                    width: 60,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.network(
                        category.icon,
                        color: Colors.black54,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error, color: Colors.green);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category.title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    });

  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/banner_controller.dart';

class BannerWidget extends StatelessWidget {
  final BannerController bannerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Înălțimea totală pentru banner
      child: Obx(() {
        if (bannerController.filteredBanners.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: bannerController.filteredBanners.length,
          itemBuilder: (context, index) {
            var banner = bannerController.filteredBanners[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 15), // Margini între bannere
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(banner.image),
                  fit: BoxFit.cover, // Imaginea ocupă întreg containerul
                ),
              ),
              child: Stack(
                children: <Widget>[
                  // Overlay pentru efect de întunecare
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    left: 10,
                    child: Text(
                      banner.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 10,
                    child: Text(
                      banner.description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

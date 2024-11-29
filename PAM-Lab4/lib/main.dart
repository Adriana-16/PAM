import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pam_lab4/presentation/controllers/banner_controller.dart';
import 'package:pam_lab4/presentation/controllers/category_controller.dart';
import 'package:pam_lab4/presentation/controllers/doctor_controller.dart';
import 'package:pam_lab4/presentation/controllers/nearby_center_controller.dart';
import 'package:pam_lab4/presentation/pages/doctors_list_page.dart';
import 'package:pam_lab4/presentation/widgets/bottom/NearbyMedicalCentersCards.dart';
import 'package:pam_lab4/presentation/widgets/bottom/NearbyMedicalCentersTitle.dart';
import 'package:pam_lab4/presentation/widgets/cards/doctor_card.dart';
import 'package:pam_lab4/presentation/widgets/middle/categories_grid_widget.dart';
import 'package:pam_lab4/presentation/widgets/middle/categories_header_widget.dart';
import 'package:pam_lab4/presentation/widgets/top/banner_widget.dart';
import 'package:pam_lab4/presentation/widgets/top/location_widget.dart';
import 'package:pam_lab4/presentation/widgets/top/notification_widget.dart';
import 'package:pam_lab4/presentation/widgets/top/search_bar_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Inițializarea controllerelor
  Get.put(BannerController());
  Get.put(CategoryController());
  Get.put(NearbyCenterController());
  Get.put(DoctorController()); // Inițializare DoctorController

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSeeAll = true;

  final List<Color> categoryColors = [
    Color(0xFFF48FB1),
    Color(0xFFA5D6A7),
    Color(0xFFFF8A65),
    Color(0xFFB39DDB),
    Colors.teal,
    Color(0xFF4DD0E1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LocationWidget(
              selectedCity: 'Seattle, USA',
              onTap: () {
                // Logica pentru schimbarea locației
              },
              isExpanded: false,
            ),
            NotificationWidget(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(
              controller: TextEditingController(),
              onChanged: (query) {
                Get.find<BannerController>().filterBanners(query);
              },
            ),
            const SizedBox(height: 20),
            BannerWidget(),
            const SizedBox(height: 20),
            CategoriesHeaderWidget(
              isSeeAll: isSeeAll,
              onSeeAllToggle: () {
                setState(() {
                  isSeeAll = !isSeeAll;
                });
              },
            ),
            CategoriesGridWidget(
              isSeeAll: isSeeAll,
              categoryColors: categoryColors,
            ),
            const SizedBox(height: 20),

            // Nearby Medical Centers Section
            NearbyMedicalCentersTitle(
              onSeeAll: () {
                // Funcționalitate pentru See All
              },
            ),
            NearbyMedicalCentersCards(),

            const SizedBox(height: 20),

            // Doctors Section Button
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Doctors',
                    style: TextStyle(
                        fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => DoctorsListPage());
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(fontSize: 20, color: Colors.black38),
                    ),
                  ),
                ],
              ),
            ),

            // Display Total Doctors Count
            Obx(() {
              var doctorController = Get.find<DoctorController>();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total Doctors: ${doctorController.doctors.length}',
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              );
            }),

            // Doctors List Section
            Obx(() {
              var doctorController = Get.find<DoctorController>();
              if (doctorController.doctors.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: doctorController.doctors.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DoctorCard(doctor: doctorController.doctors[index]),
                  );
                },
              );
            }),

          ],
        ),
      ),
    );
  }
}

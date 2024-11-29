import 'package:get/get.dart';

import '../../data/datasource/data_service.dart';
import '../../data/models/banner_model.dart';

class BannerController extends GetxController {
  var banners = <BannerModel>[].obs;
  var filteredBanners = <BannerModel>[].obs;
  final DataService _dataService = DataService();

  @override
  void onInit() {
    super.onInit();
    loadBanners();
  }

  void loadBanners() async {
    var bannerData = await _dataService.loadBanners();
    print('Loaded banners: $bannerData'); // Verifică dacă datele sunt încărcate corect
    banners.assignAll(bannerData);
    filteredBanners.assignAll(bannerData);
  }


  void filterBanners(String query) {
    if (query.isEmpty) {
      filteredBanners.assignAll(banners);
    } else {
      var filtered = banners
          .where((banner) =>
      banner.title.toLowerCase().contains(query.toLowerCase()) ||
          banner.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
      filteredBanners.assignAll(filtered);
    }
  }
}

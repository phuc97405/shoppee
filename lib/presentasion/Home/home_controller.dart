import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:shoppee/models/utilities_model.dart';

class HomeController extends GetxController {
  RxInt currentPageSlider = 0.obs;
  List dataSlider = [
    'slide1.jpeg',
    'slide2.jpeg',
    'slide3.jpeg',
    'slide4.jpeg',
    'slide5.jpeg'
  ];

  List<UtilitiesModel> listUtilities = [
    UtilitiesModel(
        title: 'Khung Giờ Săn Sale', urlIcon: 'assets/icons/shop.svg'),
    UtilitiesModel(
        title: 'ShopperFood', urlIcon: 'assets/icons/shopping-bag.svg'),
    UtilitiesModel(
        title: 'Gì Cũng Rẻ - Từ 1K', urlIcon: 'assets/icons/shop.svg'),
    UtilitiesModel(
        title: 'Nạp Thẻ Hóa Đơn & E-voucher', urlIcon: 'assets/icons/bag.svg'),
    UtilitiesModel(title: 'Freeship', urlIcon: 'assets/icons/shop.svg'),
    UtilitiesModel(
        title: 'Ưu Đãi Thành Viên Với 50%',
        urlIcon: 'assets/icons/shopping-bag.svg'),
    UtilitiesModel(
        title: 'Deal Gần Bạn - Chỉ Từ 1K',
        urlIcon: 'assets/icons/debit-card.svg'),
    UtilitiesModel(
        title: 'Deal Gần Bạn - Chỉ Từ 1K',
        urlIcon: 'assets/icons/shopping-bag.svg'),
    UtilitiesModel(
        title: 'ShopperFood - Giao Thực Phẩm',
        urlIcon: 'assets/icons/shop.svg'),
    UtilitiesModel(
        title: 'Tech Zone - SIêu Thị Điện Tử',
        urlIcon: 'assets/icons/shop.svg'),
    UtilitiesModel(
        title: 'Hoàn Xu 15% Mỗi Ngày', urlIcon: 'assets/icons/debit-card.svg'),
    UtilitiesModel(
        title: 'Deal Gần Bạn - Chỉ Từ 1K', urlIcon: 'assets/icons/bag.svg'),
    UtilitiesModel(
        title: 'Deal Gần Bạn - Chỉ Từ 1K',
        urlIcon: 'assets/icons/shopping-bag.svg'),
  ];

  changeSlider(index) {
    currentPageSlider.value = index;
  }
}

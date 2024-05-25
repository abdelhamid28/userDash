 
import 'package:get/get.dart';
import 'package:user/app/backend/parse/tabs_parser.dart';

class BottomTabsController extends GetxController implements GetxService {
  final TabsParser parser;
  int currentIndex = 0;

  BottomTabsController({required this.parser});

  void updateIndex(int index) {
    currentIndex = index;
    update();
  }
}

import 'package:get/get.dart';
import 'package:remote_home/utils/utils.dart';

import '../models/models.dart';

List toggleStates = [];

void initController() {
  for (Appliance app in appliances) {
    toggleStates.add(app.isOn.obs);
  }
}

class HomeController extends GetxController {
  List<RxBool> toggleStates =
      List.generate(appliances.length, (index) => appliances[index].isOn.obs);
}

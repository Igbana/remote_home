import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_home/controllers/controllers.dart';
// import 'package:get/get.dart';
import 'package:remote_home/models/models.dart';
import 'package:remote_home/views/screens/screens.dart';
import 'package:remote_home/utils/utils.dart';
import 'widgets.dart';

class ApplianceCard extends StatelessWidget {
  const ApplianceCard({super.key, required this.appliance});

  final Appliance appliance;

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ApplianceScreen(appliance: appliance);
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledIcon(
                  icon: appliance.icon,
                  iconColor: Colours.blue,
                ),
                Obx(
                  () => ToggleButton(
                    state: homeController
                        .toggleStates[appliances.indexOf(appliance)].value,
                    onChanged: (val) {
                      appliance.toggle(val);
                      homeController.toggleStates[appliances.indexOf(appliance)]
                          .value = val;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: Dimensions.smallSize),
            Text(
              appliance.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "Consuming ${appliance.wattage.round()}kWh",
              style: const TextStyle(color: Colours.grey),
            ),
            const SizedBox(height: Dimensions.smallSize),
            Text(
              appliance.getRunTime(),
              style: const TextStyle(color: Colours.blue, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

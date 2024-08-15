import 'package:flutter/material.dart';
import 'package:remote_home/widgets/widgets.dart';
import 'package:remote_home/utils/utils.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.midSize),
      decoration: const BoxDecoration(color: Colours.backGround),
      child: Column(
        children: [
          const SizedBox(height: Dimensions.bigSize),
          const TopBar(),
          const SizedBox(height: Dimensions.bigSize),
          const EnergySummaryCard(),
          // DoughnutChart(),
          // SizedBox(
          //   height: 80,
          //   width: 80,
          //   child: DonutPieChart(
          //     [
          //       charts.Series<LinearSales, int>(
          //         id: 'Sales',
          //         domainFn: (LinearSales sales, _) => sales.year,
          //         measureFn: (LinearSales sales, _) => sales.sales,
          //         data: [
          //           LinearSales(1, 75),
          //           LinearSales(2, 25),
          //           LinearSales(3, 5),
          //           LinearSales(0, 100),
          //         ],
          //       )
          //     ],
          //     animate: false,
          //   ),
          // ),
          const SizedBox(height: Dimensions.bigSize),
          Flexible(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: Dimensions.smallSize,
                crossAxisSpacing: Dimensions.midSize,
                childAspectRatio: 0.9,
              ),
              children: const [
                ApplianceCard(
                  title: "Air Conditioner",
                  icon: Icons.ac_unit,
                  wattage: "10kWh",
                  duration: "2h 45min",
                ),
                ApplianceCard(
                  title: "Smart Lamp",
                  icon: Icons.light,
                  wattage: "1kWh",
                  duration: "0h 25min",
                ),
                ApplianceCard(
                  title: "TV",
                  icon: Icons.tv,
                  wattage: "3kWh",
                  duration: "1h 05min",
                ),
                AddApplianceCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

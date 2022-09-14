import 'package:coronavirus_app/Services/states_services.dart';
import 'package:coronavirus_app/View/widgets/row_widget.dart';
import 'package:coronavirus_app/resources/colormanager.dart';
import 'package:coronavirus_app/resources/routesmanager.dart';
import 'package:coronavirus_app/resources/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Modal/world_states_modal.dart';

class WorldrecordStates extends StatefulWidget {
  const WorldrecordStates({Key? key}) : super(key: key);

  @override
  State<WorldrecordStates> createState() => _WorldrecordStatesState();
}

class _WorldrecordStatesState extends State<WorldrecordStates>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    StatesServices services = StatesServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              FutureBuilder(
                  future: services.getdata(),
                  builder: (conext, AsyncSnapshot<WorldStatesModal> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                          flex: 1,
                          child: SpinKitCircle(
                            color: Colors.white,
                            size: getProportionateScreenHeight(50),
                            controller: _animationController,
                          ));
                    }
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      var covidData = snapshot.data!;
                      return Column(
                        children: [
                          PieChart(
                              chartRadius: getProportionateScreenWidth(90),
                              colorList: [
                                ColorManager.primary,
                                ColorManager.green,
                                ColorManager.error
                              ],
                              chartValuesOptions: const ChartValuesOptions(
                                  showChartValuesInPercentage: true),
                              animationDuration:
                                  const Duration(milliseconds: 1200),
                              legendOptions: const LegendOptions(
                                  legendPosition: LegendPosition.left),
                              chartType: ChartType.ring,
                              dataMap: {
                                'Total':
                                    double.parse(covidData.cases!.toString()),
                                'Recovered': double.parse(
                                    covidData.recovered!.toString()),
                                'Deaths':
                                    double.parse(covidData.deaths!.toString()),
                              }),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(25)),
                            child: Card(
                              child: Column(
                                children: [
                                  RowResuebale(
                                      title: "Total",
                                      value: covidData.cases!.toString()),
                                  RowResuebale(
                                      title: "Recoverd",
                                      value: covidData.recovered!.toString()),
                                  RowResuebale(
                                      title: "Deaths",
                                      value: covidData.deaths!.toString()),
                                  RowResuebale(
                                      title: "Active",
                                      value: covidData.active!.toString()),
                                  RowResuebale(
                                      title: "Critical",
                                      value: covidData.critical!.toString()),
                                  RowResuebale(
                                      title: "Today Cases",
                                      value: covidData.todayCases!.toString()),
                                  RowResuebale(
                                      title: "Today Recoverd",
                                      value:
                                          covidData.todayRecovered!.toString()),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.countrylist);
                            },
                            child: Container(
                              height: getProportionateScreenHeight(50),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorManager.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Align(
                                  alignment: Alignment.center,
                                  child: Text('Track Countries')),
                            ),
                          )
                        ],
                      );
                    }
                    return const Center(
                      child: Text("Loading"),
                    );
                  }),
            ],
          ),
        ),
      )),
    );
  }
}

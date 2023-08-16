import 'package:coronavirus_app/Services/data_provider.dart';
import 'package:coronavirus_app/Services/states_services.dart';
import 'package:coronavirus_app/View/widgets/row_widget.dart';
import 'package:coronavirus_app/resources/colormanager.dart';
import 'package:coronavirus_app/resources/routesmanager.dart';
import 'package:coronavirus_app/resources/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldrecordStates extends ConsumerStatefulWidget {
  const WorldrecordStates({Key? key}) : super(key: key);

  @override
  ConsumerState<WorldrecordStates> createState() => _WorldrecordStatesState();
}

class _WorldrecordStatesState extends ConsumerState<WorldrecordStates>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    StatesServices services = StatesServices();
    final data = ref.watch(dataProvider);
    return Scaffold( 
        body: data.when(
            error: (err, stack) => Text('Error: ${err.toString()}'),
            loading: () => SpinKitCircle(
                  color: Colors.white,
                  size: getProportionateScreenHeight(50),
                  controller: _animationController,
                ),
            data: ((data) {
              print(data.active.toString());
              return SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Column(
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
                              'Total': double.parse(data.cases!.toString()),
                              'Recovered':
                                  double.parse(data.recovered!.toString()),
                              'Deaths': double.parse(data.deaths!.toString()),
                            }),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(25)),
                          child: Card(
                            child: Column(
                              children: [
                                RowResuebale(
                                    title: "Total",
                                    value: data.cases!.toString()),
                                RowResuebale(
                                    title: "Recoverd",
                                    value: data.recovered!.toString()),
                                RowResuebale(
                                    title: "Deaths",
                                    value: data.deaths!.toString()),
                                RowResuebale(
                                    title: "Active",
                                    value: data.active!.toString()),
                                RowResuebale(
                                    title: "Critical",
                                    value: data.critical!.toString()),
                                RowResuebale(
                                    title: "Today Cases",
                                    value: data.todayCases!.toString()),
                                RowResuebale(
                                    title: "Today Recoverd",
                                    value: data.todayRecovered!.toString()),
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
                    )
                  ],
                ),
              ));
            })

            // SafeArea(
            //     child: Padding(
            //   padding: const EdgeInsets.all(15),
            //   child: Column(
            //     children: [
            //       SizedBox(
            //         height: getProportionateScreenHeight(10),
            //       ),
            //       FutureBuilder(
            //           future: services.getdata(),
            //           builder: (conext, AsyncSnapshot<WorldStatesModal> snapshot) {
            //             if (!snapshot.hasData) {
            //               return Expanded(
            //                   flex: 1,
            //                   child: SpinKitCircle(
            //                     color: Colors.white,
            //                     size: getProportionateScreenHeight(50),
            //                     controller: _animationController,
            //                   ));
            //             }
            //             if (snapshot.connectionState == ConnectionState.done &&
            //                 snapshot.hasData) {
            //               var data = snapshot.data!;
            //               return
            // Column(
            //                 children: [
            //                   PieChart(
            //                       chartRadius: getProportionateScreenWidth(90),
            //                       colorList: [
            //                         ColorManager.primary,
            //                         ColorManager.green,
            //                         ColorManager.error
            //                       ],
            //                       chartValuesOptions: const ChartValuesOptions(
            //                           showChartValuesInPercentage: true),
            //                       animationDuration:
            //                           const Duration(milliseconds: 1200),
            //                       legendOptions: const LegendOptions(
            //                           legendPosition: LegendPosition.left),
            //                       chartType: ChartType.ring,
            //                       dataMap: {
            //                         'Total':
            //                             double.parse(data.cases!.toString()),
            //                         'Recovered':
            //                             double.parse(data.recovered!.toString()),
            //                         'Deaths':
            //                             double.parse(data.deaths!.toString()),
            //                       }),
            //                   Padding(
            //                     padding: EdgeInsets.symmetric(
            //                         vertical: getProportionateScreenHeight(25)),
            //                     child: Card(
            //                       child: Column(
            //                         children: [
            //                           RowResuebale(
            //                               title: "Total",
            //                               value: data.cases!.toString()),
            //                           RowResuebale(
            //                               title: "Recoverd",
            //                               value: data.recovered!.toString()),
            //                           RowResuebale(
            //                               title: "Deaths",
            //                               value: data.deaths!.toString()),
            //                           RowResuebale(
            //                               title: "Active",
            //                               value: data.active!.toString()),
            //                           RowResuebale(
            //                               title: "Critical",
            //                               value: data.critical!.toString()),
            //                           RowResuebale(
            //                               title: "Today Cases",
            //                               value: data.todayCases!.toString()),
            //                           RowResuebale(
            //                               title: "Today Recoverd",
            //                               value:
            //                                   data.todayRecovered!.toString()),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                   GestureDetector(
            //                     onTap: () {
            //                       Navigator.pushNamed(context, Routes.countrylist);
            //                     },
            //                     child: Container(
            //                       height: getProportionateScreenHeight(50),
            //                       width: double.infinity,
            //                       decoration: BoxDecoration(
            //                           color: ColorManager.green,
            //                           borderRadius: BorderRadius.circular(10)),
            //                       child: const Align(
            //                           alignment: Alignment.center,
            //                           child: Text('Track Countries')),
            //                     ),
            //                   )
            //                 ],
            //               );
            //             }
            //             return const Center(
            //               child: Text("Loading"),
            //             );
            //           }),
            //     ],
            //   ),
            // )),
            ));
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coronavirus_app/Modal/world_countries_modal.dart';
import 'package:coronavirus_app/resources/sizeconfig.dart';
import 'package:flutter/material.dart';

import 'widgets/row_widget.dart';

class DetailScreen extends StatefulWidget {
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  WorldCountriesModal? args;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    args = ModalRoute.of(context)!.settings.arguments as WorldCountriesModal;
    print(args!.active);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(args!.country.toString()),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(alignment: Alignment.topCenter, children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Card(
                    child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                      width: getProportionateScreenWidth(50),
                    ),
                    RowResuebale(
                        title: "Total", value: args!.cases!.toString()),
                    RowResuebale(
                        title: "Recoverd", value: args!.recovered!.toString()),
                    RowResuebale(
                        title: "Deaths", value: args!.deaths!.toString()),
                    RowResuebale(
                        title: "Active", value: args!.active!.toString()),
                    RowResuebale(
                        title: "Critical", value: args!.critical!.toString()),
                    RowResuebale(
                        title: "Today Cases",
                        value: args!.todayCases!.toString()),
                    RowResuebale(
                        title: "Today Recoverd",
                        value: args!.todayRecovered!.toString()),
                  ],
                )),
              ),
              SizedBox(
                height: getProportionateScreenHeight(70),
                width: getProportionateScreenWidth(50),
                child: CircleAvatar(
                  backgroundImage:
                      Image.network(args!.countryInfo!.flag.toString()).image,
                ),
              ),
            ])
          ],
        ),
      )),
    );
  }
}

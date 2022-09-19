import 'package:coronavirus_app/Services/states_services.dart';
import 'package:coronavirus_app/resources/colormanager.dart';
import 'package:coronavirus_app/resources/routesmanager.dart';
import 'package:coronavirus_app/resources/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Modal/world_countries_modal.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  final TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    StatesServices services = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
              width: double.infinity,
              child: TextFormField(
                controller: searchcontroller,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintText: 'Search with country name',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            Expanded(
                child: FutureBuilder<List<WorldCountriesModal>>(
              future: services.getcountriesdata(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return Shimmer.fromColors(
                    baseColor: ColorManager.grey,
                    highlightColor: ColorManager.lightGrey,
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Container(
                                  height: getProportionateScreenHeight(20),
                                  width: getProportionateScreenWidth(89),
                                  color: ColorManager.white,
                                ),
                                leading: SizedBox(
                                    height: getProportionateScreenHeight(100),
                                    width: getProportionateScreenWidth(50),
                                    child: Container(
                                      color: ColorManager.white,
                                    )),
                                subtitle: Container(
                                  height: getProportionateScreenHeight(20),
                                  width: getProportionateScreenWidth(89),
                                  color: ColorManager.white,
                                ),
                              )
                            ],
                          );
                        })),
                  );
                } else {
                  return ListView.builder(
                      itemCount: services.countrieslist.length,
                      itemBuilder: ((context, index) {
                        var data = services.countrieslist[index];
                        var countrydata = services.countrieslist[index].country;
                        if (searchcontroller.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: (() {
                                  Navigator.pushNamed(context, Routes.detail,
                                      arguments: data);
                                }),
                                child: ListTile(
                                  title: Text(data.country.toString()),
                                  leading: SizedBox(
                                    height: getProportionateScreenHeight(100),
                                    width: getProportionateScreenWidth(50),
                                    child: Image(
                                        image: Image.network(data
                                                .countryInfo!.flag
                                                .toString())
                                            .image),
                                  ),
                                  subtitle: Text(data.cases.toString()),
                                ),
                              )
                            ],
                          );
                        } else if (countrydata!
                            .toLowerCase()
                            .contains(searchcontroller.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: (() {
                                  Navigator.pushNamed(context, Routes.detail,
                                      arguments: data);
                                }),
                                child: ListTile(
                                  title: Text(data.country.toString()),
                                  leading: SizedBox(
                                    height: getProportionateScreenHeight(100),
                                    width: getProportionateScreenWidth(50),
                                    child: Image(
                                        image: Image.network(data
                                                .countryInfo!.flag
                                                .toString())
                                            .image),
                                  ),
                                  subtitle: Text(data.cases.toString()),
                                ),
                              )
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }));
                }
              }),
            ))
          ],
        ),
      )),
    );
  }
}

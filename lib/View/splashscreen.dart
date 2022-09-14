import 'dart:async';

import 'package:coronavirus_app/resources/assets.dart';
import 'package:coronavirus_app/resources/fontsmanager.dart';
import 'package:coronavirus_app/resources/routesmanager.dart';
import 'package:coronavirus_app/resources/sizeconfig.dart';
import 'package:coronavirus_app/resources/stringmanager.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    _startdelay();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  Timer? _timer;
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();
  _gonext() {
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.worldstats, (route) => false);
  }

  _startdelay() {
    Future.delayed(const Duration(seconds: 5), _gonext);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _animationController,
              child: SizedBox(
                height: getProportionateScreenHeight(200),
                width: getProportionateScreenWidth(200),
                child: Image.asset(ImageAssets.logo),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _animationController.value * 2.0 * math.pi,
                  child: child,
                );
              }),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          const Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.splashtext,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.s24),
              ))
        ],
      )),
    );
  }
}

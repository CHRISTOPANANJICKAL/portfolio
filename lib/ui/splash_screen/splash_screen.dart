// Created by: Christo Pananjickal, Created at: 24-04-2024 06:16 am

import 'package:flutter/material.dart';
import 'package:portfolio/providers/user_info_provider.dart';
import 'package:portfolio/services/navigation_service/app_navigator.dart';
import 'package:portfolio/services/navigation_service/routes.dart';
import 'package:portfolio/theme/text_styles.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final provider = context.read<UserInfoProvider>();
    WidgetsBinding.instance.addPostFrameCallback((t) async {
      provider.getUserInfo();
      await Future.delayed(const Duration(seconds: 1), () {
        Globals.splashCompleted = true;
        AppNavigator.navigate(AppRoutes.about);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      color: Colors.yellow,
      child: Text(
        'Spash Animation',
        style: Ts.ts16W500(color: Colors.white),
      ),
    );
  }
}
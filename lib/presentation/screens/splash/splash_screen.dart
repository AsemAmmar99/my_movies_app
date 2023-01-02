import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_movies_app/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/screens.dart' as screens;
import '../../widgets/default_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late final AnimationController _slideController;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      animationBehavior: AnimationBehavior.preserve,
      value: 1,
      vsync: this,
    )..repeat(reverse: true);

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -1.0),
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.ease),
    );

    Timer(
      const Duration(milliseconds: 4000),
          () {
        Navigator.pushNamedAndRemoveUntil(context, screens.homeLayout, (route) => false);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkRed,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: Image.asset(
                'assets/icons/logo.png',
                height: 30.h,
                width: 70.w,
              ),
            ),
            DefaultText(
              text: 'ARTS HOME',
              color: lightRed,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

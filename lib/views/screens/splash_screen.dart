import 'package:flutter/material.dart';
import 'package:remote_home/utils/utils.dart';
// import 'package:flutter/services.dart';
import 'package:remote_home/views/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController firstAnimation, popAnimation, swapImages, bringText;
  late Animation<double> scaleAnim;
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
    firstAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    popAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    swapImages = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    bringText = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    scaleAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: firstAnimation,
        curve: Curves.easeIn,
      ),
    );

    firstAnimation.forward().then((_) {
      swapImages.forward().then((_) {
        setState(() {
          scaleAnim = Tween<double>(begin: 1, end: 1.2).animate(
            CurvedAnimation(parent: popAnimation, curve: Curves.easeIn),
          );
        });
        popAnimation.forward().then(
              (_) => popAnimation.reverse().then(
                    (_) => bringText.forward().then((_) {
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomePage();
                            },
                          ),
                        );
                      });
                    }),
                  ),
            );
      });
    });
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: firstAnimation,
                  curve: Curves.easeIn,
                ),
              ),
              child: ScaleTransition(
                scale: scaleAnim,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      FadeTransition(
                        opacity: Tween<double>(begin: 0, end: 1).animate(
                          CurvedAnimation(
                            parent: swapImages,
                            curve: Curves.easeIn,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/splash_color.png",
                        ),
                      ),
                      FadeTransition(
                        opacity: Tween<double>(begin: 1, end: 0).animate(
                          CurvedAnimation(
                            parent: swapImages,
                            curve: Curves.easeIn,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/splash.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: Dimensions.midSize),
            SlideTransition(
              position: Tween<Offset>(
                      begin: const Offset(0, 10), end: const Offset(0, 0))
                  .animate(bringText),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(bringText),
                child: const Text(
                  "Smart Home",
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

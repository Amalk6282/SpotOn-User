import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  final Widget nextScreen;

  const SplashScreen({Key? key, required this.nextScreen}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  bool _isImageLoaded = false;
  bool _isAnimationComplete = false;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    // Create fade-in animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // Create scale animation for logo
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    // Start animation after a short delay
    Timer(const Duration(milliseconds: 200), () {
      _animationController.forward();
    });

    // Listen for animation completion
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isAnimationComplete = true;
        });

        // Navigate to next screen if image is also loaded
        if (_isImageLoaded) {
          _navigateToNextScreen();
        }
      }
    });
  }

  void _onImageLoaded(bool success) {
    setState(() {
      _isImageLoaded = true;
    });

    // Navigate to next screen if animation is also complete
    if (_isAnimationComplete) {
      _navigateToNextScreen();
    }
  }

  void _navigateToNextScreen() {
    // Delay to allow animations to complete visually
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => widget.nextScreen),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF121212),
                  Color(0xFF1E1E1E),
                  Color(0xFF242424),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo and app name container
                  Opacity(
                    opacity: _fadeAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Column(
                        children: [
                          // Parking image
                          Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.network(
                                'https://img.freepik.com/free-vector/parking-concept-illustration_114360-9286.jpg',
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    // Image is loaded
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      _onImageLoaded(true);
                                    });
                                    return child;
                                  }
                                  // Image is loading
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: const Color(0xFF9B49E6),
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  // Error loading image
                                  _onImageLoaded(false);
                                  return const Icon(
                                    Icons.local_parking,
                                    size: 100,
                                    color: Color(0xFF9B49E6),
                                  );
                                },
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          // App name
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Spot',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: 'On',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Tagline
                          const Text(
                            'Find Your Perfect Parking Space',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Loading indicator
                  if (!_isAnimationComplete || !_isImageLoaded)
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              const Color(0xFF9B49E6)
                                  .withOpacity(_fadeAnimation.value),
                            ),
                            strokeWidth: 3,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Example of how to use this splash screen in your main.dart file
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpotOn Parking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF9B49E6),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: SplashScreen(
        // Replace this with your actual home screen
        nextScreen: Scaffold(
          appBar: AppBar(
            title: const Text('SpotOn Parking'),
          ),
          body: const Center(
            child: Text('Home Screen'),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spot_on_users/signin.dart';
import 'package:spot_on_users/signup.dart';

class GetStartedpage extends StatefulWidget {
  const GetStartedpage({Key? key}) : super(key: key);

  @override
  State<GetStartedpage> createState() => _GetStartedpageState();
}

class _GetStartedpageState extends State<GetStartedpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Background pattern
              Positioned.fill(
                child: CustomPaint(painter: LaundryPatternPainter()),
              ),

              // Main content
              Column(
                children: [
                  const Spacer(flex: 2),
                  // Bottom white curved container
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 40, 24, 32),
                    child: Column(
                      children: [
                        // Title text with different styles
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(fontSize: 28, height: 1.4),
                            children: [
                              const TextSpan(
                                text: "Let's Find the ",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "Top-notch\n",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: "Parking Spaces",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: " in the city",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Description text
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Get Started Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            minimumSize: const Size(double.infinity, 56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Let's Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Sign In text
                        Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Don't have an account? SignUp",
                                  style: TextStyle(fontSize: 16),
                                ))),

                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LaundryPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Create a staggered grid of laundry-related icons
    final patternSize = 60.0;
    final rows = (size.height / patternSize).ceil();
    final cols = (size.width / patternSize).ceil();

    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < cols; j++) {
        final x = j * patternSize + (i.isOdd ? patternSize / 2 : 0);
        final y = i * patternSize;

        // Draw washing machine icon
        if ((i + j) % 3 == 0) {
          canvas.drawRect(
            Rect.fromCenter(center: Offset(x, y), width: 30, height: 30),
            paint,
          );
          canvas.drawCircle(Offset(x, y), 10, paint);
        }
        // Draw t-shirt icon
        else if ((i + j) % 3 == 1) {
          final path = Path()
            ..moveTo(x - 15, y - 15)
            ..lineTo(x + 15, y - 15)
            ..lineTo(x + 10, y + 15)
            ..lineTo(x - 10, y + 15)
            ..close();
          canvas.drawPath(path, paint);
        }
        // Draw water drop icon
        else {
          final path = Path()
            ..moveTo(x, y - 15)
            ..quadraticBezierTo(x + 15, y, x, y + 15)
            ..quadraticBezierTo(x - 15, y, x, y - 15);
          canvas.drawPath(path, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

import 'package:flutter/material.dart';
import 'package:spot_on_users/add_details_screen.dart';
import 'package:spot_on_users/home.dart';
import 'package:spot_on_users/homescreen.dart';

class ParkingSlotBooking extends StatefulWidget {
  const ParkingSlotBooking({Key? key}) : super(key: key);

  @override
  _ParkingSlotBookingState createState() => _ParkingSlotBookingState();
}

class _ParkingSlotBookingState extends State<ParkingSlotBooking> {
  final String carImageUrl =
      "https://static.vecteezy.com/system/resources/previews/025/310/861/non_2x/white-suv-on-transparent-background-3d-rendering-illustration-free-png.png";

  // Currently selected slot
  String? selectedSlot;

  // Slots that are occupied (you can modify this based on your backend data)
  final Set<String> occupiedSlots = {'A02', 'A04', 'B02', 'B06'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconCard(
                    iconData: Icons.arrow_back,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    color: const Color.fromARGB(255, 87, 87, 87),
                  ),
                  Spacer(),
                  const Text(
                    'Illinois Center',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconCard(
                    iconData: Icons.info_outline,
                    onTap: () {},
                    color: const Color.fromARGB(255, 87, 87, 87),
                  )
                ],
              ),
            ),

            // Floor selector
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildFloorButton('G Floor', true),
                  _buildFloorButton('1st Floor', false),
                  _buildFloorButton('2nd Floor', false),
                  _buildFloorButton('3rd Floor', false),
                ],
              ),
            ),

            // Parking layout
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Left side slots (A)
                    Expanded(
                      child: Column(
                        children: [
                          for (int i = 1; i <= 7; i++)
                            _buildParkingSlot('A0$i', false),
                        ],
                      ),
                    ),

                    // Middle section with arrows
                    Container(
                      width: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_downward, color: Colors.white),
                          SizedBox(height: 100),
                          Icon(Icons.arrow_upward, color: Colors.white),
                        ],
                      ),
                    ),

                    // Right side slots (B)
                    Expanded(
                      child: Column(
                        children: [
                          for (int i = 1; i <= 6; i++)
                            _buildParkingSlot('B0$i', true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Next button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: selectedSlot != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddDetailsScreen(),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7F00FF),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloorButton(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.yellow : Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildParkingSlot(String slotId, bool isRightSide) {
    bool isOccupied = occupiedSlots.contains(slotId);
    bool isSelected = selectedSlot == slotId;

    return Expanded(
      child: GestureDetector(
        onTap: isOccupied
            ? null
            : () {
                setState(() {
                  selectedSlot = isSelected ? null : slotId;
                });
              },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.yellow : Colors.grey,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[900],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isOccupied)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    carImageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              Positioned(
                top: 4,
                left: isRightSide ? null : 4,
                right: isRightSide ? 4 : null,
                child: Text(
                  slotId,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

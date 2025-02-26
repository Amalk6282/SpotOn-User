import 'package:flutter/material.dart';

class ParkingScreen extends StatefulWidget {
  const ParkingScreen({super.key});

  @override
  State<ParkingScreen> createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  int _selectedIndex = 0;

  final List<String> _tabs = ['Ongoing', 'Completed', 'Canceled'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.location_on_outlined, color: Colors.black),
                  ),
                  const Text(
                    'My Parkings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Stack(
                      children: [
                        const Icon(Icons.notifications_outlined,
                            color: Colors.black),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Navigation Tabs
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: List.generate(
                    _tabs.length,
                    (index) => Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedIndex = index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _selectedIndex == index
                                ? const Color(0xFFFFEB3B)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _tabs[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Content based on selected tab
              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: [
                    OngoingParkingList(),
                    CompletedParkingList(),
                    CanceledParkingList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParkingCard extends StatelessWidget {
  final String location;
  final String address;
  final String status;
  final String price;
  final String duration;
  final bool showTimer;
  final bool showCancelButton;

  const ParkingCard({
    super.key,
    required this.location,
    required this.address,
    required this.status,
    required this.price,
    required this.duration,
    this.showTimer = false,
    this.showCancelButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://t4.ftcdn.net/jpg/12/14/07/63/240_F_1214076346_IP3vmKVr1c5M6FVxPktpLRj7k7pyLPqn.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          location,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      address,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      duration,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (showTimer)
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View Timer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              if (showCancelButton)
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancel Booking',
                      style: TextStyle(color: Colors.white)),
                ),
              TextButton(
                onPressed: () {},
                child: const Text('View Ticket',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OngoingParkingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ParkingCard(
          location: 'Illinois Center',
          address: '111 E Wacker Dr, Chicago',
          status: 'Active',
          price: '\$20',
          duration: '24 Hours',
          showTimer: true,
        ),
        ParkingCard(
          location: 'Park N Jet',
          address: '4005 Mannheim Rd, Schiller Park',
          status: 'Active',
          price: '\$30',
          duration: '73 Hours',
          showCancelButton: true,
        ),
      ],
    );
  }
}

class CompletedParkingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ParkingCard(
          location: 'Downtown Parking',
          address: '123 Main St, Chicago',
          status: 'Completed',
          price: '\$15',
          duration: 'Completed',
        ),
      ],
    );
  }
}

class CanceledParkingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ParkingCard(
          location: 'Airport Parking',
          address: '789 Airport Rd, Chicago',
          status: 'Canceled',
          price: '\$25',
          duration: 'Canceled',
        ),
      ],
    );
  }
}

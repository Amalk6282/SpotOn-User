import 'package:flutter/material.dart';
import 'package:spot_on_users/navigation_screen.dart';

class ParkingTicketScreen extends StatelessWidget {
  const ParkingTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CustomAppBar(),
              const SizedBox(height: 24),
              const TicketCard(),
              const Spacer(),
              NavigationButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        const Text(
          'Parking Ticket',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class TicketCard extends StatelessWidget {
  const TicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.network(
              'https://fiches-pratiques.e-marketing.fr/Assets/Img/FICHEPRATIQUE/2021/10/365359/Comment-generer-facilement-code--F.jpg'),
          // QrImage(
          //   data: 'https://example.com/parking-ticket/123',
          //   version: QrVersions.auto,
          //   size: 200.0,
          // ),
          const SizedBox(height: 12),
          const Text(
            'Scan this QR on the scanner machine when\nyou are in the Parking Slot.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 24),
          const TicketDetails(),
        ],
      ),
    );
  }
}

class TicketDetails extends StatelessWidget {
  const TicketDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DetailRow(
          label: 'Name',
          value: 'Cameron Williamson',
          topSpacing: 0,
        ),
        DetailRow(
          label: 'Vehicle Number',
          value: 'E653JA',
        ),
        DetailRow(
          label: 'Parking Area',
          value: 'Illinois Center',
        ),
        DetailRow(
          label: 'Parking Slot',
          value: 'G Floor - B 03',
        ),
        DetailRow(
          label: 'Duration',
          value: '4 Hours',
        ),
        DetailRow(
          label: 'Time',
          value: '03:00PM To 07:00PM',
        ),
        DetailRow(
          label: 'Date',
          value: 'Wed 08 Nov, 2023',
        ),
        DetailRow(
          label: 'Phone Number',
          value: '+1 357 735 8364',
        ),
      ],
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final double topSpacing;

  const DetailRow({
    super.key,
    required this.label,
    required this.value,
    this.topSpacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NavigationScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Start Navigation',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spot_on_users/bottom_navbaritem.dart';
import 'package:spot_on_users/home.dart';
import 'package:spot_on_users/my_parkings_screen.dart';
import 'package:spot_on_users/parking_slot_booking.dart';
import 'package:spot_on_users/pofile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: [
            Home(),
            ParkingSlotBooking(),
            ParkingScreen(),
            ProfileScreen()
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavbarItem(
                  isActive: _tabController.index == 0,
                  label: 'Home',
                  iconData: Icons.home,
                  onTap: () {
                    _tabController.animateTo(0);
                  },
                ),
                BottomNavbarItem(
                  isActive: _tabController.index == 1,
                  label: 'Favorite',
                  iconData: Icons.favorite_border,
                  onTap: () {
                    _tabController.animateTo(1);
                  },
                ),
                BottomNavbarItem(
                  isActive: _tabController.index == 2,
                  label: 'My Parkings',
                  iconData: Icons.system_update_tv_rounded,
                  onTap: () {
                    _tabController.animateTo(2);
                  },
                ),
                BottomNavbarItem(
                  isActive: _tabController.index == 3,
                  label: 'Profile',
                  iconData: Icons.account_circle_outlined,
                  onTap: () {
                    _tabController.animateTo(3);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

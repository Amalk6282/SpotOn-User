import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                IconCard(
                    iconData: Icons.location_on_outlined, color: Colors.white),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Santa Ana,illions 85486',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(
                  width: 35,
                ),
                IconCard(
                    iconData: Icons.notifications_none_outlined,
                    color: Colors.white),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Find Your Parking Space',
              style: TextStyle(fontSize: 55, color: Colors.white),
            ),
            Row(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter First Name',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  final IconData iconData;
  final Color color;
  const IconCard({
    super.key,
    required this.iconData,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(90)),
      ),
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: Colors.white,
          )),
    );
  }
}

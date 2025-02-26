import 'package:flutter/material.dart';
import 'package:spot_on_users/custom_search.dart';
import 'package:spot_on_users/notification__screen.dart';
import 'package:spot_on_users/parking_slot_booking.dart';

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
                  iconData: Icons.location_on_outlined,
                  onTap: () {},
                ),
                Spacer(),
                Text(
                  'Santa Ana,illions 85486',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Spacer(),
                IconCard(
                  iconData: Icons.notifications_none_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Find Your Parking Space',
              style: TextStyle(fontSize: 55, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            CustomSearch(onSearch: (onSearch) {}),
            SizedBox(
              height: 240,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  LocationCard(
                    color: Colors.yellow,
                    src:
                        'https://t4.ftcdn.net/jpg/12/14/07/63/240_F_1214076346_IP3vmKVr1c5M6FVxPktpLRj7k7pyLPqn.jpg',
                    label: 'Illinios Center',
                    label1: '111 E Wacker Dr,Chicago',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ParkingSlotBooking(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  LocationCard(
                    color: Colors.greenAccent,
                    src:
                        'https://t4.ftcdn.net/jpg/12/14/07/63/240_F_1214076346_IP3vmKVr1c5M6FVxPktpLRj7k7pyLPqn.jpg',
                    label: 'LULU Mall',
                    label1: 'Edappally,Ernakulam',
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  LocationCard(
                    color: Colors.blue,
                    src:
                        'https://t4.ftcdn.net/jpg/12/14/07/63/240_F_1214076346_IP3vmKVr1c5M6FVxPktpLRj7k7pyLPqn.jpg',
                    label: ' Secura Centre',
                    label1: 'Thazhe Chovva,Kannur',
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  LocationCard(
                    color: Colors.tealAccent,
                    src:
                        'https://t4.ftcdn.net/jpg/12/14/07/63/240_F_1214076346_IP3vmKVr1c5M6FVxPktpLRj7k7pyLPqn.jpg',
                    label: 'Capital Mall',
                    label1: 'Thana,Kannur',
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final Color color;
  final String src;
  final String label;
  final String label1;
  final Function() onTap;

  const LocationCard({
    super.key,
    required this.color,
    required this.src,
    required this.label,
    required this.label1,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 180,
      width: 240,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://t4.ftcdn.net/jpg/12/14/07/63/240_F_1214076346_IP3vmKVr1c5M6FVxPktpLRj7k7pyLPqn.jpg'))),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          label,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(label1),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconCard(
            iconData: Icons.arrow_forward,
            color: Color(0xFF212121),
            onTap: onTap,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0),
                topLeft: Radius.circular(40),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)),
          )
        ],
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  final Function() onTap;
  final IconData iconData;
  final Color color;
  final BorderRadiusGeometry? borderRadius;
  const IconCard({
    super.key,
    required this.iconData,
    this.color = Colors.black,
    required this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        padding: EdgeInsets.all(20),
        style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius != null
                    ? borderRadius!
                    : BorderRadius.circular(90)),
            backgroundColor: color),
        icon: Icon(
          iconData,
          color: Colors.white,
        ));
  }
}

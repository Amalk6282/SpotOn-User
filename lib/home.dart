import 'package:flutter/material.dart';
import 'package:spot_on_users/custom_search.dart';
import 'package:spot_on_users/custombutton.dart';

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
                Spacer(),
                Text(
                  'Santa Ana,illions 85486',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Spacer(),
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
                      label1: '111 E Wacker Dr,Chicago'),
                  SizedBox(
                    width: 15,
                  ),
                  LocationCard(
                      color: Colors.yellow,
                      src:
                          'https://t4.ftcdn.net/jpg/12/14/07/63/240_F_1214076346_IP3vmKVr1c5M6FVxPktpLRj7k7pyLPqn.jpg',
                      label: 'Illinios Center',
                      label1: '111 E Wacker Dr,Chicago'),
                  SizedBox(
                    width: 15,
                  ),
                  LocationCard(
                      color: Colors.yellow,
                      src:
                          'https://t4.ftcdn.net/jpg/12/14/07/63/240_F_1214076346_IP3vmKVr1c5M6FVxPktpLRj7k7pyLPqn.jpg',
                      label: 'Illinios Center',
                      label1: '111 E Wacker Dr,Chicago'),
                  SizedBox(
                    width: 15,
                  ),
                  LocationCard(
                      color: Colors.yellow,
                      src:
                          'https://t4.ftcdn.net/jpg/12/14/07/63/240_F_1214076346_IP3vmKVr1c5M6FVxPktpLRj7k7pyLPqn.jpg',
                      label: 'Illinios Center',
                      label1: '111 E Wacker Dr,Chicago'),
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

  const LocationCard({
    super.key,
    required this.color,
    required this.src,
    required this.label,
    required this.label1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
          border: Border.all(color: Colors.yellow),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 180,
      width: 240,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 100,
              child: Image.network(
                src,
              ),
            ),
            Spacer(),
            Row(children: [
              Column(children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 18),
                ),
                Text(label1),
              ]),
              Spacer(),
              IconCard(iconData: Icons.next_plan, color: Colors.black)
            ])
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

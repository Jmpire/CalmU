import 'package:calmu/utils/extensions.dart';
import 'package:calmu/values/app_routes.dart';
import 'package:calmu/views/doctors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  static String username = '';
  static String name = '';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState() {
    // shows our current stored theme key
  }
  List<String> doctors = ['Blake', 'Winnie', 'Jason', 'Victoria', 'Zane'];
  List<String> doctorImages = [
    'assets/blake.jpg',
    'assets/winnie.jpg',
    'assets/jason.jpg',
    'assets/victoria.jpg',
    'assets/zane.jpg'
  ];
  List<String> headerItems = [
    'My Profile',
    'Doctors',
    'Communities',
    'Settings',
    'Log Out'
  ];
  List<IconData> headearIcons = const [
    Icons.person_pin,
    Icons.health_and_safety,
    Icons.people_alt_rounded,
    Icons.settings,
    Icons.logout_outlined
  ];
  List<String> communities = ['Anxiety', 'Depression', 'Anger management', 'More Social'];
  List<String> communityCovers = [];
  var headers = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black);
  var subHeaders = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 17, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AppBar(
              toolbarHeight: 56.0,
              shadowColor: Colors.black,
              surfaceTintColor: Colors.white,
              titleSpacing: 0,
              title: Text(
                'CalmU',
                style: GoogleFonts.gabarito(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600)),
              ),
              actions: [
                Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    width: 30,
                    height: 30,
                    child: IconButton(
                      icon: const Icon(
                        Icons.support,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ))
              ],
              elevation: 0.2,
            ),
            Expanded(
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Good morning, Winnie',
                                    style: subHeaders,
                                  )
                                ],
                              )),
                          buildContainer(),
                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Discover Doctors', style: headers),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Doctor()));
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.purple,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 90,
                            width: double.infinity,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, int i) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: builderDoctorContainer(
                                        doctors[i], doctorImages[i]),
                                  );
                                }),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Meditations', style: headers),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Doctor()));
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.purple,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 170,
                              width: double.infinity,
                              child: builderMeditations()),
                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Explore Communities', style: headers),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Doctor()));
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.purple,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 120,
                              width: double.infinity,
                              child: builerCommunityContainer())
                        ],
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  // for the 16/9 aspect ratios
  Widget buildContainer() {
    return AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset('assets/cover_lady.jpg', fit: BoxFit.cover),
        ));
  }

  // drawer
  Widget drawer() {
    return Container(
      padding: const EdgeInsets.only(top: 80, left: 15, bottom: 20),
      color: Colors.white,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 15),
              child: Text('Main Menu', style: headers)),
          const Divider(color: Colors.purple, thickness: 4, endIndent: 120),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 5, right: 10),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.1))),
                child: ListTile(
                  dense: true,
                  leading: Icon(headearIcons[index], color: Colors.grey),
                  title: Text(
                    headerItems[index],
                    style: subHeaders,
                  ),
                  onTap: () {
                    switch (index) {
                      case 0:
                        AppRoutes.profile.pushName('');
                        break;
                      case 1:
                        AppRoutes.doctors.pushName('');
                        break;
                      case 2:
                        AppRoutes.communities.pushName('');
                        break;
                      case 3:
                        AppRoutes.profile.pushName('');
                        break;
                    }
                  },
                ),
              );
            },
            itemCount: headerItems.length,
          )),
          const SizedBox(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('from'),
                Text(
                  'Group 2',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // doctors' tabs
  Widget builderDoctorContainer(String docName, String docImage) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage(docImage),
        ),
        SizedBox(child: Text(docName))
      ],
    );
  }

  // meditations
  Widget builderMeditations() {
    return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 8.0,
        childAspectRatio: 1.2,
        crossAxisCount: 2,
        children: [
          builderMeditationsItems(
              'Train Your Mind',
              'The goal is to improve the thought process of your brain',
              20,
              'assets/cover1.jpg'),
          builderMeditationsItems(
              'Breathing Master',
              'Learn controlled breathing for times when you feel anxious or so',
              5,
              'assets/cover2.jpg'),
        ]);
  }

  Widget builderMeditationsItems(
      String header, String subText, int count, String cover) {
    return Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(cover), fit: BoxFit.cover, opacity: 0.5)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                header,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                subText,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${count.toString()} Sessions',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_circle_fill_rounded,
                        color: Colors.white,
                        size: 30,
                      ))
                ],
              )
            ]));
  }

  // communities
  Widget builerCommunityContainer() {
    return ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            width: 120,
            decoration: BoxDecoration(
              color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                    image: AssetImage('assets/cover_lady.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.6)),
            child: Center(
              child: Text(
                communities[i],
                textAlign: TextAlign.center,
                style:
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17),
              ),
            ),
          );
        });
  }
}

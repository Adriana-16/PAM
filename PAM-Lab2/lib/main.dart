import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(const MyApp());
}

class MyHospitalPage extends StatefulWidget {
  const MyHospitalPage({super.key});

  @override
  MyHospitalPageState createState() => MyHospitalPageState();
}
class MyHospitalPageState extends State<MyHospitalPage> {
  final List<String> usCities = ['Seattle, USA'];
  String selectedCity = 'Seattle, USA';
  bool isCityListExpanded = false;
  OverlayEntry? overlayEntry;

  final List<Map<String, String>> medicalCenters = [
    {
      'name': 'Sunrise Health Clinic',
      'address': '123 Oak Street, CA 98765',
      'rating': '5.0',
      'reviews': '58 Reviews',
      'image': 'https://s3-alpha-sig.figma.com/img/9f50/e360/edb80c5d0e9f43d9cc9e7c48030fa945?Expires=1728864000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RoJ98DbJBEpeZsFWN24bJBhJamuMvwiVBwMrPuZ1zgOSuTEo91lU2Vk~agCaRVXPYDu7F4msG6oAArqfXfauP6WvSsu-yWEUX0GhbP~DSyAl-3TAP3z78eFhX2BpbZ1yHqrLvGOJuLeNURMFDJrzdM1xIqimyc4lUNYmbMTMZd8YspioQtaZ-VPiVVN7iTzkwndfcVkvSfMWGlqwiGARVY-xos7Vhlgx0BUiHlH6vg3CaaxJJLYvZTfGKD1aPAq1CrqQ5E4vCfnWEydfNtqyQcO80~9F70FTyA-k~7zvtvkdnKJY2sy3M4RT4GeTAEo5~AW459JJYvG-9RWwvuEFWA__', // Replace with your image URL
    },
    {
      'name': 'Golden Cardiology',
      'address': '555 Bridge Street, CA 98765',
      'rating': '4.9',
      'reviews': '103 Reviews',
      'image': 'https://s3-alpha-sig.figma.com/img/0b53/b0b9/f213d7dbdf0e01693c868dd621270fcb?Expires=1728864000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D~rVgId0XGki1KncJOQuLo7i-bVoIIs7FmHJowX0vR3u6sT27ORrnSbKsMwYzU-reRH8BEs8cRIUSsCTxilwh-GGVUFTBUpX54bwFL1hsGakl~cuA~MreMXgpxrPqkQF0toEmLYEZurH4NLjol8osUFYhEi15LKmK4jloYdTC4ihzi~d-IreR~1iDEPXE64pzMDKrKHdPe3oTY7LiQDBPT2yHuN2Txhh66digXrBFLyvhzXTK0PLrDTPBUgX5450uzVnC84IMlblWHC9MBmgEcL3Yc~78nyHpvVoe5cFeCkWY2MKY09YeD4BwRkZkRRH8EqC81J~VfNEbsNO1FSKtw__', // Replace with your image URL
    },
// Add more medical centers here
  ];

  final List<Map<String, String>> medicalDoc = [
    {
      'name': 'Dr. David Patel',
      'specialty': 'Cardiologist',
      'rating': '5',
      'location': 'Cardiology Center, USA',
      'reviews': '1,872 Reviews',
      'image': 'https://s3-alpha-sig.figma.com/img/ab8e/d8d0/b0db1e98ab7f1a31afba13769f282033?Expires=1728864000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HEFib6NI3OLKRXAhdUDhESy6N7m5wWxT5hnnR654~SuxMt617Y2YESBcaDAO25r6UC7oCCSBEh7ZkSFzSeFqTIuUzBzj7rIl1fjRQsDZUVdIEvvuw3FbZWxk3uwMRFCYhYJRnNnNR2o0HeEfxz2e9wjej2AIiQgtMHIWLHNYSZyeewKORkPtS9lXkJbaEv4m2JalrCJ3q4xXOKtn4o7lxiyANhiKdmI9zxE44r4-7ebAJhQFcUDFjQ3S93hph~1Q~rv~Cw93haNdmytybv517lSWYWbm~5gz0yI6-RV09GV8YGn4akchunrFTKIfYzFVEDA89b9QPc2ZDyT-dgbBEg__', // Înlocuiește cu URL-ul imaginii medicului
    },
    {
      'name': 'Dr. Jessica Turner',
      'specialty': 'Gynecologist',
      'location': 'Women\'s Clinic, Seattle, USA',
      'rating': '4.9',
      'reviews': '127 Reviews',
      'image': 'https://s3-alpha-sig.figma.com/img/eda2/ee92/bffb300537aa46caf4c65351a0a20dde?Expires=1728864000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=IJ8hNEjXiZ0IJlLkHu-PAxPPkvOuJi9Zht4376dKNua697PCZILXCD5fYgHuBBBnqo~PEUtxz4ohndq2FMPK3KtclERp0C6xIEFSVSgTR2ViDQRZ5tx-WfcWMnPR5RmbshYda0oMtNuQ8uFqUevn8jMdjAjWe7cLQoFVsQmQPA3DVq~HltPIull0Ilep3MBDmwErDRr2dpsrP~NMoEDZoUN4zWRQQydZpoBrD8JGqwOXUurIpwNvvnaROC-d5omuc5fN-iZemSBWcPI-sXrXT5n~rlYlxFmi4krdy~XVocjzXw9yyP~TNhyhgyO0UlyS7STSElCJG9FqEFfjiRtUTg__',
    },
    {
      'name': 'Dr. Michael Johnson',
      'specialty': 'Orthopedic Surgery',
      'location': 'Maple Associates, NY, USA',
      'rating': '4.7',
      'reviews': '5,223 Reviews',
      'image': 'https://s3-alpha-sig.figma.com/img/86b5/e652/0800f3ee36c944ded270e36c1763aaed?Expires=1728864000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HgIsfLm~gzu5pFjwuLVfIb-FiBaK0J1UnCO06AaGkrgxcA-5OdDeh3fueB2~t8B7wvQWX-~Ty9Rbtk7jCckimtY0YJBf-6D6m67Ps-r2tVqbXKN~ySiQ7IhoU0dxtzJQ4tif57DX72qhfA~AqcGnX2GtU0oivFGX0joH4011BgQIZXntj6Afi4dFWKvvwUqR~GDMLaldiC5e~XAdbUnA~16quLbvzXUg~ATexAgRmm5kIpMi0PyyEocNQFjfPIZm0rFL5sOaZ35lH~qLoXvCnHYo0XcwiPHkixp8bVUULNX6yTOW-QQhChD52bPTz~5O~epOw~3um3QBUcv3EAe2ag__',
    },
    {
      'name': 'Dr. Emily Walker',
      'specialty': 'Pediatrics',
      'location': 'Serenity Pediatrics Clinic',
      'rating': '5',


      'reviews': '405 Reviews',
      'image': 'https://s3-alpha-sig.figma.com/img/f501/868c/d62449885187cf0eb057a3fdee941589?Expires=1728864000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Npw95p7nvROKuLKeAMRy6RUvohsrkaA0006KO35THwd26EqjI9bKYVxkM-rcZXUFCFpq~C0NPf9Nertpd6RigwWaydpo6lm9jkY6i97c9vujAR-OBbMdGheZi6auuc3mL3U-VbX15kgOZrdLchC6kidR-K0w1I7bo90mS4bHgUdmHbqWRy4VAwR1Ad-j33~l~zdhGc~7tcIMEDM4sTuePXkAx2TC6Iesifjo0UatQJGzzGqfqsIaXIokykdYTOWo1G-~OkNfVZ7aE6B1txiAnh0qZB-iVPQiPBoDFdKNDGesHs0HSbNSMCojCkQjf3kfqVP0t6AwJvtqqzwieB7Nxg__',
    },
    {
      'name': 'Dr. Emily Walker',
      'specialty': 'Pediatrics',
      'location': 'Serenity Pediatrics Clinic',
      'rating': '5',
      'reviews': '405 Reviews',
      'image': 'https://s3-alpha-sig.figma.com/img/177e/81a4/cbbe443ae4d16ccaa140e5590a4e0a76?Expires=1728864000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=e0rub-1K-wm9vtyMttgX5j6vT1QQn-6takgK3DPx-A3TzEjvsPzE2EmwB9VJhc8vM30j3GdPTXmBIryyui2Co3122eE3nK0u0RKz2ic2vg32OIruRHiaxkETzRsjjKgO9CQaYgGDQvvqj7sZgUHBrg7~R6eQyv~2HC2ao0OjtCXAIYVdYPrTAz0R~LslLlE1HJLIB7cFVfO2hATO4H99faAH9vlsevvMDIlKE9H6YDtVQquXZkcMSG9obfVp7cfn7r4e02QDZKv9dJSTm~71PCRQD3s2EqiD6XVdx1Bd~Wa3vB6foRsMDqnLbh-B4C3dnikWyYzyqqX5PqYTKRuOPw__',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
              top: 10, left: 10, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black38,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCityListExpanded = !isCityListExpanded;
                      });
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          selectedCity,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          isCityListExpanded ? Icons.expand_less : Icons
                              .expand_more,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.only(
              top: 10, left: 20, right: 20, bottom: 10),
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 370,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.black54),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search doctor...',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://s3-alpha-sig.figma.com/img/6e76/389f/b8c80d0899c8c8ea2b2d81ea6e01642f?Expires=1728864000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=T8AfzMv5GWrd4BDhoHTb64DH0dmsiP8M6LCqhkcdtv36lvxLh6AMe0cVARTg8M4Gp5wfvtUngAUCBrXMKnmmhN0kG0wKSKS1NVI24sA4FCev76659~XlyMxnTH7G7OwC7cyg1tcvWDFzVE71iAbjq8Wr3CckBSo6ZlLZuvs43xRcw3CpCsNcFDeLfY8TiNx86MZwv5fEqOrvXsPmfXqAOSIpKN~hZgemkjOoQTqB8NoH685iObIxoTp0ZqbOp31QE6ZIv02fAqtng5uz9V8Y7hZYUJcfHeKealKuoHTpMgTPJdTnKFqBqyWCYIiw9teBrO1kmFzSDpK62prnLtk1Uw__'),
                  fit: BoxFit.none,
                  alignment: Alignment(-0.7, -0.8),
                  scale: 2.1,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 60,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        "Looking for\nSpecialist Doctors?\n",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        "Schedule an appointment with\nour top doctors",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),


// Iconițele de tip carusel
                  Positioned(
                    bottom: 10,
                    left: MediaQuery
                        .of(context)
                        .size
                        .width / 2 - 50, // Centrează punctele
                    child: const Row(
                      children: [
                        Icon(Icons.circle, size: 10, color: Colors.white),
                        SizedBox(width: 5),
                        Icon(Icons.circle, size: 10, color: Colors.grey),
                        SizedBox(width: 5),
                        Icon(Icons.circle, size: 10, color: Colors.grey),
                      ],
                    ),
                  ),

                  Positioned(
                    top: -100,
                    left: -60,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 180,
                    left: 60,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle, //cercul
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
// Poți adăuga funcționalitatea dorită aici
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black38,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSquareCard(
                    FontAwesomeIcons.tooth, const Color(0xFFF48FB1),
                    Colors.white),
// Dentist
                _buildSquareCard(
                    FontAwesomeIcons.heartPulse, const Color(0xFFA5D6A7),
                    Colors.white), // Cardiology
                _buildSquareCard(
                    FontAwesomeIcons.lungs, const Color(0xFFFF8A65),
                    Colors.white), // Pulmonology
                _buildSquareCard(
                    FontAwesomeIcons.stethoscope, const Color(0xFFB39DDB),
                    Colors.white), // Stethoscope
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dentistry',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cardiolo..',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pulmono..',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'General',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSquareCard(
                    FontAwesomeIcons.brain, Colors.teal,
                    Colors.white),
// Dentist
                _buildSquareCard(
                    FontAwesomeIcons.utensils , Color(0xFF4A148C),
                    Colors.white), // Cardiology
                _buildSquareCard(
                    FontAwesomeIcons.flask, const Color(0xFFF8BBD0),
                    Colors.white), // Pulmonology
                _buildSquareCard(
                    FontAwesomeIcons.syringe, const Color(0xFF4DD0E1),
                    Colors.white), // Stethoscope
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Neurology',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '  Gastroen..',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Laborato..',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Vaccinat..',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),


                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nearby Medical Centres',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
// Poți adăuga funcționalitatea dorită aici
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black38,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Container(
              height: 300, // Reduced height of the carousel
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ), // Height of the carousel
              child: PageView.builder(
                itemCount: medicalCenters.length,
                itemBuilder: (context, index) {
                  return _buildCarouselItem(medicalCenters[index]);
                },
              ),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '532 founds',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
// Poți adăuga funcționalitatea dorită aici
                  },
                  child: const Text(
                    'Default',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black38,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 350, // Înălțimea containerului pentru medici
              child: ListView( // Am folosit ListView pentru scroll
                children: medicalDoc.map((doctor) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
// Poza medicului (la stânga)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              doctor['image'] ?? 'https://via.placeholder.com/150', // Placeholder în caz de eroare
                              width: 110, // Mărim poza la 110x110
                              height: 110,
                              fit: BoxFit.cover,
                              alignment: Alignment(0.5, 0.3),
                            ),
                          ),
                          const SizedBox(width: 10), // Spațiu între poză și text

// Secțiunea cu informațiile medicului (la dreapta)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
// Numele medicului și inimioara la dreapta
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mutăm inimioara la dreapta
                                  children: [
                                    Text(
                                      doctor['name'] ?? 'Unknown',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.favorite_border, // Iconița de inimioară contur
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const Divider(color: Colors.black), // Linia de sub nume

// Specialitatea medicului
                                Text(
                                  doctor['specialty'] ?? 'Specialty Unknown',
                                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                                ),
                                const SizedBox(height: 5),

// Locație cu iconiță
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on, // Iconiță de locație
                                      color: Colors.black45,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      doctor['location'] ?? 'Location Unknown',
                                      style: const TextStyle(fontSize: 14, color: Colors.black38),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),

// Recenzii cu stea și nota
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star, // Iconiță de stea
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      doctor['rating'] ?? 'No Rating', // Asigură-te că doctor['rating'] este definit
                                      style: const TextStyle(fontSize: 14, color: Colors.black45),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      doctor['reviews'] ?? 'No Reviews',
                                      style: const TextStyle(fontSize: 14, color: Colors.black38),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(), // Creăm o listă de widget-uri Card pentru fiecare medic
              ),
            ),




          ],
        ),
      ),
    );
  }


  Widget _buildSquareCard(IconData icon, Color color, Color textColor) {
    return Stack(
      children: [
        Container(
          width: 70, // Width of the square
          height: 70, // Height of the square
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, color: textColor, size: 30), // Use FaIcon here
              const SizedBox(height: 5),
              const SizedBox(height: 2),
            ],
          ),
        ),
// Small circle in the top-left corner
        Positioned(
          top: -40,
          left: -40,
          child: Container(
            width: 80, // Adjust size as needed
            height: 80, // Adjust size as needed
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2), // Change to the desired color
              shape: BoxShape.circle, // Circular shape
            ),
          ),
        ),
      ],
    );
  }
}
Widget _buildCarouselItem(Map<String, String> center) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        Container(
          height: 150,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)), // Rounded top corners
            image: DecorationImage(
              image: NetworkImage(center['image']!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                center['name']!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.black45, size: 16),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      center['address']!,
                      style: const TextStyle(color: Colors.black45),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    center['rating']!,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black45),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.star, color: Colors.yellowAccent, size: 16),
                  const Icon(Icons.star, color: Colors.yellowAccent, size: 16),
                  const Icon(Icons.star, color: Colors.yellowAccent, size: 16),
                  const Icon(Icons.star, color: Colors.yellowAccent, size: 16),
                  const Icon(Icons.star, color: Colors.yellowAccent, size: 16),
                  const SizedBox(width: 5),
                  Text('(${center['reviews']!})', style: TextStyle(color: Colors.black45),),
                ],
              ),
              const Divider(height: 20, thickness: 1),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.directions_car, color: Colors.black45, size: 16),
                      SizedBox(width: 5),
                      Text('2.5 Km / 40 min', style: TextStyle(color: Colors.black45),) ,
                    ],
                  ),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.hospital, color: Colors.black45, size: 16),
                      SizedBox(width: 5),
                      Text('Hospital'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        useMaterial3: true,
      ),
      home: const MyHospitalPage(),
    );
  }
}
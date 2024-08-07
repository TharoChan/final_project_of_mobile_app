import 'package:final_project_of_mobile_app/constants/constants.dart';
import 'package:flutter/material.dart';

class DeveloperScreen extends StatefulWidget {
  const DeveloperScreen({super.key});

  @override
  State<DeveloperScreen> createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 65,
        title: const Text(
          "Developer",
          style: TextStyle(
            fontFamily: "AB",
            fontSize: 16,
            color: MyColors.whiteColor,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("assets/images/icon_arrow_left.png"),
        ),
      ),
      backgroundColor: MyColors.blackColor,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: const [
            ProfileCard(
              name: 'Liza John',
              specialization:
                  'CS specialized in Ecommerce Year 3 at CADT',
              description: 'Does the Developer Screen UI',
              date: 'July-3rd-2024',
              image:
                  'assets/images/developer/liza_j.png',
              recommendationStatus: false,
              cardColor: Color(0xFF8A8A8A),
            ),
            SizedBox(height: 20),
            ProfileCard(
              name: 'Tep Sovannpanha',
              specialization:
                  'CS specialized in Software Engineering Year 3 at CADT',
              description: 'Developer Screen',
              date: 'July-3rd-2024',
              image:
                  'assets/images/developer/panha.png',
              recommendationStatus: true,
              cardColor: Color(0xFF477D95),
            ),
            SizedBox(height: 20),
            ProfileCard(
              name: 'Chanrith Natvaddhtharo',
              specialization:
                  'CS specialized in Software Engineering Year 3 at CADT',
              description: 'Works on backend systems',
              date: 'July-3rd-2024',
              image:
                  'assets/images/developer/tharo.png',
              recommendationStatus: false,
              cardColor: Color(0xFF1E3264),
            ),
            SizedBox(height: 20),
            ProfileCard(
              name: 'Liza Chan',
              specialization:
                  'CS specialized in Software Engineering Year 3 at CADT',
              description: 'Frontend specialist',
              date: 'July-3rd-2024',
              image:
                  'assets/images/developer/liza_c.png',
              recommendationStatus: true,
              cardColor: Color(0xFFE13300),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  final String name;
  final String specialization;
  final String description;
  final String date;
  final String image;
  final bool recommendationStatus;
  final Color cardColor;

  const ProfileCard({
    super.key,
    required this.name,
    required this.specialization,
    required this.description,
    required this.date,
    required this.image,
    required this.recommendationStatus,
    required this.cardColor,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool isLiked = false;
  bool isRecommended = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.specialization,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            Text(
              widget.description,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 4),
            Text(
              widget.date,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 8),
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(widget.image),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                widget.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "I'm a passionate person who likes to solve problems for others but somehow can't seem to solve my own problem...",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor:
                        isLiked ? const Color(0xFF23F700) : Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.black : Colors.white,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Like',
                        style: TextStyle(
                          color: isLiked ? Colors.black : Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isRecommended = !isRecommended;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor:
                        isRecommended ? const Color(0xFF23F700) : Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isRecommended
                            ? Icons.check_circle
                            : Icons.check_circle_outline,
                        color: isRecommended ? Colors.black : Colors.white,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Recommend',
                        style: TextStyle(
                          color: isRecommended ? Colors.black : Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:final_project_of_mobile_app/data/model/grid_view.dart';
import 'package:final_project_of_mobile_app/screens/home/setting_screen.dart';
import 'package:final_project_of_mobile_app/screens/search/category_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:final_project_of_mobile_app/constants/constants.dart';
import 'package:final_project_of_mobile_app/screens/search/search_screen.dart';
import 'package:final_project_of_mobile_app/widgets/bottom_player.dart';

class SearchCategoryScreen extends StatefulWidget {
  const SearchCategoryScreen({super.key});

  @override
  State<SearchCategoryScreen> createState() => _SearchCategoryScreenState();
}

class _SearchCategoryScreenState extends State<SearchCategoryScreen> {
  String? scanResault;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SettingScreen(),
                                ),
                              );
                            },
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage("assets/images/myImage.png"),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Search",
                                  style: TextStyle(
                                    fontFamily: "AB",
                                    fontSize: 25,
                                    color: MyColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              barcodeScanner();
                            },
                            child: Image.asset("assets/images/icon_camera.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const _SearchBox(),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 17, bottom: 17),
                      child: Text(
                        "Explore New Genres",
                        style: TextStyle(
                          fontFamily: "AM",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: ExploreNewGenres(),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 10),
                      child: Text(
                        "Popular podcast categories",
                        style: TextStyle(
                          fontFamily: "AM",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width / 1.75) -
                                      50,
                              height: 100,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/news&politics.png",
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 10,
                              left: 10,
                              child: SizedBox(
                                width: 72,
                                child: Text(
                                  "News & Politics",
                                  style: TextStyle(
                                    fontFamily: "AB",
                                    fontSize: 16,
                                    color: MyColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const _ImageContainer(
                            title: "Comdey", image: "comedy.png"),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 10),
                      child: Text(
                        "Browse all",
                        style: TextStyle(
                          fontFamily: "AM",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: MyColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CategoryDetails()),
                            );
                          },
                          child: const _ImageContainer(
                              title: "", image: "pop.png"),
                        ),
                        const _ImageContainer(title: "", image: "indie.png"),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _ImageContainer(
                              title: "2023 Wrapped", image: "2023_wrapped.png"),
                          _ImageContainer(
                              title: "Podcasts", image: "podcasts.png"),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _ImageContainer(
                              title: "Made for you", image: "made_for_you.png"),
                          _ImageContainer(title: "Charts", image: "charts.png"),
                        ],
                      ),
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 130),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 64),
              child: BottomPlayer(),
            ),
          ],
        ),
      ),
    );
  }

  Future barcodeScanner() async {
    String scanResault;

    try {
      scanResault = await FlutterBarcodeScanner.scanBarcode(
          "#ffFFFF", "Cancel", false, ScanMode.QR);
    } on PlatformException {
      scanResault = "Failed to get Platform version";
    }
    if (!mounted) return;

    setState(() {
      this.scanResault = scanResault;
    });
  }
}

final List<GridViewItem> items = [
  GridViewItem(
    text: '#thai HipHop',
    img: "assets/images/thai_hiphop.png",
  ),
  GridViewItem(
    text: '#jersey club',
    img: "assets/images/jersey_club.png",
  ),
  GridViewItem(
    text: '#folk',
    img: "assets/images/folk.png",
  ),
];

class ExploreNewGenres extends StatelessWidget {
  const ExploreNewGenres({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items.map((item) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item.img,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Color.fromRGBO(96, 96, 96, 0.7),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            item.text,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 46,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: MyColors.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            child: Row(
              children: [
                Image.asset("assets/images/icon_search_black.png"),
                const SizedBox(width: 15),
                const Text(
                  "What do you want to listen to?",
                  style: TextStyle(
                    fontFamily: "AB",
                    color: MyColors.darGreyColor,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: (MediaQuery.of(context).size.width / 1.75) - 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/$image"),
              fit: BoxFit.cover,
            ),
            color: Colors.red,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: "AB",
              fontSize: 16,
              color: MyColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}

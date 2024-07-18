import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project_of_mobile_app/DI/service_locator.dart';
import 'package:final_project_of_mobile_app/bloc/playlist/playlist_bloc.dart';
import 'package:final_project_of_mobile_app/bloc/playlist/playlist_event.dart';
import 'package:final_project_of_mobile_app/constants/constants.dart';
import 'package:final_project_of_mobile_app/screens/search/playlist_search_screen.dart';
import 'package:final_project_of_mobile_app/widgets/bottom_player.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        backgroundColor: MyColors.blackColor,
      ),
      body: const SafeArea(
        bottom: false,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CustomScrollView(
                slivers: [
                  _Header(),
                  AllPop(),
                  NewPop(),
                  LatinPop(),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 100),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: BottomPlayer(),
            ),
          ],
        ),
      ),
    );
  }
}

class LatinPop extends StatelessWidget {
  const LatinPop({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Latin Pop",
              style: TextStyle(
                fontFamily: "AM",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: MyColors.whiteColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 199,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _MixChip(
                    subtitle: "La Lista Pop",
                    follower: '3,567,108 FOLLOWERS',
                    image: 'latinpop1.PNG',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  _MixChip(
                    subtitle: "Latin Pop Today",
                    follower: '1,978,364 FOLLOWERS',
                    image: 'latinpop2.PNG',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  _MixChip(
                    subtitle: "el nuevo pop",
                    follower: '282,728 FOLLOWERS',
                    image: 'latinpop3.PNG',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewPop extends StatelessWidget {
  const NewPop({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "New Pop Releases",
              style: TextStyle(
                fontFamily: "AB",
                color: MyColors.whiteColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 199,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _MixChip(
                    subtitle: "Backseat Driver",
                    follower: 'HONNE',
                    image: 'newpop1.PNG',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  _MixChip(
                    subtitle: "Vertigo",
                    follower: 'Griff',
                    image: 'newpop2.PNG',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  _MixChip(
                    subtitle: "Roadtrip",
                    follower: 'Ardhito Pramono',
                    image: 'newpop3.PNG',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AllPop extends StatelessWidget {
  const AllPop({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All Thing Pop",
              style: TextStyle(
                fontFamily: "AB",
                color: MyColors.whiteColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 199,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) {
                              var bloc = PlaylistBloc(locator.get());
                              bloc.add(PlaylistFetchEvent('Drake mix'));
                              return bloc;
                            },
                            child: const PlaylistSearchScreen(
                              cover: "Drake-Mix.jpg",
                            ),
                          ),
                        ),
                      );
                    },
                    child: const _MixChip(
                      subtitle: "Today's Top Hits",
                      follower: '34,754,032 FOLLOWERS',
                      image: 'allpop1.PNG',
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const _MixChip(
                    subtitle: "Top Throwbacks 2023",
                    follower: '634,154 FOLLOWERS',
                    image: 'allpop2.PNG',
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const _MixChip(
                    subtitle: "Mega Hit Mix",
                    follower: '7,932,499 FOLLOWERS',
                    image: 'allpop3.PNG',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 10),
        child: Text(
          "Pop",
          style: TextStyle(
            fontFamily: "AB",
            color: MyColors.whiteColor,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}

class _MixChip extends StatelessWidget {
  const _MixChip(
      {required this.subtitle, required this.follower, required this.image});
  final String subtitle;
  final String image;
  final String follower;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 153,
          width: 153,
          child: Image.asset("assets/images/$image"),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            SizedBox(
              width: 150,
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: "AM",
                  fontSize: 12.5,
                  color: MyColors.whiteColor,
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: Text(
                follower,
                style: const TextStyle(
                  fontFamily: "AM",
                  fontSize: 12,
                  color: MyColors.lightGrey,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

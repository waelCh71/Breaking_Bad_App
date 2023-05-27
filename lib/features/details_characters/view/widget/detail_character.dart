import 'package:flutter/material.dart';
import 'package:marvelcomics/features/affiche_characters/models/bbCharacters.dart';
import 'package:marvelcomics/global/theme/my_colors.dart';

class detailScreen extends StatefulWidget {
  final CharactersModel characterDetail;

  const detailScreen({super.key, required this.characterDetail});
  //detailScreen({Key? key}) : super(key: key);

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.mygrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          buildDetailList(),
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      floating: true,
      backgroundColor: myColor.mygrey,
      flexibleSpace: FlexibleSpaceBar(
          title: Text(
            widget.characterDetail.nickName,
            style: TextStyle(
                color: myColor.myWhite,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          background: Hero(
              tag: widget.characterDetail.idCharacters,
              child: Image.network(
                widget.characterDetail.image,
                fit: BoxFit.cover,
              ))),
    );
  }

  Widget buildDetailList() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          margin: const EdgeInsets.only(top: 25),
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                datailList(" Name: ", widget.characterDetail.name),
                buildDevider(350),
                datailList(
                    " JOBS: ", widget.characterDetail.ocuppation.join(" / ")),
                buildDevider(350),
                datailList(
                    " Status: ", widget.characterDetail.statusDeadOrAlive),
                buildDevider(340),
                datailList(
                    " Actor/Actress: ", widget.characterDetail.actorName),
                buildDevider(275),
                datailList(" Birthday: ", widget.characterDetail.birthday),
                buildDevider(325),
                datailList(" Apperance: ",
                    widget.characterDetail.apperanceInSeason.join(" - ")),
                buildDevider(305),
              ]),
        ),
        SizedBox(
          height: 300,
        ),
      ]),
    );
  }

  Widget datailList(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: myColor.myWhite)),
          TextSpan(
              text: value,
              style: TextStyle(fontSize: 14, color: myColor.myWhite)),
        ]));
  }

  Widget buildDevider(double endIndent) {
    return Divider(
      thickness: 2,
      color: myColor.myRed,
      height: 30,
      endIndent: endIndent,
    );
  }
}

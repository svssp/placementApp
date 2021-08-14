import 'package:flutter/material.dart';

class TeamViewWidget extends StatelessWidget {
  final Map<String, String> data;
  final double radius;

  const TeamViewWidget({Key key, @required this.data, this.radius = 120})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: FadeInImage(
              image: NetworkImage(data["image"]),
              placeholder: AssetImage("assets/images/icon.png"),
              fit: BoxFit.cover,
              height: radius,
              width: radius,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            data["name"] ?? "",
            textAlign: TextAlign.center,
          ),
          Text(
            data["role"] ?? "",
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

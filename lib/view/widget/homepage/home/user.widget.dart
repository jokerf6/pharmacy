import 'package:flutter/material.dart';

class user extends StatelessWidget {
  final double space;
  final String title;
  final String subtitle;
  final String image;
  final IconButton icon;
  final bool top;
  final int Flex;
  final bool erase;
  const user({
    super.key,
    required this.top,
    required this.space,
    required this.title,
    required this.image,
    required this.icon,
    required this.Flex,
    required this.subtitle,
    required this.erase,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
          top ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        !top
            ? Container(
                margin: const EdgeInsets.only(left: 30),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.fill),
                ),
              )
            : Image.network(
                image,
                height: 40,
                width: 40,
                fit: BoxFit.fill,
              ),
        Spacer(
          flex: Flex,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: space,
            ),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 11),
            )
          ],
        ),
        const Spacer(
          flex: 5,
        ),
        !erase ? icon : const Text(""),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class PostCell extends StatelessWidget {
  final String title;
  final String image;
  final String author;
  final String date;
  final Function() onClick;
  PostCell({
    required this.title,
    required this.image,
    required this.author,
    required this.date,
    required this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        child: Row(
          children: [
            Container(
              width: 120,
              height: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeInImage.assetNetwork(
                  image: image,
                  placeholder: 'assets/images/image_placeholder.png',
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$author, $date',
                    style: TextStyle(
                      fontSize: 10,
                    ),
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

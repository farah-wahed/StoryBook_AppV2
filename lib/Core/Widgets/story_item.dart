import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../Models/story_data.dart';
import '../Const/color_pallet.dart';
import '../Routes/page_routes_name.dart';
import '../Utils/firestore_services.dart';

class StoryItem extends StatefulWidget {
  final StoryData storyData;

  const StoryItem({super.key, required this.storyData});

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(PageRoutesName.showStory, arguments: widget.storyData);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: widget.storyData.imageUrl.startsWith('/')
                    ? FileImage(File(widget.storyData.imageUrl))
                    : AssetImage(widget.storyData.imageUrl) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 5,
            right: 5,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Text(
                    widget.storyData.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Bounceable(
                    onTap: () async {
                      setState(()  {
                        widget.storyData.isFavorite = !widget.storyData.isFavorite;
                      });
                      await FireStoreServices.updateStory(widget.storyData);
                    },
                    child: Icon(
                      widget.storyData.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: ColorPallet.primaryColor,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

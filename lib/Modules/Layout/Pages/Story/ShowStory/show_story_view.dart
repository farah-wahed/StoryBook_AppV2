import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../../../../../Core/Utils/firestore_services.dart';
import '../../../../../Models/story_data.dart';
import '../NewStory/new_story_view.dart';

class ShowStoryView extends StatefulWidget {
  const ShowStoryView({super.key});

  @override
  State<ShowStoryView> createState() => _ShowStoryViewState();
}

class _ShowStoryViewState extends State<ShowStoryView> {
  @override
  Widget build(BuildContext context) {
    final storyData = ModalRoute.of(context)!.settings.arguments as StoryData;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Story Details"),
        centerTitle: true,

        actions: [
          Bounceable(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NewStoryView(storyData: storyData),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.edit),
            ),
          ),

          Bounceable(
            onTap: () async {
              try {
                await FireStoreServices.deleteStory(storyData.storyID!);

                if (context.mounted) {
                  Navigator.pop(context);
                }
              } catch (e) {
                debugPrint("Delete Error: $e");
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: storyData.imageUrl.startsWith('/')
                        ? FileImage(File(storyData.imageUrl))
                        : AssetImage(storyData.imageUrl) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                storyData.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 8),

              Text(storyData.description, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}

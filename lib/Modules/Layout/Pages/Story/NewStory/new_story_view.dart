import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../Core/Routes/page_routes_name.dart';
import '../../../../../Core/Utils/firestore_services.dart';
import '../../../../../Core/Widgets/custome_Button.dart';
import '../../../../../Core/Widgets/custome_text_field.dart';
import '../../../../../Models/story_data.dart';
import '../../../../../gen/assets.gen.dart';

class NewStoryView extends StatefulWidget {
  final StoryData? storyData;

  const NewStoryView({super.key, this.storyData});

  @override
  State<NewStoryView> createState() => _NewStoryViewState();
}

class _NewStoryViewState extends State<NewStoryView> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  File? _selectedImage;

  @override
  void initState() {
    super.initState();

    if (widget.storyData != null) {
      _titleController.text = widget.storyData!.title;
      _descriptionController.text = widget.storyData!.description;
    }
  }


  Future<void> pickImage() async {
    final XFile? image =
    await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }


  ImageProvider getImageProvider() {
    if (_selectedImage != null) {
      return FileImage(_selectedImage!);
    }

    if (widget.storyData != null &&
        widget.storyData!.imageUrl.startsWith('/')) {
      return FileImage(File(widget.storyData!.imageUrl));
    }
    return AssetImage(Assets.image.book.path);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.storyData == null ? "New Story" : "Update Story",
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    width: double.infinity,
                    height: mediaQuery.size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                      image: DecorationImage(
                        image: getImageProvider(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Story Title",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 6),

                CustomTextFormField(
                  controller: _titleController,
                  hintText: "Enter story title...",
                  validator: (v) =>
                  v == null || v.isEmpty ? "Enter title" : null,
                ),

                const SizedBox(height: 18),

                const Text(
                  "Story Description",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 6),

                CustomTextFormField(
                  controller: _descriptionController,
                  hintText: "Write your story description...",
                  maxLines: 5,
                  validator: (v) =>
                  v == null || v.isEmpty ? "Enter description" : null,
                ),

                const SizedBox(height: 25),

                CustomButton(
                  buttonText: widget.storyData == null
                      ? "Create Story"
                      : "Update Story",
                  onPressed: saveStory,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveStory() async {
    if (!_formKey.currentState!.validate()) return;

    String imagePath;

    if (_selectedImage != null) {
      imagePath = _selectedImage!.path;
    } else {
      imagePath =
          widget.storyData?.imageUrl ?? Assets.image.book.path;
    }

    final story = StoryData(
      storyID: widget.storyData?.storyID,
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      imageUrl: imagePath,
      userId: FirebaseAuth.instance.currentUser!.uid,
    );

    try {
      if (widget.storyData == null) {
        await FireStoreServices.addNewStory(story);
      } else {
        await FireStoreServices.updateStory(story);
      }

      Navigator.of(context).pushNamedAndRemoveUntil(
        PageRoutesName.layoutRout,
            (_) => false,
      );
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
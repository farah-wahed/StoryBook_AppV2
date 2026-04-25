import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Models/story_data.dart';

class FireStoreServices {
  static const String collectionName = "Storys_table";


  static CollectionReference<StoryData> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter<StoryData>(
      fromFirestore: (snapshot, _) =>
          StoryData.fromFirestore(snapshot.data()!),
      toFirestore: (story, _) => story.toFirestore(),
    );
  }


  static Future<void> addNewStory(StoryData story) {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc();
    story.storyID = docRef.id;
    story.userId = FirebaseAuth.instance.currentUser!.uid;

    return docRef.set(story);
  }

  static Stream<QuerySnapshot<StoryData>> getAllStorysStream() {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    return getCollectionRef()
        .where("userId", isEqualTo: userId)
        .snapshots();
  }


  static Stream<QuerySnapshot<StoryData>> getFavStorysStream() {
    var userId = FirebaseAuth.instance.currentUser!.uid;

    return getCollectionRef()
        .where("userId", isEqualTo: userId)
        .where("isFavorite", isEqualTo: true)
        .snapshots();
  }


  static Future<void> updateStory(StoryData story) async {
    var docRef = getCollectionRef().doc(story.storyID);
    return docRef.update(story.toFirestore());
  }

  static Future<void> deleteStory(String storyID) async {
    var docRef = getCollectionRef().doc(storyID);
    return docRef.delete();
  }
}
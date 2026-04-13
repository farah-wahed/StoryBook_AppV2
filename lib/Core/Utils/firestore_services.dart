
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Models/story_data.dart';

class FireStoreServices {
  static const String collectionName = "Storys_table";

  static CollectionReference<StoryData> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter<StoryData>(
      fromFirestore:
          (snapshot, _) => StoryData.fromFirestore(snapshot.data()!),
      toFirestore: (StoryData, options) => StoryData.toFirestore(),
    );
  }

  static Future<void> addNewStory(StoryData StoryData) {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc();
    StoryData.storyID = docRef.id;
    return docRef.set(StoryData);
  }

  static Stream<QuerySnapshot<StoryData>> getStorysStream(String categoryID) {
    var collectionRef = getCollectionRef().where(
      "categoryID",
      isEqualTo: categoryID,
    );
    return collectionRef.snapshots();
  }
  static Stream<QuerySnapshot<StoryData>> getAllStorysStream() {
    var collectionRef = getCollectionRef();
    return collectionRef.snapshots();
  }
  static Stream<QuerySnapshot<StoryData>> getFavStorysStream() {
    var collectionRef = getCollectionRef().where(
      "isFavorite",
      isEqualTo: true,
    );
    return collectionRef.snapshots();
  }
  static Future<void> updateStory(StoryData StoryData) async {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc(StoryData.storyID);
    return docRef.update(StoryData.toFirestore());
  }
  static Future<void> deleteStory(String StoryID) async {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc(StoryID);
    return docRef.delete();

  }

}

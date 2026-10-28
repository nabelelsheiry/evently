import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/User_dm.dart';
import 'package:evently/model/event_dm.dart';

Future<void> createUserInFirestore(UserDM user) async {
  CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  userCollection.doc(user.id).set(user.toJson());
}
Future<UserDM> getUserFromFirestore(String userId) async {
  var userCollection = FirebaseFirestore.instance.collection('users');
  var userSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
  var json = userSnapshot.data();
  return UserDM.fromJson(json!);

}



addEventToUserFavorites(String eventId) {}

removeEventFromFavorites(String eventId) {}

updateUserProfile(UserDM user) {}

// getEventsByCategory(String category) {}
Future<List<EventDM>> getEventsByCategory(String category) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection("events")
      .get();

  var documents = querySnapshot.docs;

  return documents
      .map(
        (snapshot) => EventDM.fromJson(snapshot.data() as Map<String, dynamic>),
  )
      .toList();
}
deleteEventInFireStore(EventDM event) {}
updateEventInFireStore(EventDM event) {}
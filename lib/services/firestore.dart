import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference _userNotesCollection =
      FirebaseFirestore.instance.collection('user_notes');

  // Function to get the current user's UID
  String? getCurrentUserID() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  // Function to get the collection reference for the current user's notes
  CollectionReference _getCurrentUserNotesCollection() {
    final userID = getCurrentUserID();
    if (userID != null) {
      return _userNotesCollection.doc(userID).collection('notes');
    } else {
      throw Exception('User not authenticated');
    }
  }

  Future<void> addNote(String note) async {
    final currentUserNotesCollection = _getCurrentUserNotesCollection();
    await currentUserNotesCollection.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getNotesStream() {
    final currentUserNotesCollection = _getCurrentUserNotesCollection();
    return currentUserNotesCollection
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> updateNote(String docID, String newNote) async {
    final currentUserNotesCollection = _getCurrentUserNotesCollection();
    await currentUserNotesCollection.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteNote(String docID) async {
    final currentUserNotesCollection = _getCurrentUserNotesCollection();
    await currentUserNotesCollection.doc(docID).delete();
  }
}

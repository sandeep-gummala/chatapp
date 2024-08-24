import 'package:chat_app/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatServices {
  // Instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Display of users
  Stream<List<Map<String, dynamic>>> getuserStream() {
    return _firestore.collection("Users").snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) {
          final user = doc.data();
          return user;
        }).toList();
      },
    );
  }

  // Send message
  Future<void> sendMessage(String receiverID, String messageContent) async {
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // Create message
    Message newMessage = Message(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        recieverID: receiverID,
        timestamp: timestamp,
        message: messageContent, );

    // Construct chat room
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomId = ids.join('_');

    // Add new message to database
    await _firestore
        .collection("chat_rooms") // Use consistent collection name
        .doc(chatRoomId)
        .collection("messages") // Use consistent collection name
        .add(newMessage.toMap());
  }

  // Get messages
  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();

    String chatRoomID = ids.join('_');
    return _firestore
        .collection("chat_rooms") // Use consistent collection name
        .doc(chatRoomID)
        .collection("messages") // Use consistent collection name
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}

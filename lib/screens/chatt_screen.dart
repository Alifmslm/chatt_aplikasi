import 'package:chatt_aplikasi/screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatt_aplikasi/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

final _firestore = FirebaseFirestore.instance;
late User loggeInUser;

class ChatScreen extends StatefulWidget {
  static const String id = "CHAT__SCREEN";
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  TextEditingController messageTextController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  late User loggeinuser;

  late String messageText;

  late DateTime now;

  late String formatedDate;

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser!;
      if (user != null) {
        loggeInUser = user;
        print(loggeInUser.email);
      }
    } catch (e) {}
  }

  void getMessage() async {
    var messages = await _firestore.collection('messages').get();
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.forum),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context, WelcomeScreen.id);
              }),
        ],
        title: Text('Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MessageStream(),
          Container(
            decoration: KMessageContainerDecoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: messageTextController,
                    onChanged: (newValue) {
                      messageText = newValue;
                    },
                    decoration: KMessageTextFieldDecorationn,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      now = DateTime.now();
                      formatedDate = DateFormat('kk:mm:ss').format(now);
                    });
                    messageTextController.clear();
                    _firestore.collection('messages').add({
                      'text': messageText.trim(),
                      'sender': loggeInUser.email!.trim(),
                      'time': formatedDate.trim()
                    });
                  },
                  child: Text(
                    'SEND',
                    style: KsendButtonTextStyle,
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            ),
          );
        }

        final messages = snapshot.data!.docs;
        List<MessageBubbble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message['text'];
          final messageSender = message['sender'];

          final currentUserEmail = loggeInUser.email;

          final messageBubble = MessageBubbble(
            sender: messageSender,
            text: messageText,
            isMe: currentUserEmail == messageSender);
          messageBubbles.add(messageBubble);
        }
        return Expanded(child: ListView(
          reverse: true,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: messageBubbles,
        )
        );
      },
    );
  }
}

class MessageBubbble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;
  const MessageBubbble(
      {Key? key, required this.sender, required this.text, required this.isMe}
      ): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(color: Colors.black54, fontSize: 12.0),
          ),
          SizedBox(
            height: 5,
          ),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: isMe ? Radius.circular(30) : Radius.circular(0),
              topRight: isMe ? Radius.circular(0) : Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
            ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlue : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.blue,
                  fontSize: 15.0
                ),
              ),
            ),
          )
        ],
    ),
    );
  }
}


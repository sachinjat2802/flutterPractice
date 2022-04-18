import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final textFieldController = TextEditingController();
  late User loggedinUser;
  late String massage;
  bool isMe = false;

  @override
  void initState() {
    super.initState();
    currentUser();
  }

  void currentUser() {
    try {
      final user = _auth.currentUser;
      loggedinUser = user!;
      print(loggedinUser.email);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            streamBuilder(
                firestore: _firestore,
                isMe: isMe,
                loggedinUser: loggedinUser.email as String),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textFieldController,
                    onChanged: (value) {
                      massage = value;
                    },
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    _firestore.collection('massages').add(
                        {'massage': massage, 'sender': loggedinUser.email});
                    textFieldController.clear();
                  },
                  child: Text(
                    'Send',
                    style: kSendButtonTextStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class streamBuilder extends StatelessWidget {
  streamBuilder({
    required this.isMe,
    required this.loggedinUser,
    required this.firestore,
  });

  final FirebaseFirestore firestore;
  bool isMe;
  final String loggedinUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('massages').snapshots(),
        builder: (context, snapshot) {
          List<massageBubble> textWidgets = [];
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            );
          }
          final massages = snapshot.data!.docs.reversed;
          for (var massage in massages) {
            print(massage.data());
            final messageText = massage['massage'];
            final messageSender = massage['sender'];
            if (messageSender == loggedinUser) {
              isMe = true;
            }
            final textWidget = massageBubble(messageSender, messageText, isMe);
            textWidgets.add(textWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              children: textWidgets,
            ),
          );

          return Text('hi');
        });
  }
}

class massageBubble extends StatelessWidget {
  massageBubble(this.messageSender, this.messageText, this.isMe);
  String messageSender;

  String messageText;
  bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            messageSender,
            style: TextStyle(fontSize: 8.0, color: Colors.grey),
          ),
          Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 5.0,
              color: isMe ? Colors.lightBlueAccent : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$messageText',
                  style: TextStyle(
                      fontSize: 30, color: isMe ? Colors.white : Colors.black),
                ),
              )),
        ],
      ),
    );
  }
}

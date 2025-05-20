import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {



    final userName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Hii $userName!'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/');
                print('Icon Pressed');
              }, 
              icon: const Icon(Icons.logout)),

        ],
      ),

      body: Column(
        children: [
          Expanded(
           

            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {

              return ChatBubble(
              
                alignment: index  % 2 == 0 
                    ?Alignment.centerLeft
                    : Alignment.centerRight,
                    
                entity: ChatMessageEntity( 
                  id: '1234',
                  text: 'Hello, this is Elton Bernil',
                  createdAt: DateTime.now().microsecondsSinceEpoch,
                  author: Author(username: 'Elton Bernil',),
                  imageUrl: '', // Provide a valid image URL or leave empty if not needed
                  ));
            })),
            
        ChatInput(),
        ],
      ),
    );
  }
}
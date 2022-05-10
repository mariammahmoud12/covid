import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/message_model.dart';
import '../../../shared/components/constants.dart';
import 'chat_states.dart';

class ChatCubit extends Cubit<ChatStates>{
  ChatCubit():super(ChatInitialState());

  static ChatCubit get(context)=> BlocProvider.of(context);

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
    String? image,
  })
  {
    MessageModel message = MessageModel(
      senderId: userModel!.uId,
      receiverId: receiverId,
      dateTime: dateTime,
      text: text,
      image: image??'',
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(message.toMap())
        .then((value)
    {
      print('trueee');
      emit(ChatSendMessageSuccessState());
    })
        .catchError((error)
    {
      print(error.toString());
      emit(ChatSendMessageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel!.uId)
        .collection('messages')
        .add(message.toMap())
        .then((value)
    {
      print('trueee');
      emit(ChatSendMessageSuccessState());
    })
        .catchError((error)
    {
      print(error.toString());
      emit(ChatSendMessageErrorState());
    });

  }

  List<MessageModel>? messages;

  void getMessages({
    required String receiverId,
  })
  {
    if(messages == null) {
      emit(ChatGetMessagesLoadingState());
    }

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event)
    {
      messages = [];
      for (var element in event.docs) {
        messages!.add(MessageModel.fromJson(element.data()));
      }

      print('message');
      emit(ChatGetMessagesSuccessState());
    });
  }
}
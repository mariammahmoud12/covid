import 'package:covid19/models/message_model.dart';
import 'package:covid19/modules/messenger_screen/cubit/chat_cubit.dart';
import 'package:covid19/modules/messenger_screen/cubit/chat_states.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:covid19/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../models/user_model.dart';

class ChatDetailsScreen extends StatelessWidget {
  final UserModel model;

  ChatDetailsScreen({Key? key, required this.model}) : super(key: key);

  var messageController = TextEditingController();
  var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => ChatCubit()..getMessages(receiverId: model.uId!),
          child: BlocConsumer<ChatCubit, ChatStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if(scrollController.positions.isNotEmpty){
                scrollController.jumpTo(scrollController.position.maxScrollExtent);
              }
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: DarkBlueColor,
                  titleSpacing: 0.0,
                  title: Row(
                    children: [
                      const CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                          'https://static.remove.bg/remove-bg-web/a8b5118d623a6b3f4b7813a78c686de384352145/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg',
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        model.name!,
                      ),
                    ],
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      if (state is ChatGetMessagesLoadingState || ChatCubit.get(context).messages == null || ChatCubit.get(context).messages!.isEmpty)
                        const Expanded(
                          child: Center(
                            child: Text(
                              'No Messages Yet',
                            ),
                          ),
                        ),
                      if (state is! ChatGetMessagesLoadingState &&
                          ChatCubit.get(context).messages != null &&
                          ChatCubit.get(context).messages!.isNotEmpty)
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  controller: scrollController,
                                  itemBuilder: (context, index) {
                                    var message = ChatCubit.get(context).messages![index];

                                    if (message.image!.isNotEmpty) {
                                      if (userModel!.uId != message.receiverId) {
                                        return buildMyPhoto(message, context);
                                      }

                                      return buildPhoto(message, context);
                                    } else {
                                      if (userModel!.uId != message.receiverId) {
                                        return buildMyMessage(message, context);
                                      }

                                      return buildMessage(message, context);
                                    }
                                  },
                                  separatorBuilder: (context, index) => const SizedBox(
                                    height: 15.0,
                                  ),
                                  itemCount: ChatCubit.get(context).messages!.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: TextFormField(
                                    controller: messageController,
                                    decoration: const InputDecoration(
                                      hintText: 'type your message here ...',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50.0,
                                color: DarkBlueColor,
                                child: MaterialButton(
                                  onLongPress: () {},
                                  onPressed: () {
                                    if (userModel != null) {
                                      ChatCubit.get(context).sendMessage(
                                        receiverId: 'BAK0NeQiLGbLbBTmgAsbVW3QII03',
                                        dateTime: DateTime.now().toString(),
                                        text: messageController.text,
                                      );

                                      messageController.text = '';
                                    } else {
                                      // ChatCubit.get(context).uploadMessageImage(
                                      //   receiverId: userModel.uId,
                                      //   dateTime: DateTime.now().toString(),
                                      // );
                                    }

                                    scrollController.jumpTo(scrollController.position.maxScrollExtent);
                                  },
                                  minWidth: 1.0,
                                  child: const Icon(
                                    Icons.send,
                                    size: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildMessage(MessageModel message, context) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(
                10.0,
              ),
              topEnd: Radius.circular(
                10.0,
              ),
              bottomEnd: Radius.circular(
                10.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text!,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                DateFormat('dd/MM/yyyy, hh:mm a').format(DateTime.parse(message.dateTime!)),
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      );

  Widget buildPhoto(MessageModel message, context) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(
                10.0,
              ),
              topEnd: Radius.circular(
                10.0,
              ),
              bottomEnd: Radius.circular(
                10.0,
              ),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://static.remove.bg/remove-bg-web/a8b5118d623a6b3f4b7813a78c686de384352145/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg',
              ),
            ),
          ),
        ),
      );

  Widget buildMyMessage(MessageModel message, context) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
            color: DarkBlueColor.withOpacity(
              .5,
            ),
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(
                10.0,
              ),
              topEnd: Radius.circular(
                10.0,
              ),
              bottomStart: Radius.circular(
                10.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text!,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                DateFormat('dd/MM/yyyy, hh:mm a').format(DateTime.parse(message.dateTime!)),
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      );

  Widget buildMyPhoto(MessageModel message, context) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(
                10.0,
              ),
              topEnd: Radius.circular(
                10.0,
              ),
              bottomStart: Radius.circular(
                10.0,
              ),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://static.remove.bg/remove-bg-web/a8b5118d623a6b3f4b7813a78c686de384352145/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg',
              ),
            ),
          ),
        ),
      );
}

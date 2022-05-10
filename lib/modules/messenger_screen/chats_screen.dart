import 'package:covid19/models/user_model.dart';
import 'package:covid19/modules/messenger_screen/chat_details_screen.dart';
import 'package:covid19/shared/components/components.dart';
import 'package:covid19/shared/cubit/app_cubit.dart';
import 'package:covid19/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) => Column(
        children: [
          if (state is! AppGetChatsLoadingState && AppCubit.get(context).chats != null && AppCubit.get(context).chats!.isNotEmpty)
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildChatItem(AppCubit.get(context).chats![index],context),
                itemCount: AppCubit.get(context).chats!.length,
              ),
            ),
          if (state is AppGetChatsLoadingState)
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          if (state is! AppGetChatsLoadingState && AppCubit.get(context).chats != null && AppCubit.get(context).chats!.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  'NoHave Chats',
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildChatItem(UserModel model,context) => InkWell(
        onTap: () {
          navigator(context, ChatDetailsScreen(model: model,));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 25.0,
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
      );
}

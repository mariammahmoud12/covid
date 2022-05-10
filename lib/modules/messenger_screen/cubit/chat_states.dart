
abstract class ChatStates{}

class ChatInitialState extends ChatStates{}

class ChatSendMessageSuccessState extends ChatStates{}

class ChatSendMessageErrorState extends ChatStates{}

class ChatGetMessagesLoadingState extends ChatStates{}

class ChatGetMessagesSuccessState extends ChatStates{}

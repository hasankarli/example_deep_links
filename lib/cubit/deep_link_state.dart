part of 'deep_link_cubit.dart';

@immutable
abstract class DeepLinkState {
  const DeepLinkState();
}

class DeepLinkInitial extends DeepLinkState {
  const DeepLinkInitial();
}

class DeepLinkProductScreen extends DeepLinkState {
  final String productId;
  const DeepLinkProductScreen(this.productId);
}

class DeepLinkChatScreen extends DeepLinkState {
  final String chatId;
  const DeepLinkChatScreen(this.chatId);
}

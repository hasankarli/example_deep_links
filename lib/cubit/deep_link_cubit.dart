import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uni_links/uni_links.dart';

part 'deep_link_state.dart';

class DeepLinkCubit extends Cubit<DeepLinkState> {
  StreamSubscription _sub;

  DeepLinkCubit() : super(DeepLinkInitial());

  Future<Null> initUniLinks() async {
    try {
      _sub = getLinksStream().listen((String link) {
        if (link.contains("product")) {
          // www.example.com/product=120
          var productId = link.split("=")[1];
          emit(DeepLinkProductScreen(productId));
        } else {
          // www.example.com/chat=10
          var chatId = link.split("=")[1];
          emit(DeepLinkChatScreen(chatId));
        }
      }, onError: (err) {
        print('Deep Link @error : $err');
      });

      String initialLink = await getInitialLink();
      if (initialLink != null && initialLink != "") {
        print('intialLink:: $initialLink');
        if (initialLink.contains("product")) {
          // www.example.com/product=120
          var productId = initialLink.split("=")[1];
          emit(DeepLinkProductScreen(productId));
        } else {
          // www.example.com/chat=10
          var chatId = initialLink.split("=")[1];
          emit(DeepLinkChatScreen(chatId));
        }
      }
    } on PlatformException {
      print('Deep Link @error');
    }
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}

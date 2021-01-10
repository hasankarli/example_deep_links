import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_screen.dart';
import 'cubit/deep_link_cubit.dart';
import 'product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DeepLinkCubit deepLinkCubit = DeepLinkCubit();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      await deepLinkCubit.initUniLinks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: deepLinkCubit,
      child: MaterialApp(
        title: 'Deep Link Example',
        home: BlocListener<DeepLinkCubit, DeepLinkState>(
          listener: (context, state) {
            if (state is DeepLinkProductScreen) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductScreen(
                  productId: state.productId,
                ),
              ));
            } else if (state is DeepLinkChatScreen) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChatScreen(
                  chatId: state.chatId,
                ),
              ));
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('Deep Link'),
            ),
            body: Center(
              child: Container(
                child: Text('Hello World'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

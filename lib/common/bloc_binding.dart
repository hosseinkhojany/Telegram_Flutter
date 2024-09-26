import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:telegram_flutter/data/datasources/remote/chat_datasource.dart';
import 'package:telegram_flutter/data/datasources/remote/user_datasource.dart';
import 'package:telegram_flutter/data/repositories/chat_repository.dart';
import '../data/config/logging_interceptor.dart';
import '../data/config/stream_socket.dart';
import '../data/repositories/user_repository.dart';
import '../domain/chat/chat_bloc.dart';
import '../domain/socket/socket_bloc.dart';
import '../domain/user/user_bloc.dart';

class AppBindingsBloc extends StatelessWidget {
  final Widget child;

  AppBindingsBloc({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        lazy: true,
        create: (context) {
          return SocketBloc(Get.find());
        },
      ),
      BlocProvider(
        lazy: true,
        create: (context) {
          return UserBloc(Get.find(), Get.find());
        },
      ),
      BlocProvider(
        lazy: true,
        create: (context) {
          return ChatBloc(Get.find());
        },
      ),
    ], child: child);
  }
}

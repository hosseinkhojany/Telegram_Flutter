import 'package:get/get.dart';
import 'package:telegram_flutter/data/datasources/local/app_database.dart';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:telegram_flutter/data/datasources/remote/chat_datasource.dart';
import 'package:telegram_flutter/data/datasources/remote/user_datasource.dart';
import 'package:telegram_flutter/data/repositories/chat_repository.dart';
import '../data/config/logging_interceptor.dart';
import '../data/config/stream_socket.dart';
import '../data/repositories/user_repository.dart';
import '../domain/controller/emoji_controller.dart';

class GetxBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => EmojiController());
    Get.lazyPut(() => AppDatabase());
    Get.lazyPut(() => StreamSocket());
    Get.lazyPut(() => IO.io(
        'https://commander009.herokuapp.com/',
        // "http://localhost:3000",
        OptionBuilder()
            .setTimeout(30 * 1000)
            .setTransports(['websocket'])
        // .setExtraHeaders({'foo': 'bar'})
            .disableAutoConnect()
            .build()));
    Get.lazyPut(() {
      final options = BaseOptions(
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer abcdxyz',
          'Content-Type': 'application/json',
          "Access-Control-Allow-Credentials": true,
          "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
        baseUrl: "https://commander009.herokuapp.com",
        // baseUrl: "http://localhost:3000",
        connectTimeout: 10000,
        receiveTimeout: 10000,
        sendTimeout: 10000,
      );

      var dios = Dio(options);
      dios.interceptors.add(LoggingInterceptor());
      return dios;
    });
    Get.lazyPut(() => ChatRepository(ChatDataSource(Get.find(), Get.find(), Get.find(), Get.find())));
    Get.lazyPut(() => UserRepository(UserDataSource(Get.find(), Get.find())));
  }
}
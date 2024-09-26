import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:telegram_flutter/data/models/history.dart';

import '../../config/stream_socket.dart';
import '../../models/base_model.dart';
import '../../models/message.dart';
import '../local/app_database.dart';
import '../local/sharedStore.dart';

class ChatDataSource {

  final Socket socket;
  final StreamSocket streamSocket;
  final Dio dio;
  final AppDatabase appDatabase;

  ChatDataSource(this.appDatabase, this.dio, this.socket, this.streamSocket);

  Stream<BaseMessageModel> listen() {
    socket.on('new message', (data) {
      debugPrint("new message:$data");
      appDatabase.insertMessage(MessageModel.fromJson(data));
      streamSocket.addResponse.call(MessageModel.fromJson(data));
    });
    socket.on('user joined', (data) {
      debugPrint("user joined:$data");
      streamSocket.addResponse.call(UserJoinedModel.fromJson(data));
    });
    socket.on('typing', (data) {
      debugPrint("typing:$data");
      streamSocket.addResponse.call(UserTypingModel.fromJson(data));
    });
    socket.on('stop typing', (data) {
      debugPrint("stop typing:$data");
      streamSocket.addResponse.call(UserTypingStopModel.fromJson(data));
    });
    socket.on('user left', (data) {
      debugPrint("user left:$data");
      streamSocket.addResponse.call(UserLeftModel.fromJson(data));
    });
    return streamSocket.getResponse;
  }

  Future<String?> downloadImage(String id) async {
    try {
      var response = await dio.get('/downloadImage', queryParameters: { "id": id});
      if (response.statusCode == 200) {
        return response.data['data'][0]['data'];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> uploadImage(String base64Image) async {
    try {
      var response = await dio.post('/uploadImage', data: { "chatId": "global", "realName": "", "username": SharedStore.getUserName(), "data": base64Image});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> sendMessage(String message, String messageType) {
    try {
      debugPrint("ME:$message");
      debugPrint("ME:$message");
      socket.emit("new message", {"realName": SharedStore.getUserName(), "message": message, "messageType": messageType});
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<bool> sendJoin(String userName) {
    try {
      debugPrint("ME:$userName");
      socket.emit("add user", userName);
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<BaseModel> sendLogin(bool createAccount, String userName, String password) async {
    try{
      var response = await dio.post('/login', data: { "username": userName, "password": password, "createAccount": createAccount ? "truee" : "falsee"});
      if (response.statusCode == 200) {
        return BaseModel.fromJson(response.data);
      } else {
        return BaseModel(false, "if you are in (Iran, Syria, Cuba, South Korea) make sure VPN connected");
      }
    }catch(e){
      return BaseModel(false, "if you are in (Iran, Syria, Cuba, South Korea) make sure VPN connected");
    }
  }


  Future<BaseModel> sendUpdateProfile(String userName, String avatar) async {
    try{
      var response = await dio.post('/login', data: { "username": userName, "avatar": avatar});
      if (response.statusCode == 200) {
        return BaseModel.fromJson(response.data);
      } else {
        return BaseModel(false, "if you are in (Iran, Syria, Cuba, South Korea) make sure VPN connected");
      }
    }catch(e){
      return BaseModel(false, "if you are in (Iran, Syria, Cuba, South Korea) make sure VPN connected");
    }
  }


  Future<List<BaseMessageModel>?> getHistory(int page) async {
    try{
      var response = await dio.get('/history', queryParameters: { "username": userName, "page": page});
      if (response.statusCode == 200) {
        return History.fromJson(response.data).history;
      } else {
        return null;
      }
    }catch(e){
      return null;
    }
  }

  Future<bool> sendLeft() {
    try {
      debugPrint("ME: Disconnect");
      socket.emit("disconnect");
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<bool> sendTyping() {
    try {
      debugPrint("ME: Typing");
      socket.emit("typing");
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<bool> sendTypingStop() {
    try {
      debugPrint("ME: Stop typing");
      socket.emit("stop typing");
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  void disposeAll(Function action){
    socket.onDisconnect((_) {
      debugPrint('onDisconnect');
      action.call();
    });
    socket.disconnect();
    socket.dispose();
    streamSocket.dispose();
  }

  void connectToSocket(Function action){
    socket.onConnect((_) {
      debugPrint('onConnect');
      action.call();
    });
    socket.connect();
  }

  void socketConnecting(Function action){
    socket.onConnecting((_) {
      debugPrint('onConnecting');
      action.call();
    });
  }

  socketConnectionFailed(Function action) {
    socket.onConnectError((_) {
      debugPrint('onConnectError');
      action.call();
    });
    socket.onConnectTimeout((_) {
      debugPrint('onConnectTimeout');
      action.call();
    });
  }

}

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:lottie/lottie.dart';

import '../../../common/gen/assets.gen.dart';
import '../../../common/gen/colors.gen.dart';
import '../../../data/models/message.dart';
import '../../../domain/chat/chat_bloc.dart';

class MessageWidget extends StatefulWidget {
  double width = 0, height = 60;

  final BaseMessageModel message;

  MessageWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.message})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MessageWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.width == 0) {
      widget.width = MediaQuery.of(context).size.width;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.message.runtimeType) {
      case MessageModel:
        {
          MessageModel message = widget.message as MessageModel;
          switch (message.messageType) {
            case "text":
              {
                return addNewMessage(
                  message,
                  Align(
                    alignment: message.my
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: 400,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: message.my
                            ? BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(1))
                            : BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(1),
                                bottomRight: Radius.circular(20)),
                        shape: BoxShape.rectangle,
                        gradient: LinearGradient(
                          colors: [
                            ColorName.gradientColor1,
                            ColorName.gradientColor2,
                            ColorName.gradientColor3,
                            ColorName.gradientColor4,
                          ],
                          begin: Alignment(-1.0, -2.0),
                          end: Alignment(1.0, 2.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          //todo in group should show name
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Container(
                          //     padding: EdgeInsets.all(10),
                          //     child: Text(message.userName ?? ""),
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                message.message ?? "",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            case "lottie":
              return addNewMessage(
                message,
                Align(
                  alignment:
                      message.my ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Lottie.asset("assets/tgs/${message.message}"),
                  ),
                ),
              );
            case "image":
              return addNewMessage(
                message,
                Align(
                  alignment:
                      message.my ? Alignment.centerRight : Alignment.centerLeft,
                  child: BlocBuilder<ChatBloc, ChatState>(
                    builder: (context, state) {
                      if (state is ChatImageDownloadedState) {
                        return state.value?.isNotEmpty == true
                            ? Image.memory(base64Decode(state.value!))
                            : /*todo download failed*/ Container();
                      } else {
                        return SizedBox(
                          height: 200,
                          width: 200,
                          child: Card(
                            color: Colors.transparent,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Stack(
                              children: [
                                Assets.images.image.image(),
                                Center(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white10.withOpacity(0.4),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(99),
                                      ),
                                    ),
                                    child: BackdropFilter(
                                      blendMode: BlendMode.darken,
                                      filter: ImageFilter.blur(
                                          sigmaX: 10.0, sigmaY: 10.0),
                                      child: InkWell(
                                        onTap: (state is ChatImageDownloadingState) ? null : () {
                                                context.read<ChatBloc>().add(ChatImageDownloadEvent(message.message ?? ""));
                                              },
                                        child: (state is ChatImageDownloadingState)
                                                ? CircularProgressIndicator(value: 8,color: Colors.white,)
                                                : Icon(Icons.download),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              );
            default:
              return addNewMessage(message, Text("message not supported"));
          }
        }
      case UserJoinedModel:
        {
          UserJoinedModel message = widget.message as UserJoinedModel;
          return addNewMessage(
            null,
            Center(
              child: Wrap(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(999),
                      ),
                      color: Colors.greenAccent,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.greenAccent,
                            spreadRadius: 2,
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (message.userName ?? "") + " joined",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      case UserLeftModel:
        {
          UserLeftModel message = widget.message as UserLeftModel;
          return addNewMessage(
            null,
            Center(
              child: Wrap(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(999),
                      ),
                      color: Colors.redAccent,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.redAccent,
                            spreadRadius: 2,
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (message.userName ?? "") + " left",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      default:
        {
          MessageModel message =
              MessageModel(userName: "System", message: "Unsupported message");
          return addNewMessage(
            message,
            Card(
              child: Container(
                width: 400,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(message.message ?? ""),
                ),
              ),
            ),
          );
        }
    }
  }

  Widget addNewMessage(MessageModel? header, Widget child) {
    return SliverStickyHeader(
      overlapsContent: true,
      header: header != null
          ? header.my
              ? MySideHeader()
              : _SideHeader(message: header)
          : MySideHeader(),
      sliver: SliverPadding(
        padding: const EdgeInsets.only(left: 60),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(10),
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SideHeader extends StatelessWidget {
  MessageModel message;

  _SideHeader({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 44.0,
          width: 44.0,
          child: CircleAvatar(
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Colors.white,
            child: Text(message.userName ?? "null"),
          ),
        ),
      ),
    );
  }
}

class MySideHeader extends StatelessWidget {
  const MySideHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

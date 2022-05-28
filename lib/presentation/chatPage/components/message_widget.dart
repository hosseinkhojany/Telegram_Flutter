import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:lottie/lottie.dart';
import 'package:telegram_flutter/core/data/models/message.dart';
import 'package:telegram_flutter/core/utils/consts.dart';

import '../../../gen/colors.gen.dart';

class MessageWidget extends StatefulWidget {
  double width = 0, height = 60;

  final MessageModel message;

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
      case Message:
        {
          Message message = widget.message as Message;
          switch (message.messageType) {
            case "text":
              {
                return addNewMessage(
                  message,
                  Align(
                    alignment: message.my
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(5),
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
                  ),
                );
              }
            case "lottie":
              return addNewMessage(
                  message,
                  Align(alignment:
                  message.my
                  ? Alignment.centerRight
                    : Alignment.centerLeft,
                    child: Container(
                    height: 150,
                    width: 150,
                    child: Lottie.asset("assets/tgs/${message.message}"),
                  ),),);
            default:
              return addNewMessage(message, Text("message not supported"));
          }
        }
      case UserJoined:
        {
          UserJoined message = widget.message as UserJoined;
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
      case UserLeft:
        {
          UserLeft message = widget.message as UserLeft;
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
          Message message =
              Message(userName: "System", message: "Unsupported message");
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

  Widget addNewMessage(Message? header, Widget child) {
    return SliverStickyHeader(
      overlapsContent: true,
      header: header != null ? header.my ? MySideHeader() : _SideHeader(message: header) : MySideHeader(),
      sliver: SliverPadding(
        padding: const EdgeInsets.only(left: 60),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [child],
          ),
        ),
      ),
    );
  }
}

class _SideHeader extends StatelessWidget {
  Message message;

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

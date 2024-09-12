import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:telegram_flutter/common/utils/ext.dart';
import 'package:telegram_flutter/presentation/chatListPage/chat_list_page.dart';
import 'package:telegram_flutter/presentation/chatPage/chat_page.dart';
import 'package:telegram_flutter/presentation/take_picture.dart';

import '../../common/gen/assets.gen.dart';
import '../../common/gen/colors.gen.dart';
import '../globalWidgets/advanceDrawerMenu/src/controller.dart';
import '../globalWidgets/advanceDrawerMenu/src/widget.dart';

class MergedChatListChatPageScreen extends StatefulWidget {
  MergedChatListChatPageScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MergedChatListChatPageScreenState();
  }
}

class MergedChatListChatPageScreenState
    extends State<MergedChatListChatPageScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  bool isHaveOpeningChat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdvancedDrawer(
        backdropColor: ColorName.sideMenuBackground,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: DrawerMenuItems(
            advancedDrawerController: _advancedDrawerController),
        child: responsiveChooser(),
      ),
    );
  }

  Widget responsiveChooser() {
    Widget widget = Container();
    if (context.isHorizontalScreen()) {
      //use horizontal |
      if (isHaveOpeningChat) {
        //open fullscreen chat page
        widget = ChatListPage(
          onMenuClicked: () {
            _advancedDrawerController.showDrawer();
          },
        );
      } else {
        //open fullscreen chat list page
        widget = const ChatPage();
      }
    } else {
      widget = Row(children: [
        Expanded(child: ChatListPage(
          onMenuClicked: () {
            _advancedDrawerController.showDrawer();
          },
        )),
        const Expanded(child: ChatPage())
      ]);
    }
    return widget;
  }
}

class DrawerMenuItems extends StatefulWidget {
  final advancedDrawerController;

  const DrawerMenuItems({Key? key, this.advancedDrawerController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DrawerMenuItemsState();
  }
}

class DrawerMenuItemsState extends State<DrawerMenuItems>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 150),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.slowMiddle,
  );
  late CameraController _cameraController;

  late Future<void> _initializeControllerFuture;

  bool showProfileEdit = false;
  bool showProfileEditCurrentHover = false;

  // @override
  // void initState() {
  //   super.initState();
  //
  //   _cameraController = CameraController(
  //     // Get a specific camera from the list of available cameras.
  //     widget.camera,
  //     ResolutionPreset.high,
  //   );
  //   _initializeControllerFuture = _cameraController.initialize();
  // }

  @override
  void dispose() {
    _controller.dispose();
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // USER AVATAR -------------------
            Container(
              margin: const EdgeInsets.only(
                top: 24.0,
                bottom: 64.0,
              ),
              width: 128.0,
              height: 128.0,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        onTap: () {},
                        onHover: (value) {
                          showProfileEditCurrentHover = value;
                          if (value) {
                            if (!showProfileEdit) {
                              setState(() {
                                showProfileEdit = true;
                                _controller.reset();
                                _controller.animateTo(1);
                              });
                            }
                          } else {
                            Future.delayed(const Duration(milliseconds: 300),
                                () {
                              if (showProfileEdit &&
                                  !showProfileEditCurrentHover) {
                                setState(() {
                                  showProfileEdit = false;
                                  _controller.reset();
                                  _controller.animateTo(1);
                                });
                              }
                            });
                          }
                        },
                        child: Image.asset('assets/images/b.png',
                        fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  if (showProfileEdit)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: ScaleTransition(
                        alignment: Alignment.center,
                        scale: _animation,
                        child: InkWell(
                          onTap: () => debugPrint('onTap'),
                          onHover: (value) {
                            showProfileEditCurrentHover = value;
                            if (value) {
                              showProfileEdit = true;
                            } else {
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
                                if (!showProfileEditCurrentHover) {
                                  setState(() {
                                    showProfileEdit = false;
                                    _controller.reset();
                                    _controller.animateTo(0);
                                  });
                                }
                              });
                            }
                          },
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 14.0, left: 14.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: PopupMenuButton(
                              tooltip: "Edit Profile",
                              icon: const Icon(Icons.edit),
                              iconSize: 18.0,
                              onSelected: (value) {
                                debugPrint('$value');
                                _handleMenuItemSelect(value);
                              },
                              onCanceled: () => debugPrint('onCanceled'),
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 1,
                                  child: Text('Camera'),
                                  // Row(
                                  //     mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  //     children: const [
                                  //       Text('Camera'),
                                  //       Icon(Icons.camera_alt_rounded,
                                  //           size: 24)
                                  //     ]),
                                ),
                                PopupMenuItem(
                                    value: 2,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('Files'),
                                          Icon(Icons.photo_library_rounded,
                                              size: 24)
                                        ])),
                                PopupMenuItem(
                                    value: 3,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Pokemons'),
                                          Assets.images.pokemonIcons
                                              .image(height: 24, width: 24)
                                        ])),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),

            // MENU ITEMS --------------------

            const ListTile(
              leading: Icon(Icons.account_circle_rounded),
              title: Text("Accounts"),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text("Contacts"),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text("Settings"),
            ),
            PopupMenuButton(
              tooltip: "Edit Profile",
              icon: const Icon(Icons.edit),
              iconSize: 18.0,
              onSelected: (value) {
                debugPrint('$value');
                _handleMenuItemSelect(value);
              },
              onCanceled: () => debugPrint('onCanceled'),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Camera'),
                  // Row(
                  //     mainAxisAlignment:
                  //     MainAxisAlignment.spaceBetween,
                  //     children: const [
                  //       Text('Camera'),
                  //       Icon(Icons.camera_alt_rounded,
                  //           size: 24)
                  //     ]),
                ),
                PopupMenuItem(
                    value: 2,
                    child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Files'),
                          Icon(Icons.photo_library_rounded,
                              size: 24)
                        ])),
                PopupMenuItem(
                    value: 3,
                    child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Pokemons'),
                          Assets.images.pokemonIcons
                              .image(height: 24, width: 24)
                        ])),
              ],
            ),
            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: const Text('Terms of Service | Privacy Policy'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleMenuItemSelect(value) async {
    switch (value) {
      case '1':
        final cameras = await availableCameras();

        final firstCamera = cameras.first;
        debugPrint('camera');
        _openCamera(firstCamera);

        break;
      case '2':
        //files

        break;
      case '3':
        //pokemon
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => PokemonPage()
        //   ),
        // );
        break;
    }
  }

  void _openCamera(camera) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TakePictureScreen(camera: camera)));
    widget.advancedDrawerController.hideDrawer();
  }
}

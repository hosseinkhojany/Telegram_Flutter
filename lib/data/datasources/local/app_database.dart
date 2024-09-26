import 'package:drift/drift.dart';
import 'package:telegram_flutter/data/config/drift/connection/connection.dart' as impl;
import 'package:telegram_flutter/data/models/conversation_model.dart';

import '../../models/message.dart';
part 'app_database.g.dart';

@DriftDatabase(
  include: {'database_shema.drift'},
)
class AppDatabase extends _$AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() => _instance;

  AppDatabase._internal() : super(impl.connect().executor);



  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(

      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }


  Future<int> insertMessage(MessageModel message) async {
    return into(messageTable).insert(
      MessageTableCompanion(
        id: Value(message.id ?? ""),
        realName: Value(message.realName ?? ""),
        username: Value(message.userName ?? ""),
        message: Value(message.message ?? ""),
        messageType: Value(message.messageType ?? ""),
        createdAt: Value(message.createdAt ?? ""),
        updatedAt: Value(message.updatedAt ?? ""),
        edited: Value(message.edited ?? false),
        deleted: Value(message.deleted ?? false),
      ),
    );
  }

  Future<int> insertConversation(ConversationModel conversationModel) async {
    return into(conversationTable).insert(
      ConversationTableCompanion(
        id: Value(conversationModel.id ?? ""),
        collectionName: Value(conversationModel.collectionName ?? ""),
        conversationType: Value(conversationModel.conversationType ?? ""),
        name: Value(conversationModel.name ?? ""),
        avatar: Value(conversationModel.avatar ?? ""),
        bio: Value(conversationModel.bio ?? ""),
        peopleCount: Value(conversationModel.peopleCount ?? 0),
      ),
    );
  }

  Future<int> upsertProfile(ConversationModel conversationModel) async {
    return into(conversationTable).insert(
      ConversationTableCompanion(
        id: Value(conversationModel.id ?? ""),
        collectionName: Value(conversationModel.collectionName ?? ""),
        conversationType: Value(conversationModel.conversationType ?? ""),
        name: Value(conversationModel.name ?? ""),
        avatar: Value(conversationModel.avatar ?? ""),
        bio: Value(conversationModel.bio ?? ""),
        peopleCount: Value(conversationModel.peopleCount ?? 0),
      ),
    );
  }




}

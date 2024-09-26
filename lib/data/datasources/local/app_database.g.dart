// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ConversationTableData extends DataClass
    implements Insertable<ConversationTableData> {
  final String id;
  final String conversationType;
  final String? collectionName;
  final String? name;
  final String? avatar;
  final String? bio;
  final int? peopleCount;
  ConversationTableData(
      {required this.id,
      required this.conversationType,
      this.collectionName,
      this.name,
      this.avatar,
      this.bio,
      this.peopleCount});
  factory ConversationTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ConversationTableData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}_id'])!,
      conversationType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}conversationType'])!,
      collectionName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}collectionName']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      avatar: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar']),
      bio: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bio']),
      peopleCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}peopleCount']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<String>(id);
    map['conversationType'] = Variable<String>(conversationType);
    if (!nullToAbsent || collectionName != null) {
      map['collectionName'] = Variable<String?>(collectionName);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String?>(avatar);
    }
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String?>(bio);
    }
    if (!nullToAbsent || peopleCount != null) {
      map['peopleCount'] = Variable<int?>(peopleCount);
    }
    return map;
  }

  ConversationTableCompanion toCompanion(bool nullToAbsent) {
    return ConversationTableCompanion(
      id: Value(id),
      conversationType: Value(conversationType),
      collectionName: collectionName == null && nullToAbsent
          ? const Value.absent()
          : Value(collectionName),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      avatar:
          avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
      bio: bio == null && nullToAbsent ? const Value.absent() : Value(bio),
      peopleCount: peopleCount == null && nullToAbsent
          ? const Value.absent()
          : Value(peopleCount),
    );
  }

  factory ConversationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConversationTableData(
      id: serializer.fromJson<String>(json['_id']),
      conversationType: serializer.fromJson<String>(json['conversationType']),
      collectionName: serializer.fromJson<String?>(json['collectionName']),
      name: serializer.fromJson<String?>(json['name']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      bio: serializer.fromJson<String?>(json['bio']),
      peopleCount: serializer.fromJson<int?>(json['peopleCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'conversationType': serializer.toJson<String>(conversationType),
      'collectionName': serializer.toJson<String?>(collectionName),
      'name': serializer.toJson<String?>(name),
      'avatar': serializer.toJson<String?>(avatar),
      'bio': serializer.toJson<String?>(bio),
      'peopleCount': serializer.toJson<int?>(peopleCount),
    };
  }

  ConversationTableData copyWith(
          {String? id,
          String? conversationType,
          String? collectionName,
          String? name,
          String? avatar,
          String? bio,
          int? peopleCount}) =>
      ConversationTableData(
        id: id ?? this.id,
        conversationType: conversationType ?? this.conversationType,
        collectionName: collectionName ?? this.collectionName,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        bio: bio ?? this.bio,
        peopleCount: peopleCount ?? this.peopleCount,
      );
  @override
  String toString() {
    return (StringBuffer('ConversationTableData(')
          ..write('id: $id, ')
          ..write('conversationType: $conversationType, ')
          ..write('collectionName: $collectionName, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar, ')
          ..write('bio: $bio, ')
          ..write('peopleCount: $peopleCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, conversationType, collectionName, name, avatar, bio, peopleCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConversationTableData &&
          other.id == this.id &&
          other.conversationType == this.conversationType &&
          other.collectionName == this.collectionName &&
          other.name == this.name &&
          other.avatar == this.avatar &&
          other.bio == this.bio &&
          other.peopleCount == this.peopleCount);
}

class ConversationTableCompanion
    extends UpdateCompanion<ConversationTableData> {
  final Value<String> id;
  final Value<String> conversationType;
  final Value<String?> collectionName;
  final Value<String?> name;
  final Value<String?> avatar;
  final Value<String?> bio;
  final Value<int?> peopleCount;
  const ConversationTableCompanion({
    this.id = const Value.absent(),
    this.conversationType = const Value.absent(),
    this.collectionName = const Value.absent(),
    this.name = const Value.absent(),
    this.avatar = const Value.absent(),
    this.bio = const Value.absent(),
    this.peopleCount = const Value.absent(),
  });
  ConversationTableCompanion.insert({
    required String id,
    required String conversationType,
    this.collectionName = const Value.absent(),
    this.name = const Value.absent(),
    this.avatar = const Value.absent(),
    this.bio = const Value.absent(),
    this.peopleCount = const Value.absent(),
  })  : id = Value(id),
        conversationType = Value(conversationType);
  static Insertable<ConversationTableData> custom({
    Expression<String>? id,
    Expression<String>? conversationType,
    Expression<String?>? collectionName,
    Expression<String?>? name,
    Expression<String?>? avatar,
    Expression<String?>? bio,
    Expression<int?>? peopleCount,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (conversationType != null) 'conversationType': conversationType,
      if (collectionName != null) 'collectionName': collectionName,
      if (name != null) 'name': name,
      if (avatar != null) 'avatar': avatar,
      if (bio != null) 'bio': bio,
      if (peopleCount != null) 'peopleCount': peopleCount,
    });
  }

  ConversationTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? conversationType,
      Value<String?>? collectionName,
      Value<String?>? name,
      Value<String?>? avatar,
      Value<String?>? bio,
      Value<int?>? peopleCount}) {
    return ConversationTableCompanion(
      id: id ?? this.id,
      conversationType: conversationType ?? this.conversationType,
      collectionName: collectionName ?? this.collectionName,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      bio: bio ?? this.bio,
      peopleCount: peopleCount ?? this.peopleCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (conversationType.present) {
      map['conversationType'] = Variable<String>(conversationType.value);
    }
    if (collectionName.present) {
      map['collectionName'] = Variable<String?>(collectionName.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String?>(avatar.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String?>(bio.value);
    }
    if (peopleCount.present) {
      map['peopleCount'] = Variable<int?>(peopleCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConversationTableCompanion(')
          ..write('id: $id, ')
          ..write('conversationType: $conversationType, ')
          ..write('collectionName: $collectionName, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar, ')
          ..write('bio: $bio, ')
          ..write('peopleCount: $peopleCount')
          ..write(')'))
        .toString();
  }
}

class ConversationTable extends Table
    with TableInfo<ConversationTable, ConversationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ConversationTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      '_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY UNIQUE');
  final VerificationMeta _conversationTypeMeta =
      const VerificationMeta('conversationType');
  late final GeneratedColumn<String?> conversationType =
      GeneratedColumn<String?>('conversationType', aliasedName, false,
          type: const StringType(),
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  final VerificationMeta _collectionNameMeta =
      const VerificationMeta('collectionName');
  late final GeneratedColumn<String?> collectionName = GeneratedColumn<String?>(
      'collectionName', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  late final GeneratedColumn<String?> avatar = GeneratedColumn<String?>(
      'avatar', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _bioMeta = const VerificationMeta('bio');
  late final GeneratedColumn<String?> bio = GeneratedColumn<String?>(
      'bio', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _peopleCountMeta =
      const VerificationMeta('peopleCount');
  late final GeneratedColumn<int?> peopleCount = GeneratedColumn<int?>(
      'peopleCount', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns =>
      [id, conversationType, collectionName, name, avatar, bio, peopleCount];
  @override
  String get aliasedName => _alias ?? 'conversationTable';
  @override
  String get actualTableName => 'conversationTable';
  @override
  VerificationContext validateIntegrity(
      Insertable<ConversationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('conversationType')) {
      context.handle(
          _conversationTypeMeta,
          conversationType.isAcceptableOrUnknown(
              data['conversationType']!, _conversationTypeMeta));
    } else if (isInserting) {
      context.missing(_conversationTypeMeta);
    }
    if (data.containsKey('collectionName')) {
      context.handle(
          _collectionNameMeta,
          collectionName.isAcceptableOrUnknown(
              data['collectionName']!, _collectionNameMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    }
    if (data.containsKey('bio')) {
      context.handle(
          _bioMeta, bio.isAcceptableOrUnknown(data['bio']!, _bioMeta));
    }
    if (data.containsKey('peopleCount')) {
      context.handle(
          _peopleCountMeta,
          peopleCount.isAcceptableOrUnknown(
              data['peopleCount']!, _peopleCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConversationTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ConversationTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  ConversationTable createAlias(String alias) {
    return ConversationTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MessageTableData extends DataClass
    implements Insertable<MessageTableData> {
  final String id;
  final String realName;
  final String username;
  final String message;
  final String messageType;
  final String createdAt;
  final String updatedAt;
  final bool edited;
  final bool deleted;
  final String? conversationTable;
  MessageTableData(
      {required this.id,
      required this.realName,
      required this.username,
      required this.message,
      required this.messageType,
      required this.createdAt,
      required this.updatedAt,
      required this.edited,
      required this.deleted,
      this.conversationTable});
  factory MessageTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MessageTableData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}_id'])!,
      realName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}realName'])!,
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username'])!,
      message: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message'])!,
      messageType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}messageType'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}createdAt'])!,
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedAt'])!,
      edited: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}edited'])!,
      deleted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted'])!,
      conversationTable: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}conversationTable']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<String>(id);
    map['realName'] = Variable<String>(realName);
    map['username'] = Variable<String>(username);
    map['message'] = Variable<String>(message);
    map['messageType'] = Variable<String>(messageType);
    map['createdAt'] = Variable<String>(createdAt);
    map['updatedAt'] = Variable<String>(updatedAt);
    map['edited'] = Variable<bool>(edited);
    map['deleted'] = Variable<bool>(deleted);
    if (!nullToAbsent || conversationTable != null) {
      map['conversationTable'] = Variable<String?>(conversationTable);
    }
    return map;
  }

  MessageTableCompanion toCompanion(bool nullToAbsent) {
    return MessageTableCompanion(
      id: Value(id),
      realName: Value(realName),
      username: Value(username),
      message: Value(message),
      messageType: Value(messageType),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      edited: Value(edited),
      deleted: Value(deleted),
      conversationTable: conversationTable == null && nullToAbsent
          ? const Value.absent()
          : Value(conversationTable),
    );
  }

  factory MessageTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessageTableData(
      id: serializer.fromJson<String>(json['_id']),
      realName: serializer.fromJson<String>(json['realName']),
      username: serializer.fromJson<String>(json['username']),
      message: serializer.fromJson<String>(json['message']),
      messageType: serializer.fromJson<String>(json['messageType']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      edited: serializer.fromJson<bool>(json['edited']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      conversationTable:
          serializer.fromJson<String?>(json['conversationTable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'realName': serializer.toJson<String>(realName),
      'username': serializer.toJson<String>(username),
      'message': serializer.toJson<String>(message),
      'messageType': serializer.toJson<String>(messageType),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'edited': serializer.toJson<bool>(edited),
      'deleted': serializer.toJson<bool>(deleted),
      'conversationTable': serializer.toJson<String?>(conversationTable),
    };
  }

  MessageTableData copyWith(
          {String? id,
          String? realName,
          String? username,
          String? message,
          String? messageType,
          String? createdAt,
          String? updatedAt,
          bool? edited,
          bool? deleted,
          String? conversationTable}) =>
      MessageTableData(
        id: id ?? this.id,
        realName: realName ?? this.realName,
        username: username ?? this.username,
        message: message ?? this.message,
        messageType: messageType ?? this.messageType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        edited: edited ?? this.edited,
        deleted: deleted ?? this.deleted,
        conversationTable: conversationTable ?? this.conversationTable,
      );
  @override
  String toString() {
    return (StringBuffer('MessageTableData(')
          ..write('id: $id, ')
          ..write('realName: $realName, ')
          ..write('username: $username, ')
          ..write('message: $message, ')
          ..write('messageType: $messageType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('edited: $edited, ')
          ..write('deleted: $deleted, ')
          ..write('conversationTable: $conversationTable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, realName, username, message, messageType,
      createdAt, updatedAt, edited, deleted, conversationTable);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageTableData &&
          other.id == this.id &&
          other.realName == this.realName &&
          other.username == this.username &&
          other.message == this.message &&
          other.messageType == this.messageType &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.edited == this.edited &&
          other.deleted == this.deleted &&
          other.conversationTable == this.conversationTable);
}

class MessageTableCompanion extends UpdateCompanion<MessageTableData> {
  final Value<String> id;
  final Value<String> realName;
  final Value<String> username;
  final Value<String> message;
  final Value<String> messageType;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<bool> edited;
  final Value<bool> deleted;
  final Value<String?> conversationTable;
  const MessageTableCompanion({
    this.id = const Value.absent(),
    this.realName = const Value.absent(),
    this.username = const Value.absent(),
    this.message = const Value.absent(),
    this.messageType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.edited = const Value.absent(),
    this.deleted = const Value.absent(),
    this.conversationTable = const Value.absent(),
  });
  MessageTableCompanion.insert({
    required String id,
    required String realName,
    required String username,
    required String message,
    required String messageType,
    required String createdAt,
    required String updatedAt,
    this.edited = const Value.absent(),
    this.deleted = const Value.absent(),
    this.conversationTable = const Value.absent(),
  })  : id = Value(id),
        realName = Value(realName),
        username = Value(username),
        message = Value(message),
        messageType = Value(messageType),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<MessageTableData> custom({
    Expression<String>? id,
    Expression<String>? realName,
    Expression<String>? username,
    Expression<String>? message,
    Expression<String>? messageType,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<bool>? edited,
    Expression<bool>? deleted,
    Expression<String?>? conversationTable,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (realName != null) 'realName': realName,
      if (username != null) 'username': username,
      if (message != null) 'message': message,
      if (messageType != null) 'messageType': messageType,
      if (createdAt != null) 'createdAt': createdAt,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (edited != null) 'edited': edited,
      if (deleted != null) 'deleted': deleted,
      if (conversationTable != null) 'conversationTable': conversationTable,
    });
  }

  MessageTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? realName,
      Value<String>? username,
      Value<String>? message,
      Value<String>? messageType,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<bool>? edited,
      Value<bool>? deleted,
      Value<String?>? conversationTable}) {
    return MessageTableCompanion(
      id: id ?? this.id,
      realName: realName ?? this.realName,
      username: username ?? this.username,
      message: message ?? this.message,
      messageType: messageType ?? this.messageType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      edited: edited ?? this.edited,
      deleted: deleted ?? this.deleted,
      conversationTable: conversationTable ?? this.conversationTable,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (realName.present) {
      map['realName'] = Variable<String>(realName.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (messageType.present) {
      map['messageType'] = Variable<String>(messageType.value);
    }
    if (createdAt.present) {
      map['createdAt'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    if (edited.present) {
      map['edited'] = Variable<bool>(edited.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (conversationTable.present) {
      map['conversationTable'] = Variable<String?>(conversationTable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageTableCompanion(')
          ..write('id: $id, ')
          ..write('realName: $realName, ')
          ..write('username: $username, ')
          ..write('message: $message, ')
          ..write('messageType: $messageType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('edited: $edited, ')
          ..write('deleted: $deleted, ')
          ..write('conversationTable: $conversationTable')
          ..write(')'))
        .toString();
  }
}

class MessageTable extends Table
    with TableInfo<MessageTable, MessageTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MessageTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      '_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY UNIQUE');
  final VerificationMeta _realNameMeta = const VerificationMeta('realName');
  late final GeneratedColumn<String?> realName = GeneratedColumn<String?>(
      'realName', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  late final GeneratedColumn<String?> username = GeneratedColumn<String?>(
      'username', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _messageMeta = const VerificationMeta('message');
  late final GeneratedColumn<String?> message = GeneratedColumn<String?>(
      'message', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _messageTypeMeta =
      const VerificationMeta('messageType');
  late final GeneratedColumn<String?> messageType = GeneratedColumn<String?>(
      'messageType', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'createdAt', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updatedAt', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _editedMeta = const VerificationMeta('edited');
  late final GeneratedColumn<bool?> edited = GeneratedColumn<bool?>(
      'edited', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression<bool>('0'));
  final VerificationMeta _deletedMeta = const VerificationMeta('deleted');
  late final GeneratedColumn<bool?> deleted = GeneratedColumn<bool?>(
      'deleted', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression<bool>('0'));
  final VerificationMeta _conversationTableMeta =
      const VerificationMeta('conversationTable');
  late final GeneratedColumn<String?> conversationTable =
      GeneratedColumn<String?>('conversationTable', aliasedName, true,
          type: const StringType(),
          requiredDuringInsert: false,
          $customConstraints: 'REFERENCES conversationTable(_id)');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        realName,
        username,
        message,
        messageType,
        createdAt,
        updatedAt,
        edited,
        deleted,
        conversationTable
      ];
  @override
  String get aliasedName => _alias ?? 'messageTable';
  @override
  String get actualTableName => 'messageTable';
  @override
  VerificationContext validateIntegrity(Insertable<MessageTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('realName')) {
      context.handle(_realNameMeta,
          realName.isAcceptableOrUnknown(data['realName']!, _realNameMeta));
    } else if (isInserting) {
      context.missing(_realNameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('messageType')) {
      context.handle(
          _messageTypeMeta,
          messageType.isAcceptableOrUnknown(
              data['messageType']!, _messageTypeMeta));
    } else if (isInserting) {
      context.missing(_messageTypeMeta);
    }
    if (data.containsKey('createdAt')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['createdAt']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updatedAt')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('edited')) {
      context.handle(_editedMeta,
          edited.isAcceptableOrUnknown(data['edited']!, _editedMeta));
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('conversationTable')) {
      context.handle(
          _conversationTableMeta,
          conversationTable.isAcceptableOrUnknown(
              data['conversationTable']!, _conversationTableMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MessageTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MessageTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  MessageTable createAlias(String alias) {
    return MessageTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ProfileTableData extends DataClass
    implements Insertable<ProfileTableData> {
  final String username;
  final String realName;
  final String avatar;
  final String pokemonHero;
  final String bio;
  final String lastSeen;
  final String pvs;
  ProfileTableData(
      {required this.username,
      required this.realName,
      required this.avatar,
      required this.pokemonHero,
      required this.bio,
      required this.lastSeen,
      required this.pvs});
  factory ProfileTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProfileTableData(
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username'])!,
      realName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}realName'])!,
      avatar: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar'])!,
      pokemonHero: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pokemonHero'])!,
      bio: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bio'])!,
      lastSeen: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lastSeen'])!,
      pvs: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pvs'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['username'] = Variable<String>(username);
    map['realName'] = Variable<String>(realName);
    map['avatar'] = Variable<String>(avatar);
    map['pokemonHero'] = Variable<String>(pokemonHero);
    map['bio'] = Variable<String>(bio);
    map['lastSeen'] = Variable<String>(lastSeen);
    map['pvs'] = Variable<String>(pvs);
    return map;
  }

  ProfileTableCompanion toCompanion(bool nullToAbsent) {
    return ProfileTableCompanion(
      username: Value(username),
      realName: Value(realName),
      avatar: Value(avatar),
      pokemonHero: Value(pokemonHero),
      bio: Value(bio),
      lastSeen: Value(lastSeen),
      pvs: Value(pvs),
    );
  }

  factory ProfileTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileTableData(
      username: serializer.fromJson<String>(json['username']),
      realName: serializer.fromJson<String>(json['realName']),
      avatar: serializer.fromJson<String>(json['avatar']),
      pokemonHero: serializer.fromJson<String>(json['pokemonHero']),
      bio: serializer.fromJson<String>(json['bio']),
      lastSeen: serializer.fromJson<String>(json['lastSeen']),
      pvs: serializer.fromJson<String>(json['pvs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'username': serializer.toJson<String>(username),
      'realName': serializer.toJson<String>(realName),
      'avatar': serializer.toJson<String>(avatar),
      'pokemonHero': serializer.toJson<String>(pokemonHero),
      'bio': serializer.toJson<String>(bio),
      'lastSeen': serializer.toJson<String>(lastSeen),
      'pvs': serializer.toJson<String>(pvs),
    };
  }

  ProfileTableData copyWith(
          {String? username,
          String? realName,
          String? avatar,
          String? pokemonHero,
          String? bio,
          String? lastSeen,
          String? pvs}) =>
      ProfileTableData(
        username: username ?? this.username,
        realName: realName ?? this.realName,
        avatar: avatar ?? this.avatar,
        pokemonHero: pokemonHero ?? this.pokemonHero,
        bio: bio ?? this.bio,
        lastSeen: lastSeen ?? this.lastSeen,
        pvs: pvs ?? this.pvs,
      );
  @override
  String toString() {
    return (StringBuffer('ProfileTableData(')
          ..write('username: $username, ')
          ..write('realName: $realName, ')
          ..write('avatar: $avatar, ')
          ..write('pokemonHero: $pokemonHero, ')
          ..write('bio: $bio, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('pvs: $pvs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(username, realName, avatar, pokemonHero, bio, lastSeen, pvs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileTableData &&
          other.username == this.username &&
          other.realName == this.realName &&
          other.avatar == this.avatar &&
          other.pokemonHero == this.pokemonHero &&
          other.bio == this.bio &&
          other.lastSeen == this.lastSeen &&
          other.pvs == this.pvs);
}

class ProfileTableCompanion extends UpdateCompanion<ProfileTableData> {
  final Value<String> username;
  final Value<String> realName;
  final Value<String> avatar;
  final Value<String> pokemonHero;
  final Value<String> bio;
  final Value<String> lastSeen;
  final Value<String> pvs;
  const ProfileTableCompanion({
    this.username = const Value.absent(),
    this.realName = const Value.absent(),
    this.avatar = const Value.absent(),
    this.pokemonHero = const Value.absent(),
    this.bio = const Value.absent(),
    this.lastSeen = const Value.absent(),
    this.pvs = const Value.absent(),
  });
  ProfileTableCompanion.insert({
    required String username,
    required String realName,
    required String avatar,
    required String pokemonHero,
    required String bio,
    required String lastSeen,
    required String pvs,
  })  : username = Value(username),
        realName = Value(realName),
        avatar = Value(avatar),
        pokemonHero = Value(pokemonHero),
        bio = Value(bio),
        lastSeen = Value(lastSeen),
        pvs = Value(pvs);
  static Insertable<ProfileTableData> custom({
    Expression<String>? username,
    Expression<String>? realName,
    Expression<String>? avatar,
    Expression<String>? pokemonHero,
    Expression<String>? bio,
    Expression<String>? lastSeen,
    Expression<String>? pvs,
  }) {
    return RawValuesInsertable({
      if (username != null) 'username': username,
      if (realName != null) 'realName': realName,
      if (avatar != null) 'avatar': avatar,
      if (pokemonHero != null) 'pokemonHero': pokemonHero,
      if (bio != null) 'bio': bio,
      if (lastSeen != null) 'lastSeen': lastSeen,
      if (pvs != null) 'pvs': pvs,
    });
  }

  ProfileTableCompanion copyWith(
      {Value<String>? username,
      Value<String>? realName,
      Value<String>? avatar,
      Value<String>? pokemonHero,
      Value<String>? bio,
      Value<String>? lastSeen,
      Value<String>? pvs}) {
    return ProfileTableCompanion(
      username: username ?? this.username,
      realName: realName ?? this.realName,
      avatar: avatar ?? this.avatar,
      pokemonHero: pokemonHero ?? this.pokemonHero,
      bio: bio ?? this.bio,
      lastSeen: lastSeen ?? this.lastSeen,
      pvs: pvs ?? this.pvs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (realName.present) {
      map['realName'] = Variable<String>(realName.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (pokemonHero.present) {
      map['pokemonHero'] = Variable<String>(pokemonHero.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (lastSeen.present) {
      map['lastSeen'] = Variable<String>(lastSeen.value);
    }
    if (pvs.present) {
      map['pvs'] = Variable<String>(pvs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileTableCompanion(')
          ..write('username: $username, ')
          ..write('realName: $realName, ')
          ..write('avatar: $avatar, ')
          ..write('pokemonHero: $pokemonHero, ')
          ..write('bio: $bio, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('pvs: $pvs')
          ..write(')'))
        .toString();
  }
}

class ProfileTable extends Table
    with TableInfo<ProfileTable, ProfileTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProfileTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  late final GeneratedColumn<String?> username = GeneratedColumn<String?>(
      'username', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _realNameMeta = const VerificationMeta('realName');
  late final GeneratedColumn<String?> realName = GeneratedColumn<String?>(
      'realName', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  late final GeneratedColumn<String?> avatar = GeneratedColumn<String?>(
      'avatar', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _pokemonHeroMeta =
      const VerificationMeta('pokemonHero');
  late final GeneratedColumn<String?> pokemonHero = GeneratedColumn<String?>(
      'pokemonHero', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _bioMeta = const VerificationMeta('bio');
  late final GeneratedColumn<String?> bio = GeneratedColumn<String?>(
      'bio', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _lastSeenMeta = const VerificationMeta('lastSeen');
  late final GeneratedColumn<String?> lastSeen = GeneratedColumn<String?>(
      'lastSeen', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _pvsMeta = const VerificationMeta('pvs');
  late final GeneratedColumn<String?> pvs = GeneratedColumn<String?>(
      'pvs', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [username, realName, avatar, pokemonHero, bio, lastSeen, pvs];
  @override
  String get aliasedName => _alias ?? 'profileTable';
  @override
  String get actualTableName => 'profileTable';
  @override
  VerificationContext validateIntegrity(Insertable<ProfileTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('realName')) {
      context.handle(_realNameMeta,
          realName.isAcceptableOrUnknown(data['realName']!, _realNameMeta));
    } else if (isInserting) {
      context.missing(_realNameMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    if (data.containsKey('pokemonHero')) {
      context.handle(
          _pokemonHeroMeta,
          pokemonHero.isAcceptableOrUnknown(
              data['pokemonHero']!, _pokemonHeroMeta));
    } else if (isInserting) {
      context.missing(_pokemonHeroMeta);
    }
    if (data.containsKey('bio')) {
      context.handle(
          _bioMeta, bio.isAcceptableOrUnknown(data['bio']!, _bioMeta));
    } else if (isInserting) {
      context.missing(_bioMeta);
    }
    if (data.containsKey('lastSeen')) {
      context.handle(_lastSeenMeta,
          lastSeen.isAcceptableOrUnknown(data['lastSeen']!, _lastSeenMeta));
    } else if (isInserting) {
      context.missing(_lastSeenMeta);
    }
    if (data.containsKey('pvs')) {
      context.handle(
          _pvsMeta, pvs.isAcceptableOrUnknown(data['pvs']!, _pvsMeta));
    } else if (isInserting) {
      context.missing(_pvsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ProfileTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProfileTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  ProfileTable createAlias(String alias) {
    return ProfileTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final ConversationTable conversationTable = ConversationTable(this);
  late final MessageTable messageTable = MessageTable(this);
  late final Index conversationIdIndex = Index('conversationIdIndex',
      'CREATE INDEX conversationIdIndex ON messageTable(conversationId);');
  late final ProfileTable profileTable = ProfileTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [conversationTable, messageTable, conversationIdIndex, profileTable];
}

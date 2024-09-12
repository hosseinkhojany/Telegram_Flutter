// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemonInfo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonInfoAdapter extends TypeAdapter<PokemonInfo> {
  @override
  final int typeId = 2;

  @override
  PokemonInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonInfo(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as int,
      (fields[5] as List).cast<String>(),
      fields[6] as int,
      fields[7] as int,
      fields[8] as int,
      fields[9] as int,
      fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonInfo obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.base_experience)
      ..writeByte(5)
      ..write(obj.types)
      ..writeByte(6)
      ..write(obj.hp)
      ..writeByte(7)
      ..write(obj.attack)
      ..writeByte(8)
      ..write(obj.defense)
      ..writeByte(9)
      ..write(obj.speed)
      ..writeByte(10)
      ..write(obj.exp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

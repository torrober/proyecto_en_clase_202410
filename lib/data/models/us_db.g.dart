// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'us_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDbAdapter extends TypeAdapter<UserDb> {
  @override
  final int typeId = 1;

  @override
  UserDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDb(
      firstName: fields[0] as String,
      password: fields[2] as String,
      email: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserDb obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

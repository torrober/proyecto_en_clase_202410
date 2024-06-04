// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportDbAdapter extends TypeAdapter<ReportDb> {
  @override
  final int typeId = 1;

  @override
  ReportDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReportDb(
      id: fields[0] as int,
      idUS: fields[1] as int,
      score: fields[2] as int,
      duracion: fields[3] as String,
      horaInicio: fields[4] as String,
      nameClient: fields[5] as String,
      description: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReportDb obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idUS)
      ..writeByte(2)
      ..write(obj.score)
      ..writeByte(3)
      ..write(obj.duracion)
      ..writeByte(4)
      ..write(obj.horaInicio)
      ..writeByte(5)
      ..write(obj.nameClient)
      ..writeByte(6)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

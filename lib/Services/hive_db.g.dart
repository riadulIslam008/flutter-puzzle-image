// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageStoreAdapter extends TypeAdapter<ImageStore> {
  @override
  final int typeId = 0;

  @override
  ImageStore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageStore(
      imageText: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageStore obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.imageText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageStoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

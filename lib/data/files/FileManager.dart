import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileManager {
  // Método para obtener el directorio de documentos de la aplicación
  Future<Directory> _getDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  // Método para guardar un archivo con el contenido especificado
  Future<void> saveFile(String fileName, String content) async {
    try {
      final directory = await _getDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);
      await file.writeAsString(content);
      print('Archivo guardado en: $filePath');
    } catch (e) {
      print('Error al guardar el archivo: $e');
    }
  }

  // Método para leer el contenido de un archivo
  Future<String?> readFile(String fileName) async {
    try {
      final directory = await _getDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);
      if (await file.exists()) {
        return await file.readAsString();
      } else {
        print('Archivo no encontrado: $filePath');
        return null;
      }
    } catch (e) {
      print('Error al leer el archivo: $e');
      return null;
    }
  }

  // Método para eliminar un archivo
  Future<void> deleteFile(String fileName) async {
    try {
      final directory = await _getDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        print('Archivo eliminado: $filePath');
      } else {
        print('Archivo no encontrado: $filePath');
      }
    } catch (e) {
      print('Error al eliminar el archivo: $e');
    }
  }
}

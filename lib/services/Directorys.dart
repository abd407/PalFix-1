import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileManger {
  static FileManger? _instance;

  FileManger._internal() {
    _instance = this;
  }

//-------------------------------------------------------------//
//-------------- Create Instane if not Exist ------------------//
//-------------------------------------------------------------//
  factory FileManger() => _instance ?? FileManger._internal();

//-------------------------------------------------------------//
//------------ get Phone Directory Where App in ---------------//
//-------------------------------------------------------------//
  Future<String> get _directoryPath async {
    Directory? directory = await getExternalStorageDirectory();
    return directory!.path;
  }

//-------------------------------------------------------------//
//----------------- Open Services Json ------------------------//
//-------------------------------------------------------------//
  Future<File> get _fileServices async {
    final path = await _directoryPath;
    return File('$path/Servicesjson.json');
  }

//-------------------------------------------------------------//
//-------------------- Open Slids Json ------------------------//
//-------------------------------------------------------------//
  Future<File> get _fileSlids async {
    final path = await _directoryPath;
    return File('$path/Slidsjson.json');
  }

//-------------------------------------------------------------//
//--------------------- Services File --------------------------//
//-------------------------------------------------------------//
  readServicesjson() async {
    String fileContent = 'Did Not Read File ';
    File file = await _fileServices;

    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
      } catch (e) {
        print(e);
        fileContent = 'An Exciption Happend While Reading ';
      }
    }
    return fileContent;
  }

//-------------------------------------------------------------//
//----------------------- Slids File --------------------------//
//-------------------------------------------------------------//
  readSlidsjson() async {
    String fileContent = 'Did Not Read File ';
    File file = await _fileSlids;

    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
      } catch (e) {
        print(e);
        fileContent = 'An Exciption Happend While Reading ';
      }
    }
    return fileContent;
  }


  WritSlidsJson() async{

    
  }
}


import 'dart:io';
import 'title.dart';
/// autore : khadim faye

void main() async {

  /// function to display unicode emojis :)
  String printRune( var charcode)=> (String.fromCharCodes(Runes(charcode)));

  /// this get the right home dir for you based on your operating systeme
  var  homeDir = Platform.isWindows? Platform.environment['USERPROFILE'] : Platform.environment['HOME'];
  // here i created a variable named [source]  
  // you can change it  AND choose where to find files that you want to classify for its [downloads]
  Directory source = Directory('$homeDir/downloads'); 

 createDirectories(Directory? destination ) async{
  /// this function create all destination directory based on the file 
  /// extention like (.png, .jpg, ....)

  if (destination!=null && !await Directory(destination.path).exists()){
    await Directory(destination.path).create();
    print('''
-------------------------
|                        |
|   Directory created    |
|                        |
-------------------------
''');

  }

  else{
    print('''
-------------------------------------------------------------------------------------
|                                                                                   |
|   Directory ${destination}already exists ${printRune('\u{1F44B}')}                |
|                                                                                   |
------------------------------------------------------------------------------------
''');

  }

}

moveFiles(source) async {
  //move files from source to destination
  ///here specify how you name your destinations folders and where to create the folders based on type of files you want to classify
  ///example: if you want to classify .exe files, you can create a folder called 'exe'
  ///feel free to modify it as you like it to be :=)
  Map <String, String > formatMaps = {
      /// ADD OTHER EXTENSIONS  
      /// AND SPECIFY THERE DESTINATION HERE IF YOU WANT 

      '.png' : '$homeDir/desktop/Myimages',
      '.jpg' : '$homeDir/desktop/Myimages',
      '.jpeg' : '$homeDir/desktop/Myimages',

      '.mp3' : '$homeDir/desktop/Mymusic',
      '.mp4' : '$homeDir/desktop/Myvideos',
      '.m3u' : '$homeDir/desktop/Myiptv',

      '.exe' : '$homeDir/desktop/Myexecutables',
 
      '.zip' : '$homeDir/desktop/Myzip',
      '.rar' : '$homeDir/desktop/Myzip',
      '.7z' : '$homeDir/desktop/Myzip',
      '.tar' : '$homeDir/desktop/Myzip',
      '.gz' : '$homeDir/desktop/Myzip',
      '.bz2' : '$homeDir/desktop/Myzip',
      '.xz' : '$homeDir/desktop/Myzip',
      '.lz' : '$homeDir/desktop/Myzip',
      '.lzma' : '$homeDir/desktop/Myzip',
      '.lz4' : '$homeDir/desktop/Myzip',
      '.pdf' : '$homeDir/desktop/Mydocuments',
   
      '.docx' : '$homeDir/desktop/Mydocuments',
      '.doc' : '$homeDir/desktop/Mydocuments',
      '.xlsx' : '$homeDir/desktop/Mydocuments',
      '.pptx' : '$homeDir/desktop/Mydocuments',
      '.txt' : '$homeDir/desktop/Mydocuments',

      
      };

// give all type of extensions files in a list and name there directory like .png all of theme ...

  List entities = await source.list().toList();

  try {

    print('searching files to classify ${printRune('\u{1F4A4}')} ...');
    for ( var entity in entities){
      if (entity is File ){
        //get the last segment of the entity path   
        //a segment look like this ['dir', 'subdir','file.exe']
        //so the last segment will be 'file.exe'
        String entityPath = entity.uri.pathSegments.last;
        // print('.'+entityPath.split('.').last);

        /// set the DESNATION DIRECTORY 
        /// cheikc if exists
        String? destination= formatMaps['.${entityPath.split('.').last}'];// GET THE  LAST 4 ELEMENTS IN THE STRING LIKE [.PNG]
        if (destination != null) {

          var  destinationDirectory = Directory(destination); 
          //create the destination directory if it does not exist
          await createDirectories(destinationDirectory); 

          var newFile = Directory('${destinationDirectory.path}/${entity.uri.pathSegments.last}');

          // // COPY THE FILE TO THE DESTINATION DIRECTORY
          entity.copy(newFile.path);
          print('''
    ---------------------------------------------------------------------------------
    |                                                                               |
    |                                                                               |
    |   ${entity.path} classified! ${printRune('\u{1F63B}')}\n                         |         
    |                                                                               |   
    --------------------------------------------------------------------------------
    ''');
         
          // print('elimino files......');
          sleep(Duration(seconds: 3));
          entity.delete(recursive: false);

        }

        else{
          // sleep(Duration(seconds: 5));
          // print('searching files to classify ${printRune('\u{1F4A4}')} ...');
        }

        }

    }  
}

on Exception catch (e){
  print('error $e');
}
  catch (e){
    print((e, 'fii'));
  }
  
}

title();
   while (true){
    // set a timer to deplay the execution
    await moveFiles(source);
    sleep(Duration(seconds: 3));
   }

} 
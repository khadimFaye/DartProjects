# FileManager

FileManager is an application written in Dart that allows you to manage files and directories directly from the terminal. This application provides a range of commands to create, move, copy, and delete files and directories, offering a simple and fast alternative to traditional file managers.

### 👤 Author
- [Khadim Faye](https://github.com/khadimFaye)

#

## 🔧 Requirements

To run FileManager, you will need:

- **Windows 7 or later**
- **PowerShell**
- **Chocolatey** (for managing packages on Windows)
- **Dart SDK** (to compile or run the Dart source code)

### 🛠️ How to Run the Code
```bash
cd FileManager
dart run 

```

### Steps to Install PowerShell

PowerShell è già incluso in Windows 10 e versioni successive, ma se hai bisogno di aggiornarlo o installarlo su una versione precedente di Windows, puoi scaricarlo dal seguente link:

- [Download PowerShell](https://github.com/khadimFaye/DartProjects/tree/master/FileManager/filemanager.exe)

### 🍫Installing Chocolatey
Chocolatey is a package manager for Windows that simplifies the installation of software like Dart.

1. Open PowerShell with administrator privileges.

2. Run the following command to install Chocolatey:

    ```powershell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    ```

3. Verify Chocolatey's installation with the command:

    ```powershell
    choco -v
    ```

### Installing Dart

You can install Dart via Chocolatey or manually:

#### Method 1: Use Chocolatey

1. After installing Chocolatey, open PowerShell with administrator privileges.
2. Run the following command to install Dart SDK:

    ```powershell
    choco install dart-sdk
    ```

3. Verify the installation of Dart with:

    ```powershell
    dart --version
    ```

#### Method 2: Manual Installation

1. Vai al sito ufficiale di Dart e scarica l'SDK dal seguente link:

    - [Download Dart SDK](https://dart.dev/get-dart)

2. Follow the installation instructions specific to your operating system.


2. Alternatively, if you prefer to run the project directly from the Dart source code, navigate to the project directory and use the command:

    ```bash
    dart run
    ```

### Compile the code to exe file
 ```powershell

cd Filemanager/bin
dart compile exe filemanager.dart
```
### Running the Project

1. After compiled the executable from the terminal or just double click it:
   
    ```powershell
    ./FileManager.exe
    ```

## Contributions

Contributions, bug reports, and suggestions are welcome! You can open an issue or create a pull request to discuss changes.

## License

This project is distributed under the MIT license. See the file [LICENSE](LICENSE) for more details.

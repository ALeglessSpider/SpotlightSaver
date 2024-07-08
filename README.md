# SpotlightSaver

SpotlightSaver is a simple utility script designed to save Windows Spotlight wallpapers as .jpeg files. Windows Spotlight is a feature in Windows 10 that automatically downloads high-quality images to be used as lock screen backgrounds. This script makes it easy to save these images for personal use by copying and renaming them to a specified directory.

## Features
- Automatically finds and copies Windows Spotlight images.
- Renames the images with a .jpeg extension.
- Creates a destination folder if it doesn't exist.
- Opens the destination folder upon completion.

## How to Use

### Prerequisites
- A Windows operating system.
- Basic knowledge of running batch scripts.

### Steps
1. **Download the Script**: Download the SpotlightSaver script to your local machine.
2. **Modify the Script** (Optional): Update the source and destination directory paths if needed (detailed instructions below).
3. **Run the Script**: Double-click the script file to execute it. The script will copy and rename the Spotlight images to the specified destination folder.

### Modifying the Script

1. **Set the Source Directory**: 
   - Locate the following line in the script:
     ```batch
     set "source=C:\Users\<YourUsername>\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"
     ```
   - Replace `<YourUsername>` with your Windows username. Alternatively, you can navigate to the specified path and copy it directly to avoid any mistakes.

2. **Set the Destination Directory**:
   - Locate the following line in the script:
     ```batch
     set "destination=D:\Wallpapers\lockscreen"
     ```
   - Replace the path with your desired destination folder where the images should be saved.

### Script Breakdown

```batch
@echo off 
rem This command turns off command echoing, which prevents displaying commands on the console as they are executed.

rem Set source directory
set "source=C:\Users\<YourUsername>\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"
rem This line sets the variable 'source' to the path of the source directory.

rem Set destination directory
set "destination=D:\Wallpapers\lockscreen"
rem This line sets the variable 'destination' to the path of the destination directory.

rem Create destination folder if it doesn't exist
if not exist "%destination%" (
    mkdir "%destination%"
)
rem This block of code checks if the destination folder exists. If it doesn't, it creates the folder using the mkdir command.

rem Use PowerShell to copy and rename files from source to destination
powershell -Command "Get-ChildItem '%source%' | Copy-Item -Destination { Join-Path '%destination%' ($_.Name + '.jpg') } -Force"
rem This line uses PowerShell to perform the file copying and renaming. It uses the Get-ChildItem cmdlet to get all items in the source directory, then pipes them to the Copy-Item cmdlet. The Join-Path function is used to combine the destination directory path with the filename and '.jpg' extension for renaming. The -Force parameter ensures that existing files in the destination folder are overwritten without prompting.

echo Files copied and renamed successfully.
rem This line displays a message indicating that files were copied and renamed successfully.

pause
rem This command pauses the script execution and waits for the user to press any key before continuing.

rem Open the newly created directory
start "" "%destination%"
rem This line uses the start command to open the newly created directory in Windows File Explorer.

rem Exit the script
exit
rem This command exits the script after it has completed its execution.
```

By following these steps, you can easily save your favorite Windows Spotlight wallpapers and use them as you wish. Enjoy your beautiful new wallpapers!

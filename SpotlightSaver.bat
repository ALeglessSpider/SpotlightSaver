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


# MP3 File Consolidator

## Description  
A script that moves all MP3 files from nested subfolders into a single destination folder on your desktop. Works on Windows, macOS, and Linux systems.

## Features  
- 🔍 Recursively searches through all subfolders  
- 🎵 Finds all MP3 files (extension .mp3)  
- 🔢 Handles duplicate filenames automatically  
- ✂️ Moves files (doesn't copy, preserving storage)  
- ✔️ Preserves original folder structure  
- 📊 Provides summary of moved files  

## System Requirements  
| System | Requirements |  
|--------|--------------|  
| Windows | PowerShell 5.1+ |  
| macOS | Terminal (Bash or Zsh) |  
| Linux | Bash shell |  

## Installation  
1. Download the appropriate script for your OS:  
   - Windows: `MoveMP3s.ps1`  
   - macOS/Linux: `move_mp3s.sh`  
2. Place the script in your desired location  

## Usage Instructions  

### Windows Users  
```powershell
# First time only (if needed):
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Then run:
.\MoveMP3s.ps1
```


### macOS/Linux Users
``` bash
# Make the script executable
chmod +x move_mp3s.sh

# Run the script
./move_mp3s.sh

# For macOS with zsh issues:
bash move_mp3s.sh
```

## Configuration
Edit these variables in the script:

### Windows (PowerShell):

``` powershell
$sourceDir = "C:\your\music\folder"  # Where your MP3s are now
$destinationDir = "$env:USERPROFILE\Desktop\All_MP3s"  # Where to move them
```

### macOS/Linux (Bash):

``` bash
source_dir="/your/music/folder"  # Source directory
destination_dir="$HOME/Desktop/All_MP3s"  # Destination

```

## Safety Features 
- 🛡️ Never overwrites existing files
- 📁 Creates destination folder if missing
- 🔄 Adds numbers to duplicate filenames (song_1.mp3, song_2.mp3)
- 📝 Provides operation summary

## FAQ
- Q: Will this delete my original files?
- A: No, it moves them - your originals will be in the new location.

- Q: What if I have duplicate filenames?
- A: The script automatically adds numbers (e.g., "song_1.mp3").

- Q: Can I undo this operation?
- A: Not automatically - you'd need to manually move files back.

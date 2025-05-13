# PowerShell script to move all MP3 files from subfolders to a folder on desktop

# Set the source directory (where your subfolders with MP3s are)
$sourceDir = "C:\path\to\your\folder\with\subfolders"

# Set the destination directory (on your desktop)
$destinationDir = "$env:USERPROFILE\Desktop\All_MP3s"

# Create the destination folder if it doesn't exist
if (-not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir | Out-Null
}

# Get all MP3 files from subfolders
$mp3Files = Get-ChildItem -Path $sourceDir -Recurse -Filter "*.mp3"

# Move each file to the destination
foreach ($file in $mp3Files) {
    $destinationPath = Join-Path -Path $destinationDir -ChildPath $file.Name
    
    # Handle duplicate filenames
    if (Test-Path -Path $destinationPath) {
        $basename = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
        $extension = [System.IO.Path]::GetExtension($file.Name)
        $counter = 1
        while (Test-Path -Path $destinationPath) {
            $newFilename = "${basename}_${counter}${extension}"
            $destinationPath = Join-Path -Path $destinationDir -ChildPath $newFilename
            $counter++
        }
    }
    
    Move-Item -Path $file.FullName -Destination $destinationPath
}

Write-Host "Moved $($mp3Files.Count) MP3 files to $destinationDir"

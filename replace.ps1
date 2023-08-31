#mui0
# Set the directory path to scan
$directoryPath = "C:\Users\blahblah\Desktop\Joplin` Exports\"

$keywordReplacements = @{
    "_resources" = "assets"
}

# Get a list of all Markdown files in the directory and its subdirectories
$markdownFiles = Get-ChildItem -Path $directoryPath -Filter "*.md" -File -Recurse

# Loop through each Markdown file and perform keyword replacement
foreach ($file in $markdownFiles) {
    $fileContent = Get-Content -Path $file.FullName -Raw

    # Perform keyword replacement
    foreach ($keyword in $keywordReplacements.Keys) {
        $replacement = $keywordReplacements[$keyword]
        $fileContent = $fileContent -replace [regex]::Escape($keyword), $replacement
    }

    # Write the modified content back to the file
    $fileContent | Set-Content -Path $file.FullName
}

Write-Host "Keyword replacement complete for all Markdown files."

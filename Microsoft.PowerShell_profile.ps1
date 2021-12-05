Import-Module posh-git
Import-Module oh-my-posh
# Set-PoshPrompt -Theme Space
oh-my-posh --init --shell pwsh --config "~/isaac.omp.json" | Invoke-Expression

function Touch-File() {
    $fileName = $args[0]
    # Check of the file exists
    if (-not(Test-Path $fileName)) {
        # It does not exist. Create it
        New-Item -ItemType File -Name $fileName
    }
    else {
        #It exists. Update the timestamp
        (Get-ChildItem $fileName).LastWriteTime = Get-Date
    }
}

### Create an alias for touch

# Check if the alias exists
if (-not(Test-Path -Path Alias:Touch)) {
    New-Alias -Name Touch Touch-File -Force
}
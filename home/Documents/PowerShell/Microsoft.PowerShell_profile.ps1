Import-Module GitPrompt
Import-Module MyCustomPrompt
Import-Module Wttr

# Installa o ripara Vencord
function Install-Vencord {
  $installer = Join-Path $env:temp ('{0}.exe' -f (New-Guid).Guid)
  $uri = 'https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe' 
  Write-Host 'Downloading Vencord installer...' -ForegroundColor Green
  Invoke-RestMethod -Uri $uri -OutFile $installer
  & $installer
  Remove-Item $installer
}

# Semplifica la sintassi per creare un collegamento simbolico
function New-SymbolicLink {
  param([switch]$Force)
  New-Item -Type SymbolicLink -Target $args[0] -Path $args[1] -Force:$Force
}

# Imposta alias
Set-Alias -Name curl -Value 'curl.exe' -Option AllScope
Set-Alias -Name touch -Value 'New-Item' -Option AllScope
Set-Alias -Name vencord -Value 'Install-Vencord' -Option AllScope
Set-Alias -Name ln -Value 'New-SymbolicLink' -Option AllScope
Set-Alias -Name vim -Value 'neovide'

# Vim mode
Set-PSReadlineOption -EditMode vi
Set-PSReadLineOption -ViModeIndicator Cursor

# Cronologia comandi
Set-PSReadLineOption -MaximumHistoryCount 200

# Bell
Set-PSReadLineOption -BellStyle Visual

# Fix per non far rompere i caratteri unicode
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
Set-CustomPromptOption -GitOptions @{ UseStashCount = $false }
$Function:prompt = Get-CustomPrompt

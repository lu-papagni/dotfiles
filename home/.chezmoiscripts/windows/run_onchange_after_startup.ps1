function Get-CommandSource {
  param([string]$Command, [string]$ExeFilter = ".*")
  return Get-Command -Name "$Command*" `
    | Where-Object -Property Name -Match $ExeFilter `
    | Select-Object -ExpandProperty Source
}

$startup = [Environment]::GetFolderPath("Startup")
$wsh = New-Object -ComObject WScript.Shell

# HACK: refresh PATH reading directly from the registry
# This is needed because run_* scripts inherit chezmoi's PATH,
# which does not have the new entries from winget installations.
$env:PATH = @(
  [Environment]::GetEnvironmentVariable("PATH", "Machine")
  [Environment]::GetEnvironmentVariable("PATH", "User")
) -join ";"

$shortcuts = @(
  @{
    Name = "kanata"
    Source = (Get-CommandSource "kanata" "gui.*IOv\d")
    Arguments = @()
  }
  @{
    Name = "Mount Koofr with rclone"
    Source = "powershell.exe"
    Arguments = @(
      "-NonInteractive"
      "-NoProfile"
      "-WindowStyle"
      "Hidden"
      "-Command"
      "rclone.exe"
      "mount"
      "koofr:"
      "K:"
      "--network-mode"
    )
  }
)

foreach ($item in $shortcuts) {
  $lnk = $wsh.CreateShortcut((Join-Path $startup "$($item.Name).lnk"))
  $lnk.TargetPath = $item.Source
  $lnk.Arguments = $item.Arguments -join " "
  $lnk.WorkingDirectory = "$env:USERPROFILE"
  $lnk.WindowStyle = 7   # Minimized
  $lnk.Save()
}

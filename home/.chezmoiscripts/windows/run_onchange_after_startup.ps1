function Get-CommandSource {
  param([string]$Command, [string]$ExeFilter = ".*")
  return Get-Command -Name "$Command*" `
    | Where-Object -Property Name -Match $ExeFilter `
    | Select-Object -ExpandProperty Source
}

$startup = [Environment]::GetFolderPath("Startup")
$wsh = New-Object -ComObject WScript.Shell

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

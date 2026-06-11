$binPath = "$env:USERPROFILE\.local\bin"
$current = [Environment]::GetEnvironmentVariable("Path", "User")

if ($current -notlike "*$binPath*") {
    [Environment]::SetEnvironmentVariable("Path", "$current;$binPath", "User")
}
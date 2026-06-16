@echo off

START "" rclone.exe mount koofr: K:\ --no-console --network-mode ^
    --vfs-cache-mode full ^
    --vfs-cache-max-size 1G ^
    --vfs-cache-max-age 24h ^
    --vfs-read-ahead 128M

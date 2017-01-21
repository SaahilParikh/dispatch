@echo off
echo.
echo Scanning...
echo WARNING This May Take Awhile!
cd C:\
dir /b /s *.avi *.mpg *.vob *.mp4 *.m2ts *.mov *.3gp *.mkv *.m4a *.m4b *.mp3 *.wav *.wma *.webm *.wv *.flac > %~dp0\scanner\result\media.txt
echo.
echo Scan Complete!
echo Check The result subdirectory
cd ..
echo "Results Saved In C:\%~dp0\result"
echo.
call "framework.cmd"

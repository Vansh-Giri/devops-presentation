@echo off
echo Deploying website...
set TARGET=C:\inetpub\wwwroot
if not exist %TARGET% (
    mkdir %TARGET%
)
xcopy /y /e "%WORKSPACE%\index.html" "%TARGET%\"
xcopy /y /e "%WORKSPACE%\styles.css" "%TARGET%\"
echo Deployment complete!

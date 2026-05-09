@echo off

chcp 65001 >nul

title Quartz 笔记一键同步

cd /d "C:\Users\tourl\101littlebird.github.io"

echo ==============================

echo 正在同步笔记到 GitHub...

echo ==============================

git add .

:: 检查是否有变更需要提交

git diff --cached --quiet

if %errorlevel% equ 0 (

echo 没有新的变更需要提交，退出同步。

pause >nul

exit /b

)

:: 提交并推送

git commit -m "auto sync: %date% %time%"

if %errorlevel% neq 0 (

echo 提交失败！

pause >nul

exit /b

)

git push origin main

if %errorlevel% equ 0 (

echo 同步成功！网站将在几分钟内更新。

) else (

echo 推送失败，请检查网络或 Git 配置。

)

pause >nul
@echo off
chcp 65001 >nul
title Sai Rahul Portfolio - GitHub Upload
echo.
echo ========================================
echo   STEP 1: Copying Images...
echo ========================================
echo.

set "SRC=C:\Users\pc\.gemini\antigravity\brain\0b358e0d-ff80-447c-9376-67093c37774a"
set "DST=%~dp0images"

copy /Y "%SRC%\hero_sai_rahul_1778416587087.png" "%DST%\hero-profile.png" >nul 2>&1 && echo  [OK] hero-profile.png || echo  [FAIL] hero-profile.png
copy /Y "%SRC%\logo_folio_showcase_1778416601150.png" "%DST%\logo-folio.png" >nul 2>&1 && echo  [OK] logo-folio.png || echo  [FAIL] logo-folio.png
copy /Y "%SRC%\brand_identity_dark_1778416614170.png" "%DST%\brand-identity.png" >nul 2>&1 && echo  [OK] brand-identity.png || echo  [FAIL] brand-identity.png
copy /Y "%SRC%\poster_farewell_1778416633660.png" "%DST%\poster-farewell.png" >nul 2>&1 && echo  [OK] poster-farewell.png || echo  [FAIL] poster-farewell.png
copy /Y "%SRC%\illustration_lineart_1778416659954.png" "%DST%\illustration-lineart.png" >nul 2>&1 && echo  [OK] illustration-lineart.png || echo  [FAIL] illustration-lineart.png
copy /Y "%SRC%\logo_bison_mark_1778416707368.png" "%DST%\logo-bison.png" >nul 2>&1 && echo  [OK] logo-bison.png || echo  [FAIL] logo-bison.png
copy /Y "%SRC%\logo_camera_photo_1778416727088.png" "%DST%\logo-camera.png" >nul 2>&1 && echo  [OK] logo-camera.png || echo  [FAIL] logo-camera.png
copy /Y "%SRC%\food_brand_logo_1778416764808.png" "%DST%\food-brand-logo.png" >nul 2>&1 && echo  [OK] food-brand-logo.png || echo  [FAIL] food-brand-logo.png
copy /Y "%SRC%\brand_stationery_1778416740552.png" "%DST%\brand-stationery.png" >nul 2>&1 && echo  [OK] brand-stationery.png || echo  [FAIL] brand-stationery.png
copy /Y "%SRC%\poster_nirvana_1778416647870.png" "%DST%\poster-nirvana.png" >nul 2>&1 && echo  [OK] poster-nirvana.png || echo  [FAIL] poster-nirvana.png
copy /Y "%SRC%\illustration_character_1778416753319.png" "%DST%\illustration-character.png" >nul 2>&1 && echo  [OK] illustration-character.png || echo  [FAIL] illustration-character.png
copy /Y "%SRC%\social_media_designs_1778416681138.png" "%DST%\social-media.png" >nul 2>&1 && echo  [OK] social-media.png || echo  [FAIL] social-media.png
copy /Y "%SRC%\packaging_cosmetics_1778416695688.png" "%DST%\packaging-cosmetics.png" >nul 2>&1 && echo  [OK] packaging-cosmetics.png || echo  [FAIL] packaging-cosmetics.png

echo.
echo ========================================
echo   STEP 2: Setting up Git...
echo ========================================
echo.

cd /d "%~dp0"

:: Clean up temp files
del /Q "%~dp0copy-images.bat" >nul 2>&1
del /Q "%~dp0copy-images.js" >nul 2>&1
del /Q "%~dp0copy-images.ps1" >nul 2>&1
del /Q "%~dp0setup.cmd" >nul 2>&1
del /Q "%~dp0images\placeholder.txt" >nul 2>&1

:: Init git
git init
git branch -M main
git add .
git commit -m "Initial commit - Sai Rahul Portfolio"

echo.
echo ========================================
echo   STEP 3: Pushing to GitHub...
echo ========================================
echo.

git remote add origin https://github.com/karimbdk/Portfolio_test1.git
git push -u origin main --force

echo.
echo ========================================
echo   DONE! Your portfolio is live at:
echo   https://github.com/karimbdk/Portfolio_test1
echo ========================================
echo.
pause

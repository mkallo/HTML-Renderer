@echo off

CD %~dp0

echo.
echo - Get version...
for /f "tokens=1-4 delims=." %%i in ('getVer.exe ..\Source\SharedAssemblyInfo.cs') do set version=%%i.%%j.%%k-beta%%l
echo Version: %version%

echo.
echo.
echo - Pack NuGets...
echo.
nuget.exe pack NuGet\HtmlRenderer.Core.nuspec -Version %version% -OutputDirectory Release
nuget.exe pack NuGet\HtmlRenderer.WinForms.nuspec -Version %version% -OutputDirectory Release
nuget.exe pack NuGet\HtmlRenderer.WPF.nuspec -Version %version% -OutputDirectory Release
nuget.exe pack NuGet\HtmlRenderer.Mono.nuspec -Version %version% -OutputDirectory Release
nuget.exe pack NuGet\HtmlRenderer.PdfSharp.nuspec -Version %version% -OutputDirectory Release
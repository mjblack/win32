Install-Module VSSetup -Scope CurrentUser -Force
$cwd = Get-Location
$vsinstpath = Get-VSSetupInstance -All | Select-VSSetupInstance -Latest | Select-Object  -ExpandProperty InstallationPath
& "${vsinstpath}\Common7\Tools\Launch-VsDevShell.ps1"
cd $cwd\examples\dialog
rc resource.rc
$lopts = "/LIBPATH:${cwd}\examples\dialog resource.res"
crystal build -o dialogbox1.exe .\window.cr --link-flags "${lopts}"
$identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$princ = New-Object System.Security.Principal.WindowsPrincipal($identity)
if(!$princ.IsInRole( `
[System.Security.Principal.WindowsBuiltInRole]::Administrator))
{
$powershell = [System.Diagnostics.Process]::GetCurrentProcess()
$psi = New-Object System.Diagnostics.ProcessStartInfo $powerShell.Path
$script = $MyInvocation.MyCommand.Path
$prm = $script
foreach($a in $args) {
$prm += ' ' + $a
}
$psi.Arguments = $prm
$psi.Verb = "runas"
[System.Diagnostics.Process]::Start($psi) | Out-Null
return;
}
Write-Host "Ich habe Admin recht!"

New-Item -Name „Testordner“ -ItemType Directory -Path „C:\Temp\“

Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

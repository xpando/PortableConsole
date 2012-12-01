$global:profile = $MyInvocation.MyCommand.Definition
$profileDir = Split-Path $profile -Parent 
Push-Location $profileDir

Import-Module "$($env:portableroot)\modules\Commands" -DisableNameChecking

Add-Path @(
  "$($env:portableroot)\bin"
  "$($env:portableroot)\bin\TCCLE13"
  "$($env:portableroot)\bin\Sysinternals"
  "$($env:portableroot)\scripts"
)

if ((Get-OSArchitecture).Architecture -eq "64-Bit")
{
  Add-Path @("$($env:portableroot)\bin\Debug\x64")
}

del alias:dir
Set-Alias zip "$($env:portableroot)\bin\7za.exe"
Set-Alias edit "$($env:portableroot)\bin\sublime\sublime_text.exe"

function common_prompt {
    $q = Split-Path $pwd -Qualifier
    $p = Split-Path $pwd -NoQualifier

    Write-Host $q -nonewline -foregroundcolor darkgray
    Write-Host $p -foregroundcolor darkgray
    Write-Host "[" -nonewline -foregroundcolor white
    Write-Host $env:userdomain -nonewline -foregroundcolor green
    Write-Host "." -nonewline -foregroundcolor white
    Write-Host $env:username -nonewline -foregroundcolor green
    Write-Host "@" -nonewline -foregroundcolor white
    Write-Host $env:computername -nonewline -foregroundcolor cyan
    Write-Host "]" -nonewline -foregroundcolor white
    Write-Host "►" -nonewline -foregroundcolor red

    return " "
}

function prompt {
  return common_prompt
}

Pop-Location
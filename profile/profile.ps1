$global:profile = $MyInvocation.MyCommand.Definition
$profileDir = Split-Path $profile -Parent 
Push-Location $profileDir

Import-Module "$($env:portableroot)modules\PsGet"
Import-Module "$($env:portableroot)modules\Commands"

Add-Path @(
  "$($env:portableroot)bin"
  "$($env:portableroot)bin\TCCLE13"
  "$($env:portableroot)bin\Sysinternals"
  "$($env:portableroot)scripts"
)

Set-Alias zip "$($env:portableroot)bin\7za.exe"
Set-Alias edit "$($env:portableroot)bin\sublime\sublime_text.exe"

function dir   { get-childitem $args -ea silentlycontinue | sort @{e={$_.PSIsContainer}; desc=$true},@{e={$_.Name}; asc=$true} } 
function dird  { get-childitem $args -ea silentlycontinue | where { $_.PSIsContainer } } 

function prompt {
    $q = Split-Path $pwd -Qualifier
    $p = Split-Path $pwd -NoQualifier

    Write-Host($q) -nonewline -foregroundcolor green
    Write-Host($p) -nonewline -foregroundcolor white
    Write-Host("►") -nonewline -foregroundcolor red

    return " "
}

Pop-Location
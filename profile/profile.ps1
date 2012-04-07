$global:profile = $MyInvocation.MyCommand.Definition
$profileDir = Split-Path $profile -Parent 
Push-Location $profileDir

function Add-Path([string[]] $items) {
  $paths = $env:path -split ";"
  $items = $items | ? { $paths -notcontains $_ }
  $paths = $items + $paths
  $env:path = $paths -join ";"
}

function Remove-Path([string[]] $items) {
  $paths = $env:path -split ";"
  $paths = $paths | ? { $items -notcontains $_ }
  $env:path = $paths -join ";"
}

Add-Path @(
  "$($env:portableroot)bin" 
  "$($env:portableroot)scripts" 
)

Import-Module "$($env:portableroot)modules\PsGet"
Import-Module "$($env:portableroot)modules\Commands"

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
$global:profile = $MyInvocation.MyCommand.Definition
$profileDir = Split-Path -Parent $profile
Push-Location $profileDir

. .\Profile.ps1

Add-Path @("$($env:portableroot)\bin\TortoiseHg")

Import-Module "$($env:portableroot)\modules\PoshHg\Posh-Hg"

# Set up a simple prompt, adding the hg prompt parts inside hg repos
function prompt {
    # Mercurial Prompt
    $Global:HgStatus = Get-HgStatus
    Write-HgStatus $HgStatus

    $q = Split-Path $pwd -Qualifier
    $p = Split-Path $pwd -NoQualifier

    Write-Host("[") -nonewline -foregroundcolor white
    Write-Host($q) -nonewline -foregroundcolor darkgray
    Write-Host($p) -nonewline -foregroundcolor darkgray
    Write-Host("]") -foregroundcolor white
    Write-Host("$env:username") -nonewline -foregroundcolor green
    Write-Host("@") -nonewline -foregroundcolor gray
    Write-Host("$env:computername") -nonewline -foregroundcolor cyan
    Write-Host("►") -nonewline -foregroundcolor red
      
    return " "
}

Pop-Location
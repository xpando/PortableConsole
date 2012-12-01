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

    Write-Host($q) -nonewline -foregroundcolor darkgray
    Write-Host($p) -foregroundcolor darkgray
    Write-Host("[") -nonewline -foregroundcolor white
    Write-Host($env:userdomain.ToLower()) -nonewline -foregroundcolor green
    Write-Host(".") -nonewline -foregroundcolor white
    Write-Host($env:username.ToLower()) -nonewline -foregroundcolor green
    Write-Host("@") -nonewline -foregroundcolor white
    Write-Host($env:computername.ToLower()) -nonewline -foregroundcolor cyan
    Write-Host("]") -nonewline -foregroundcolor white
    Write-Host("►") -nonewline -foregroundcolor red
      
    return " "
}

Pop-Location
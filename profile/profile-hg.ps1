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

    Write-Host($q) -nonewline -foregroundcolor green
    Write-Host($p) -nonewline -foregroundcolor white
    Write-Host("►") -nonewline -foregroundcolor red
      
    return " "
}

if(-not (Test-Path Function:\DefaultTabExpansion)) {
    Rename-Item Function:\TabExpansion DefaultTabExpansion
}

# Set up tab expansion and include hg expansion
function TabExpansion($line, $lastWord) {
    $lastBlock = [regex]::Split($line, '[|;]')[-1]
    
    switch -regex ($lastBlock) {
        # mercurial and tortoisehg tab expansion
        '(hg|thg) (.*)' { HgTabExpansion($lastBlock) }
        # Fall back on existing tab expansion
        default { DefaultTabExpansion $line $lastWord }
    }
}

Pop-Location
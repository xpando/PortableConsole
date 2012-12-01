$global:profile = $MyInvocation.MyCommand.Definition
$profileDir = Split-Path -Parent $profile
Push-Location $profileDir

. .\Profile.ps1

Add-Path @("$($env:portableroot)\bin\SlikSvn\bin")

Import-Module "$($env:portableroot)\modules\PoshSvn\Posh-Svn"
# Set up a simple prompt, adding the git prompt parts inside git repos
function prompt {
    # Git Prompt
    $global:SvnStatus = Get-SvnStatus
    Write-SvnStatus $SvnStatus
    
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

if ((Test-Path Function:\TabExpansion)) {
    Rename-Item Function:\TabExpansion DefaultTabExpansion
}

# Set up tab expansion and include svn expansion
function TabExpansion($line, $lastWord) {
    $lastBlock = [regex]::Split($line, '[|;]')[-1]
    
    switch -regex ($lastBlock) {
        # svn tab expansion
        '(svn) (.*)' { SvnTabExpansion($lastBlock) }
        # Fall back on existing tab expansion
        default { if (Test-Path Function:\DefaultTabExpansion) { DefaultTabExpansion $line $lastWord } }
    }
}

Pop-Location
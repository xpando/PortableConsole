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

    Write-Host($q) -nonewline -foregroundcolor green
    Write-Host($p) -nonewline -foregroundcolor white
    Write-Host("►") -nonewline -foregroundcolor red
      
    return " "
}

if(-not (Test-Path Function:\DefaultTabExpansion)) {
    Rename-Item Function:\TabExpansion DefaultTabExpansion
}

# Set up tab expansion and include git expansion
function TabExpansion($line, $lastWord) {
    $lastBlock = [regex]::Split($line, '[|;]')[-1]
    
    switch -regex ($lastBlock) {
        # Execute git tab completion for all git-related commands
        '(svn|tsvn) (.*)' { SvnTabExpansion $lastBlock }
        # Fall back on existing tab expansion
        default { DefaultTabExpansion $line $lastWord }
    }
}

Pop-Location
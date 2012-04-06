$global:profile = $MyInvocation.MyCommand.Definition
$profileDir = Split-Path -Parent $profile
Push-Location $profileDir

. .\Profile.ps1

Add-Path @("$env:portableroot\bin\msysgit\bin")

Import-Module "$env:portableroot\Modules\PoshGit\Posh-Git"

$env:PLINK_PROTOCOL = "ssh"

Enable-GitColors

# Set up a simple prompt, adding the git prompt parts inside git repos
function prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

    # Git Prompt
    $global:GitStatus = Get-GitStatus
    Write-GitStatus $GitStatus

    $q = Split-Path $pwd -Qualifier
    $p = Split-Path $pwd -NoQualifier

    Write-Host($q) -nonewline -foregroundcolor green
    Write-Host($p) -nonewline -foregroundcolor white
    Write-Host("►") -nonewline -foregroundcolor red

    $LASTEXITCODE = $realLASTEXITCODE
      
    return " "
}

if(Test-Path Function:\TabExpansion) {
    $teBackup = 'posh-git_DefaultTabExpansion'
    if(!(Test-Path Function:\$teBackup)) {
        Rename-Item Function:\TabExpansion $teBackup
    }

    # Set up tab expansion and include git expansion
    function TabExpansion($line, $lastWord) {
        $lastBlock = [regex]::Split($line, '[|;]')[-1].TrimStart()
        switch -regex ($lastBlock) {
            # Execute git tab completion for all git-related commands
            "$(Get-GitAliasPattern) (.*)" { GitTabExpansion $lastBlock }
            # Fall back on existing tab expansion
            default { & $teBackup $line $lastWord }
        }
    }
}

Enable-GitColors

Pop-Location
$global:profile = $MyInvocation.MyCommand.Definition
$profileDir = Split-Path -Parent $profile
Push-Location $profileDir

. .\Profile.ps1

Add-Path @("$($env:portableroot)\bin\msysgit\bin")

Import-Module "$($env:portableroot)\modules\PoshGit\Posh-Git"

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

    $LASTEXITCODE = $realLASTEXITCODE
      
    return " "
}

Enable-GitColors

Pop-Location
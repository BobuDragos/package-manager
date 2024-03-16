function Install-Packages {
    param (
        [string[]]$packages
    )

    foreach ($package in $packages) {
        $process = Start-Process "winget" -ArgumentList "install --source msstore --force --accept-package-agreements --accept-source-agreements $package" -PassThru -RedirectStandardOutput "output.txt" -RedirectStandardError "error.txt" -Wait
        $output = Get-Content "output.txt"
        $errorOutput = Get-Content "error.txt"
        Write-Host "Installing $package"
        Write-Host "Output: $output"
        Write-Host "Errors: $errorOutput"
    }
}

$choices = @{
    1 = "Network packages (putty, realvnc, sysinternals)"
    2 = "Embedded software packages (arduino, vim, neovim, powertoys, python3, rufus, trello, powershell, draw.io, sysinternals, terminal, devtoys, notion)"
    3 = "Programmer's toolkit (choco install vim neovim, winget install --source msstore --force --accept-package-agreements --accept-source-agreements powertoys python3 rufus trello powershell draw.io sysinternals terminal devtoys, winget install --source winget --force --accept-package-agreements --accept-source-agreements notion)"
    4 = "Audiophile's toolkit (volumey, spotify, deezer, tidal, soundcloud, mixx, audacity, obs)"
    5 = "Administrator's toolkit (treesize, heic, heif, avc, recuva, crystaldiskinfo)"
    6 = "Social Media Specialist's toolkit (whatsapp, netflix, discord, reddit, wikipedia, gimp, obs, blender, audacity, express, inkscape, fresco, clipchamp, vlc, treesize, anki, heic, heif, avc, capcut, canva, paint)"
    7 = "Business specialist (teams, zoom, outlook, skype, oneNote, trello, webex, linkedin)"
    8 = "Gamer's toolkit (epic, discord, obs, ubisoft, qbittorrent, dolby)"
    9 = "Academic's toolkit (deepL, wikipedia)"
}

$selectedChoice = $choices | Out-GridView -Title "Select a Toolkit" -OutputMode Single

if ($selectedChoice) {
    Write-Host "Selected: '$selectedChoice' choice."
    $toolkitName = $choices[$selectedChoice]
    $toolkitPackages = @()
    $selectedChoice = $selectedChoice.Key

    if ($selectedChoice -eq 1) {
        $toolkitPackages = "putty", "realvnc", "sysinternals"
    } elseif ($selectedChoice -eq 2 -or $selectedChoice -eq 3) {
        $toolkitPackages = "vim", "neovim", "powertoys", "python3", "rufus", "trello", "powershell", "draw.io", "sysinternals", "terminal", "devtoys", "notion"
    } elseif ($selectedChoice -eq 4) {
        $toolkitPackages = "volumey", "spotify", "deezer", "tidal", "soundcloud", "mixx", "audacity", "obs"
    } elseif ($selectedChoice -eq 5) {
        $toolkitPackages = "treesize", "heic", "heif", "avc", "recuva", "crystaldiskinfo"
    } elseif ($selectedChoice -eq 6) {
        $toolkitPackages = "whatsapp", "netflix", "discord", "reddit", "wikipedia", "gimp", "obs", "blender", "audacity", "express", "inkscape", "fresco", "clipchamp", "vlc", "treesize", "anki", "heic", "heif", "avc", "capcut", "canva", "paint"
    } elseif ($selectedChoice -eq 7) {
        $toolkitPackages = "teams", "zoom", "outlook", "skype", "oneNote", "trello", "webex", "linkedin"
    } elseif ($selectedChoice -eq 8) {
        $toolkitPackages = "epic", "discord", "obs", "ubisoft", "qbittorrent", "dolby"
    } elseif ($selectedChoice -eq 9) {
        $toolkitPackages = "deepL", "wikipedia"
    }

    Write-Host "Selected: '$toolkitPackages' packages."
    Install-Packages -packages $toolkitPackages

    # Use Write-Host for a simple text output
    Write-Host "Installation complete for '$toolkitName' toolkit."
}

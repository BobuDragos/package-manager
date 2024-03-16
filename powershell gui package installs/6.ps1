function Install-Packages {
    param (
        [string]$packages
    )

    $packagesArray = $packages -split ' '

    foreach ($package in $packagesArray) {
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

    switch ($selectedChoice) {
        1 { Install-Packages -packages "putty realvnc sysinternals" }
        2 { Install-Packages -packages "vim neovim powertoys python3 rufus trello powershell draw.io sysinternals terminal devtoys notion" }
        3 { Install-Packages -packages "vim neovim powertoys python3 rufus trello powershell draw.io sysinternals terminal devtoys notion" }
        4 { Install-Packages -packages "volumey spotify deezer tidal soundcloud mixx audacity obs" }
        5 { Install-Packages -packages "treesize heic heif avc recuva crystaldiskinfo" }
        6 { Install-Packages -packages "whatsapp netflix discord reddit wikipedia gimp obs blender audacity express inkscape fresco clipchamp vlc treesize anki heic heif avc capcut canva paint" }
        7 { Install-Packages -packages "teams zoom outlook skype oneNote trello webex linkedin" }
        8 { Install-Packages -packages "epic discord obs ubisoft qbittorrent dolby" }
        9 { Install-Packages -packages "deepL wikipedia" }
    }

    Write-Host "Installation complete for '$toolkitName' toolkit."
}

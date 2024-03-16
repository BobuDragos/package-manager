function Show-ConfirmationScreen {
    param (
        [string]$toolkitName,
        [string[]]$packages
    )

    $message = "You have selected the '$toolkitName' toolkit. The following packages will be installed:`n`n$($packages -join "`n")`n`nDo you want to proceed?"

    $result = [System.Windows.Forms.MessageBox]::Show($message, "Confirmation", "YesNo", "Question")

    return ($result -eq [System.Windows.Forms.DialogResult]::Yes)
}

function Install-Packages {
    param (
        [string[]]$packages
    )

    foreach ($package in $packages) {
        Start-Process "winget" -ArgumentList "install --source msstore --force --accept-package-agreements --accept-source-agreements $package" -Wait
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
    $toolkitName = $choices[$selectedChoice]
    $toolkitPackages = @()

    switch ($selectedChoice) {
        1 { $toolkitPackages = "putty", "realvnc", "sysinternals" }
        2 { $toolkitPackages = "vim", "neovim", "powertoys", "python3", "rufus", "trello", "powershell", "draw.io", "sysinternals", "terminal", "devtoys", "notion" }
        3 { $toolkitPackages = "vim", "neovim", "powertoys", "python3", "rufus", "trello", "powershell", "draw.io", "sysinternals", "terminal", "devtoys", "notion" }
        4 { $toolkitPackages = "volumey", "spotify", "deezer", "tidal", "soundcloud", "mixx", "audacity", "obs" }
        5 { $toolkitPackages = "treesize", "heic", "heif", "avc", "recuva", "crystaldiskinfo" }
        6 { $toolkitPackages = "whatsapp", "netflix", "discord", "reddit", "wikipedia", "gimp", "obs", "blender", "audacity", "express", "inkscape", "fresco", "clipchamp", "vlc", "treesize", "anki", "heic", "heif", "avc", "capcut", "canva", "paint" }
        7 { $toolkitPackages = "teams", "zoom", "outlook", "skype", "oneNote", "trello", "webex", "linkedin" }
        8 { $toolkitPackages = "epic", "discord", "obs", "ubisoft", "qbittorrent", "dolby" }
        9 { $toolkitPackages = "deepL", "wikipedia" }
    }

    $confirmation = Show-ConfirmationScreen -toolkitName $toolkitName -packages $toolkitPackages

    if ($confirmation) {
        Install-Packages -packages $toolkitPackages
        [System.Windows.Forms.MessageBox]::Show("Installation complete!", "Success", "OK", "Information")
    }
}

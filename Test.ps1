$repositories = @(
    "https://github.com/InfoTrackGlobal/WebsiteNetCore.git"
)

$date = Get-Date -Format "ddmmyyyy"

foreach ($repository in $repositories ) {

    $repository -match ".*\/(.*).git" | % { $path = $Matches[1] } 
    $path = "$PSScriptRoot\$path"

    Write-Host $path

    if ( -Not (Test-Path $path))
    {
        git clone $repository
    }

    Push-Location $path
    git checkout develop
    git checkout -b test1 
    git branch 
    git commit . -m "new release"
    git push origin test1

    Pop-Location
}

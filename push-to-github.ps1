# Skript na push do GitHubu - spust v PowerShell v tomto priečinku
Set-Location $PSScriptRoot

Write-Host "Aktualny adresar: $(Get-Location)" -ForegroundColor Cyan
Write-Host "Soubory v priečinku:" -ForegroundColor Cyan
Get-ChildItem -Force | Where-Object { $_.Name -ne ".git" } | Format-Table Name, Length

# Ak git neexistuje, inicializuj
if (-not (Test-Path .git)) {
    Write-Host "`nInicializujem git..." -ForegroundColor Yellow
    git init
}

# Pridaj vsetky soubory (okrem .git)
Write-Host "`nPridavam soubory..." -ForegroundColor Yellow
git add .
git status

# Commit
Write-Host "`nVytvaram commit..." -ForegroundColor Yellow
git commit -m "first commit"

# Nastav vetvu main
git branch -M main

# Nastav remote (ak uz existuje, aktualizuj)
git remote remove origin 2>$null
git remote add origin https://github.com/novoondr-stack/Denisa.git

# Push
Write-Host "`nOdesilam na GitHub..." -ForegroundColor Yellow
git push -u origin main

Write-Host "`nHotovo! Skontroluj: https://github.com/novoondr-stack/Denisa" -ForegroundColor Green

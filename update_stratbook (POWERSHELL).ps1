Write-Host "Telechargement de la derniere version..." -ForegroundColor Green

# 1. Télécharger le ZIP depuis la branche master
Invoke-WebRequest -Uri "https://github.com/HRVNoa/ValorantStratBook/archive/refs/heads/master.zip" -OutFile "latest.zip"

# 2. Extraire dans un dossier temporaire
Expand-Archive -Path "latest.zip" -DestinationPath "temp_update" -Force

# 3. Copier les nouveaux fichiers par-dessus les anciens
Copy-Item -Path "temp_update\ValorantStratBook-master\*" -Destination "." -Recurse -Force

# 4. Supprimer le ZIP et le dossier temporaire
Remove-Item -Path "temp_update" -Recurse -Force
Remove-Item -Path "latest.zip" -Force

Write-Host "Mise a jour terminee !" -ForegroundColor Green

# Pause de 2 secondes avant fermeture automatique
Start-Sleep -Seconds 2
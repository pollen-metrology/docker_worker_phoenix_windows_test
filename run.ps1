
function startUp() {
  Write-Host "Register Runner"
  #c:\GitLab-Runner\.\gitlab-runner.exe register --non-interactive --executor "shell" --docker-image "mcr.microsoft.com/windows/servercore:ltsc2019" --shell "powershell" --url "https://gitlab.com/" --registration-token "nYAsaK9DqxZevC5Sn5Qn" --description "Kubernetes-Runner" --tag-list "phoenix-windows, pyphoenix-windows" --run-untagged="true" --locked="false"
  c:\GitLab-Runner\.\gitlab-runner.exe register `
  --non-interactive `
  --executor "shell" `
  --shell "powershell" `
  --url "https://gitlab.com/" `
  --registration-token "nYAsaK9DqxZevC5Sn5Qn" `
  --description "Kubernetes-Runner" `
  --tag-list "phoenix-windows, pyphoenix-windows" `
  --cache-type "s3" `
  --cache-cache-shared=true `
  --cache-s3-server-address "cache.pollen-metrology.com" `
  --cache-s3-access-key "administrateur" `
  --cache-s3-secret-key "v7rB2i6t88h" `
  --cache-s3-bucket-name "runner" `
  --run-untagged="true" `
  --locked="false"
  
   c:\GitLab-Runner\.\gitlab-runner.exe run
}

function shutDown() {
  Write-Host "Unregister Runner"
  c:\GitLab-Runner\.\gitlab-runner.exe unregister --all-runners
}


try
{
  # startup 
  startUp
    # Keep Alive
    while($true)
    {
      #  "Working.."
      Start-Sleep -Seconds 1
    }
}
finally
{
  # when dthe docker stopped
  shutDown
}  
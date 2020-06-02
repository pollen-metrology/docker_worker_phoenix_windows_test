
function startUp() {
  Write-Host "Register Runner"
  #c:\GitLab-Runner\.\gitlab-runner.exe register --non-interactive --executor "shell" --docker-image "mcr.microsoft.com/windows/servercore:ltsc2019" --shell "powershell" --url "https://gitlab.com/" --registration-token "nYAsaK9DqxZevC5Sn5Qn" --description "Kubernetes-Runner" --tag-list "phoenix-windows-test, pyphoenix-windows-test" --run-untagged="true" --locked="false"
  c:\GitLab-Runner\.\gitlab-runner.exe register `
  --non-interactive `
  --executor "shell" `
  --shell "powershell" `
  --url "https://gitlab.com/" `
  --registration-token $KUBERNETES_RUNNER_REGISTER_TOKEN `
  --description "Kubernetes-Runner" `
  --tag-list "phoenix-windows, pyphoenix-windows" `
  --cache-type "s3" `
  --cache-shared=true `
  --cache-s3-server-address $KUBERNETES_RUNNER_CACHE_SERVER_ADDRESS `
  --cache-s3-access-key $KUBERNETES_RUNNER_CACHE_ACCESS_KEY `
  --cache-s3-secret-key $KUBERNETES_RUNNER_CACHE_SECRET_KEY `
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
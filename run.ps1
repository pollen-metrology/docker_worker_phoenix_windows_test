
function startUp() {
  Write-Host "Register Runner"
  #c:\GitLab-Runner\.\gitlab-runner.exe register --non-interactive --executor "shell" --docker-image "mcr.microsoft.com/windows/servercore:ltsc2019" --shell "powershell" --url "https://gitlab.com/" --registration-token "nYAsaK9DqxZevC5Sn5Qn" --description "Kubernetes-Runner" --tag-list "phoenix-windows, pyphoenix-windows" --run-untagged="true" --locked="false"
  #c:\GitLab-Runner\.\gitlab-runner.exe register --non-interactive --executor "shell" --docker-image "alpine:latest" --shell "powershell" --url "https://gitlab.com/" --registration-token "nYAsaK9DqxZevC5Sn5Qn" --description "Kubernetes-Runner" --tag-list "phoenix-windows-testrunner, pyphoenix-windows-testrunner" --run-untagged="true" --locked="false"
  #c:\GitLab-Runner\.\gitlab-runner.exe register --non-interactive --executor "shell" --docker-image "mcr.microsoft.com/windows/servercore:ltsc2019" --shell "powershell" --url "https://gitlab.com/" --registration-token "nYAsaK9DqxZevC5Sn5Qn" --description "Kubernetes-Runner" --tag-list "phoenix-windows-testrunner, pyphoenix-windows-testrunner" --run-untagged="true" --locked="false"
  c:\GitLab-Runner\.\gitlab-runner.exe register --non-interactive --executor "shell" --shell "powershell" --url "https://gitlab.com/" --registration-token "nYAsaK9DqxZevC5Sn5Qn" --description "Kubernetes-Runner" --tag-list "phoenix-windows, pyphoenix-windows" --run-untagged="true" --locked="false"
  #c:\GitLab-Runner\.\gitlab-runner.exe register --non-interactive --executor "docker" --docker-image "mcr.microsoft.com/windows/servercore:ltsc2019" --shell "powershell" --url "https://gitlab.com/" --registration-token "nYAsaK9DqxZevC5Sn5Qn" --description "Kubernetes-Runner" --tag-list "phoenix-windows-testrunner, pyphoenix-windows-testrunner" --run-untagged="true" --locked="false"
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
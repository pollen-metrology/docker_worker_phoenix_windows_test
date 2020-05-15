# docker build -t pollenm/docker_worker_phoenix_windows .
# docker run --dns=8.8.8.8 -it pollenm/docker_worker_phoenix_windows
# push to github
# push to docker-hub => docker push pollenm/docker_worker_phoenix_windows
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# --------------------------------------------- GITLAB-RUNNER ------------------------------------------#
RUN powershell -Command New-Item -Path "c:\\" -Name "GitLab-Runner" -ItemType "directory"

RUN powershell -Command Invoke-WebRequest -Uri "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-windows-amd64.exe" -UseBasicParsing -OutFile "c:\\GitLab-Runner\\gitlab-runner.exe"

RUN powershell -Command c:\GitLab-Runner\.\gitlab-runner.exe install

# --------------------------------------------- END GITLAB-RUNNER ------------------------------------------#

# --- git --- #
#RUN Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
#RUN scoop install git
# GIT_TRACE=1 GIT_CURL_VERBOSE=1 git clone https://gitlab.com/pollen-metrology/phoenix-group/Phoenix.git Phoenix
# https://gitlab.com/pollen-metrology/phoenix-group/Phoenix.git
# Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
# Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
# --- end git --- #

COPY run.ps1 c:

#CMD ["cmd"]
#CMD ["powershell"]

ENTRYPOINT [ "powershell.exe", "C:\\.\\run.ps1" ]
# docker build -t pollenm/docker_worker_phoenix_windows .
# docker run -it pollenm/docker_worker_phoenix_windows
FROM mcr.microsoft.com/windows/servercore:ltsc2019
# RUN ["powershell", "New-Item", "c:/test"]
CMD ["cmd"]
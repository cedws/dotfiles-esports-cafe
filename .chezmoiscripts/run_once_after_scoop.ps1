iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
scoop install git
scoop bucket add extras
scoop install windowsdesktop-runtime@8.0.15 tinynvidiaupdatechecker croc
tinynvidiaupdatechecker.exe --quiet --noprompt --confirm-dl

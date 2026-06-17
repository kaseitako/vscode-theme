$ErrorActionPreference = "Stop"

npm run package

$vsix = Get-ChildItem -Path . -Filter "*.vsix" |
  Sort-Object LastWriteTime -Descending |
  Select-Object -First 1

if (-not $vsix) {
  throw "No VSIX package was created."
}

code --install-extension $vsix.FullName --force

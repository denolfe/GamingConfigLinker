param([string]$configPath = "config.json")

function mklink { cmd /c mklink $args }

function IsSymLink([string]$path) {
  $file = Get-Item $path -Force -ea SilentlyContinue
  return [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)
}

function linkSingle([string]$dest, [string]$source) {
  if (-Not (Test-Path $source)) {
    Write-Error "Source does not exist"
  }

  # $env:HOME variable replacement
  $dest = $dest -replace "env:HOME", "$($env:HOME)"

  # Relink if symlink already exists
  if (Test-Path $dest) {
    if ($(IsSymLink($dest))) {
      Remove-Item $dest
    }
    else {
      Write-Error "Is not a symlink. Please delete or move $($dest) into config directory"
      continue
    }
  }
  mklink $dest $source
}

$jsondata = Get-Content -Raw -Path $configPath | ConvertFrom-Json
$jsondata.links | ForEach-Object {
  if ($_.linkAll) {
    $config = $_
    $pattern = "*"
    if ($_.pattern) {
      $pattern = $_.pattern
    }
    Get-Item -Path "$($pwd.Path)\$($config.source)\\$pattern" | ForEach-Object {
      $fullDestPath = "$($config.destination)\$(Split-Path -Path $_ -Leaf)"
      linkSingle $fullDestPath $_
    }
  }
  else {
    $fullSourcePath = "$($pwd.Path)\$($_.source)"
    linkSingle $_.destination $fullSourcePath
  }
}

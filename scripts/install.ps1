<#
.SYNOPSIS
  Install the Lined Paper + Cornell Notes snippets into an Obsidian vault (Windows).
.EXAMPLE
  .\scripts\install.ps1 -Vault "C:\Users\me\Documents\MyVault" -WithTemplates
#>
param(
  [Parameter(Mandatory = $true)][string]$Vault,
  [switch]$WithTemplates
)

$ErrorActionPreference = "Stop"
if (-not (Test-Path $Vault -PathType Container)) { throw "Vault folder not found: $Vault" }

$Repo       = Split-Path -Parent $PSScriptRoot
$Snippets   = Join-Path $Vault ".obsidian\snippets"
$Appearance = Join-Path $Vault ".obsidian\appearance.json"

New-Item -ItemType Directory -Force -Path $Snippets | Out-Null
Copy-Item (Join-Path $Repo "snippets\*.css") $Snippets -Force
Write-Host "Copied snippets to $Snippets"

if ($WithTemplates) {
  $T = Join-Path $Vault "Templates"
  New-Item -ItemType Directory -Force -Path $T | Out-Null
  Copy-Item (Join-Path $Repo "templates\*.md") $T -Force
  Write-Host "Copied templates to $T"
}

# Switch the snippets on (keeps your other appearance settings).
$data = @{}
if (Test-Path $Appearance) {
  $json = Get-Content $Appearance -Raw | ConvertFrom-Json
  $json.PSObject.Properties | ForEach-Object { $data[$_.Name] = $_.Value }
}
$enabled = @()
if ($data.ContainsKey("enabledCssSnippets")) { $enabled = @($data["enabledCssSnippets"]) }
foreach ($name in "lined-paper", "cornell-notes") { if ($enabled -notcontains $name) { $enabled += $name } }
$data["enabledCssSnippets"] = $enabled
$data | ConvertTo-Json -Depth 10 | Set-Content $Appearance -Encoding UTF8
Write-Host "Enabled both snippets in $Appearance"
Write-Host "Done. Restart Obsidian (or reload) if it was open."

param([string]$Engine = 'xelatex')
$ErrorActionPreference = 'Stop'
$repo = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
$sourceDir = Join-Path $repo 'papers/src'
$buildDir = Join-Path $repo '.build'
$source = Join-Path $sourceDir 'nadel_vanishing_note.tex'
$stem = [IO.Path]::GetFileNameWithoutExtension($source)
New-Item -ItemType Directory -Force -Path $buildDir | Out-Null
Push-Location $sourceDir
try {
    for ($pass = 1; $pass -le 3; $pass++) {
        & $Engine '-interaction=nonstopmode' '-halt-on-error' '-no-shell-escape' "-output-directory=$buildDir" 'nadel_vanishing_note.tex' *> (Join-Path $buildDir "pass-$pass.txt")
        if ($LASTEXITCODE -ne 0) { throw "LaTeX failed on pass $pass. See .build/pass-$pass.txt." }
    }
} finally { Pop-Location }
$log = Get-Content -LiteralPath (Join-Path $buildDir "$stem.log") -Raw
if ($log -match 'There were undefined references|Citation .+ undefined|Reference .+ undefined|Rerun to get cross-references right') {
    throw 'Unresolved citations/references remain; inspect the build log.'
}
$target = Join-Path $repo 'papers/paper_v1.pdf'
Copy-Item -LiteralPath (Join-Path $buildDir "$stem.pdf") -Destination $target
$manifest = [ordered]@{
    schema_version = 1
    source = 'papers/src/nadel_vanishing_note.tex'
    source_sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $source).Hash.ToLowerInvariant()
    pdf = 'papers/paper_v1.pdf'
    pdf_sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $target).Hash.ToLowerInvariant()
    built_at_utc = [DateTime]::UtcNow.ToString('o')
    engine = [IO.Path]::GetFileNameWithoutExtension($Engine)
    passes = 3
    unresolved_references = $false
    mathematical_verification = 'Not performed; compilation is not a mathematical proof check.'
}
$manifest | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $repo 'verification/build_manifest.json') -Encoding utf8
Write-Output 'Built papers/paper_v1.pdf and updated verification/build_manifest.json.'

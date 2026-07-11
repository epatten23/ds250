$basePath = "c:\Users\ellap\mythings\2026Spring\ds251"
$combined_content = @()

# Unit 1-4 task files
$units = @(
    @{unit=1; tasks=@(1,2,3)},
    @{unit=2; tasks=@(1,2,3)},
    @{unit=3; tasks=@(1,2,3)},
    @{unit=4; tasks=@(1,2,3)}
)

foreach ($u in $units) {
    foreach ($task in $u.tasks) {
        $filePath = "$basePath\unit$($u.unit)\unit$($u.unit)_task$($task)_template.html"
        if (Test-Path $filePath) {
            try {
                $content = Get-Content $filePath -Raw
                if ($content -match '<main[^>]*>([\s\S]*?)</main>') {
                    $mainContent = $matches[1]
                    $combined_content += "<section id='unit$($u.unit)-task$task'><h2>Unit $($u.unit) - Task $task</h2>$mainContent</section>"
                    Write-Host "✓ Unit $($u.unit) Task $task"
                }
            } catch {
                Write-Host "✗ Unit $($u.unit) Task $task"
            }
        }
    }
}

# Unit 5 final report
$filePath = "$basePath\unit5\unit5_finalreport_withstretch.html"
if (Test-Path $filePath) {
    try {
        $content = Get-Content $filePath -Raw
        if ($content -match '<main[^>]*>([\s\S]*?)</main>') {
            $mainContent = $matches[1]
            $combined_content += "<section id='unit5-final'><h2>Unit 5 - Final Report with Stretch</h2>$mainContent</section>"
            Write-Host "✓ Unit 5 Final Report"
        }
    } catch {
        Write-Host "✗ Unit 5 Final Report"
    }
}

Write-Host "`nTotal sections: $($combined_content.Count)"

# Save to temp file
$tempFile = "c:\Users\ellap\mythings\2026Spring\ds250\docs\unit_content.html"
$combined_content | Out-File -FilePath $tempFile -Encoding UTF8
Write-Host "Saved combined content to: $tempFile"
Write-Host "File size: $((Get-Item $tempFile).Length) bytes"

### pshazz
try { $null = gcm pshazz -ea stop; pshazz init 'default' } catch { }

### posh-git
Import-Module posh-git

$GitPromptSettings.DefaultPromptPath.ForegroundColor = 0xFFA500
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'
$GitPromptSettings.DefaultPromptWriteStatusFirst = $true

### Functions

function hgPushAndPr(){
    $line = (hg push | where { $_ -like "*https://*" })
	if ($line) {
        $stIndex = $line.IndexOf("https://")
        $endIndex = $line.IndexOf(" ", $stIndex)
        $url = $line.Substring($stIndex, $endIndex)
        echo $url
        start $url
	}
}

### Aliases
New-Alias which Get-Command

### Remove powershell alias
remove-item alias:curl

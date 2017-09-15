
### pshazz
try { $null = gcm pshazz -ea stop; pshazz init 'default' } catch { }

### Variables
$srcHabitica = (Get-Command habitica).Source

### Functions
function habiticaCli(){
    python $srcHabitica $args
}

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
New-Alias habitica habiticaCli

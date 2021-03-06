param(
  [parameter(Mandatory=$true)] [string]$Name
)
#http://en.wikipedia.org/wiki/The_Name_Game

#grab first letter
$OriginalPrefix = $Name.Substring(0,1)

#get root of name. Vowel-starting names are kept whole.
if(
    $Name.ToLower().StartsWith("a") -or
    $Name.ToLower().StartsWith("e") -or
    $Name.ToLower().StartsWith("i") -or
    $Name.ToLower().StartsWith("o") -or
    $Name.ToLower().StartsWith("u")
) {
    $NameRoot = $Name.ToLower()
}
else {
    $NameRoot = $Name.Substring(1)
}

#determine if there is a blend prefix and fetch if needed
$Prefix = "bl", "br", "ch", "ck", "cl", "cr", "dr", "fl", "fr", "gh", "gl", "gr", "ng", "ph", "pl", "pr", "qu", "sc", "sh", "sk", "sl", "sm", "sn", "sp", "st", "sw", "th", "tr", "tw", "wh", "wr", "nth", "sch", "scr", "shr", "spl", "spr", "squ", "str", "thr"
$Prefix | ForEach-Object {
    if ($Name.ToLower().StartsWith($_.ToLower())) {
        $OriginalPrefix = $Name.Substring(0,$_.Length)
        $NameRoot = $Name.Substring($_.Length)
    }
}

Write-Debug "Original Name: $Name"
Write-Debug "Original Prefix: $OriginalPrefix"
Write-Debug "Original Name Root: $NameRoot"

$SingIt = "{0}, {0} bo-{1}{2}`r`nBanana-fana fo-{3}{2}`r`nFee-Fi-mo-{4}{2}`r`n{0}!" -f (Get-Culture).TextInfo.ToTitleCase($Name),"B",$NameRoot,"F","M"
Write-Host $SingIt

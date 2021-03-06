param(
  [parameter(Mandatory=$true)] [Int64]$bottles
)
$initialBottles = $bottles
while($bottles -gt 0){
    $sing = "$bottles bottles of beer on the wall! $bottles bottles of beer! You take one down, and pass it around, " + (--$bottles).ToString() + " bottles of beer on the wall!"
    if($bottles -eq 0){
        $sing = $sing -replace "1 bottles", "1 bottle"
    }
    Write-Host $sing 
    $pct = [int](100-($bottles/$initialBottles*100))
    Write-Progress -activity "Drinking" -status "Percent drunk: $pct%" -PercentComplete $pct
}
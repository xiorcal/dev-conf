Import-Module AudioDeviceCmdlets

$current = Get-DefaultAudioDevice
$all = Get-AudioDeviceList

$speakers_name = "enceintes (Realtek High Definition Audio)"
$headset_name = "steelseries (SteelSeries Arctis 5 Chat)"

$speakers = $all | Where-Object {$_.DeviceFriendlyname -like $speakers_name}
$headset = $all | Where-Object {$_.DeviceFriendlyname -like $headset_name}

Write-Output "Current device : $($current.DeviceFriendlyname)"
Write-Output "Speakers device : $($speakers.DeviceFriendlyname)"
Write-Output "Headset device : $($headset.DeviceFriendlyname)"

if ($current.DeviceFriendlyname -like $speakers.DeviceFriendlyname) {
  $target = $headset
}
else {
  $target = $speakers
}
Write-Output "Target device : $($target.DeviceFriendlyname)"

Set-DefaultAudioDevice -InputObject $target
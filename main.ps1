#module import#
Import-Module -Force .\CreateDisk.psm1

#preamble#
$version = "1.0"
Write-Host "Hyper-V Disk Manager by Krzysztoff"
Write-Host "Version:"$version
#preamble#

CreateDisk
#SelectDiskSize#

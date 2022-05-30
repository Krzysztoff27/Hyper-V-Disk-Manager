function CreateDisk{
    Write-Host "CreateDisk has been called!"

    $path = "C:\Users\krzys\Desktop"

    SelectDiskType

}

function SelectDiskType{
    Write-Host "Disk type: VHD/VHDX"
    $DiskType = Read-Host
    
    if ($DiskType -eq "VHD" -or $DiskType -eq "VHDX") {
        Write-Host "correct"
    }else {
        Write-Host "error"
        SelectDiskType
    }

    return $DiskType
}

function SelectDiskSize{
    Write-Host "Size unit: MB, GB, TB"
    $SizeUnit = Read-Host

    <#if ($SizeUnit = "MB") {$SizeUnit = "MB"}
    elseif ($SizeUnit = "GB") {$SizeUnit = "GB"}
    elseif ($SizeUnit = "TB") {$SizeUnit = "TB"}
    else{
        Write-Host "wrong format, retry"
        SelectDiskSize
    }#>

    switch ($SizeUnit) {
        MB {$SizeUnit -eq "MB"}
        GB {$SizeUnit -eq "GB"}
        TB {$SizeUnit -eq "TB"}
        default {"MB"}
    }
    
    Write-Host "Disk size (default ): "
    $DiskSize = Read-Host

    #parse to int, not used for now#
    <#$DiskSize = $DiskSize -as [int]

    if ($DiskSize -is [int]) {
        Write-Host "yes"
    }else{
        Write-Host "no"
    }#>

    return $DiskSize+$SizeUnit

}
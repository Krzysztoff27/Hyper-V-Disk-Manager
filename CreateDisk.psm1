function CreateDisk{
    Write-Host "CreateDisk has been called!"

    $path = "C:\Users\krzys\Desktop"

    SelectDiskType
    SelectDiskSize
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
}

function SelectDiskSize{
    #selecting size unit#
    Write-Host "Size unit: MB, GB, TB"
    $SizeUnit = Read-Host

    while (1) {
        if ($SizeUnit -match "[MGT]B") {
            break
        }else{
            Write-Host "Size unit: MB, GB, TB"
            $SizeUnit = Read-Host
        }
    }

    #selecting disk size#
    Write-Host "Disk size (default): "
    $DiskSize = Read-Host
    
    while (1) {
        if ($DiskSize -match "^\d+$") {
            break
        }else{
            Write-Host "NaN"
            Write-Host "Disk size (default): "
            $DiskSize = Read-Host
        }
    }

    #final validation#
    if ($SizeUnit -eq "MB" -and $DiskSize -lt 3) {
        Write-Host "Minimal disk size is 3 MB!"
        SelectDiskSize
    }else{
        break
    }
}
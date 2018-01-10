function Get-JamfMobileDevice {
    [Cmdletbinding()]
    param(

        [Parameter(Mandatory=$true)]$JssAPIurl,

        [ValidateNotNull()]
        [System.Management.Automation.Credential()]
        [PScredential]
        $Credential,

        [AllowNull()][String[]]$Id,

        # Find Mobile device by name
        [AllowNull()][String]$Name,

        # Find Mobile Device by Serial Number
        [AllowNull()][string]$SerialNumber,

        # Find Mobile Device by Wifi Mac Address
        [AllowNull()][string]$MacAddress,

        # Find Mobile Device by udid
        [AllowNull()][string]$udid,

        # Find mobile device that matches criteria. Is able to take Wildcards (*).
        [AllowNull()][string]$Match,

        # Specifies a path to one or more locations.
        [Parameter(Mandatory=$false,
                   ParameterSetName="ParameterSetName",
                   HelpMessage="Path to save location.")]
        [AllowNull()][string]$OutFilePath
        )

    if (($id -eq $null) -and ($Name -eq "") -and ($SerialNumber -eq "") -and ($MacAddress -eq "") -and ($udid -eq "") -and ($Match -eq "")) {
        
        $Uri = "$JssAPIurl/JSSResource/mobiledevices"
        if ($OutFilePath) {
            
            Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
            Write-Output "File saved at $OutFilePath"
        }
        else {

            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $MobileDevices = $R.mobile_devices.mobile_device
            return $MobileDevices
        }
        
    }
    elseif ($id){

        foreach($i in $Id){

            $query = "mobiledevices/id/$i"
            $Uri = "$JssAPIurl/JSSResource/$query"

            if ($OutFilePath) {

                Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
                Write-Output "File saved at $OutFilePath"

            }
            else {
                
                $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
                $MobileDevice = $R.mobile_device
                $DeviceName = $MobileDevice.general | select -ExpandProperty device_name
                $DeviceId = $MobileDevice.general | select -ExpandProperty id
                Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "device_name" -Value $DeviceName
                Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "id" -Value $DeviceId
                $MobileDevice
                continue

            }

        }
        
    }
    elseif ($Name) {

        $query = "mobiledevices/name/$name"
        $Uri = "$JssAPIurl/JSSResource/$query"

        if ($OutFilePath) {

            Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
            Write-Output "File saved at $OutFilePath"

        }
        else {

            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $MobileDevice = $R.mobile_device
            $DeviceName = $MobileDevice.general | select -ExpandProperty device_name
            $DeviceId = $MobileDevice.general | select -ExpandProperty id
            Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "device_name" -Value $DeviceName
            Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "id" -Value $DeviceId
            return $MobileDevice

        }

    }
    elseif ($SerialNumber) {

        $query = "mobiledevices/serialnumber/$SerialNumber"
        $Uri = "$JssAPIurl/JSSResource/$query"
        
        if ($OutFilePath) {

            Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
            Write-Output "File saved at $OutFilePath"

        }
        else {

            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $MobileDevice = $R.mobile_device
            $DeviceName = $MobileDevice.general | select -ExpandProperty device_name
            $DeviceId = $MobileDevice.general | select -ExpandProperty id
            Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "device_name" -Value $DeviceName
            Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "id" -Value $DeviceId
            return $MobileDevice

        }

    }
    elseif ($MacAddress) {

        $query = "mobiledevices/macaddress/$MacAddress"
        $Uri = "$JssAPIurl/JSSResource/$query"
        
        if ($OutFilePath) {

            Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
            Write-Output "File saved at $OutFilePath"

        }
        else {

            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $MobileDevice = $R.mobile_device
            $DeviceName = $MobileDevice.general | select -ExpandProperty device_name
            $DeviceId = $MobileDevice.general | select -ExpandProperty id
            Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "device_name" -Value $DeviceName
            Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "id" -Value $DeviceId
            return $MobileDevice

        }

    }
    elseif ($udid) {

        $query = "mobiledevices/udid/$udid"
        $Uri = "$JssAPIurl/JSSResource/$query"
        
        if ($OutFilePath) {

            Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
            Write-Output "File saved at $OutFilePath"

        }
        else {

            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $MobileDevice = $R.mobile_device
            $DeviceName = $MobileDevice.general | select -ExpandProperty device_name
            $DeviceId = $MobileDevice.general | select -ExpandProperty id
            Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "device_name" -Value $DeviceName
            Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "id" -Value $DeviceId
            return $MobileDevice

        }

    }
    elseif ($Match) {

        $query = "mobiledevices/match/$Match"
        $Uri = "$JssAPIurl/JSSResource/$query"
        
        if ($OutFilePath) {

            Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
            Write-Output "File saved at $OutFilePath"

        }
        else {

            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $MobileDevice = $R.mobile_devices.mobile_device
            # $DeviceName = $MobileDevice.general | select -ExpandProperty device_name
            # $DeviceId = $MobileDevice.general | select -ExpandProperty id
            # Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "device_name" -Value $DeviceName
            # Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "id" -Value $DeviceId
            return $MobileDevice

        }

    }

}
<#
STATUS 200 Your request was successful.
STATUS 201 Your request to create or update an object was successful.
STATUS 400 There was something wrong with your request. You should check the request and reattempt.
STATUS 401 Your authentication for the request failed. Check your credentials and reattempt.
STATUS 403 You have made a valid request, but you lack permissions to the object you are trying to interact with.
STATUS 404 The object/resource you were requesting could not be found. Check the URL and reattempt.
STATUS 409 There was a conflict when your request was processed. Normally this is due to your data not including all of the required fields, having invalid fields or values, or there is a conflict between your object and another (e.g. some resources require a unique <name>). Check your data and reattempt.
STATUS 500 This is a generic internal server error. A 500 status code usually indicates something has gone wrong on the server end and is unrelated to your request.
#>

function Get-JamfMobileDevice {
    [Cmdletbinding()]
    param(
        [Parameter(Mandatory=$true)]$JssAPIurl,
        [Parameter(Mandatory=$true)]
        [System.Management.Automation.CredentialAttribute()]
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
    if ($Credential -eq $null) {
        $Credential = Get-Credential
    }

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


function Get-JamfComputer {
    [Cmdletbinding()]
    param(
        [Parameter(Mandatory=$true)]$JssAPIurl,
        [Parameter(Mandatory=$true)]
        [System.Management.Automation.CredentialAttribute()]
        $Credential,
        [AllowNull()][String[]]$Id,
        # Find computer by name
        [AllowNull()][String]$Name,
        # Find computer by Serial Number
        [AllowNull()][string]$SerialNumber,
        # Find computer by Wifi Mac Address
        [AllowNull()][string]$MacAddress,
        # Find computer by udid
        [AllowNull()][string]$udid,
        # Find computer that matches criteria. Is able to take Wildcards (*).
        [AllowNull()][string]$Match,
        # Specifies a path to one location.
        [Parameter(Mandatory=$false,
                   ParameterSetName="ParameterSetName",
                   HelpMessage="Path to save location.")]
        [AllowNull()][string]$OutFilePath
        )
    if ($Credential -eq $null) {
        $Credential = Get-Credential
    }

    if (($id -eq $null) -and ($Name -eq "") -and ($SerialNumber -eq "") -and ($MacAddress -eq "") -and ($udid -eq "") -and ($Match -eq "")) {
        
        $Uri = "$JssAPIurl/JSSResource/computers"
        if ($OutFilePath) {
            
            Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
            Write-Output "File saved at $OutFilePath"
        }
        else {

            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $Computers = $R.computers.computer
            return $Computers
        }
        
    }
    elseif ($id){

        foreach($i in $Id){

            $query = "computers/id/$i"
            $Uri = "$JssAPIurl/JSSResource/$query"

            if ($OutFilePath) {

                Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
                Write-Output "File saved at $OutFilePath"

            }
            else {
                
                $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
                $Computer = $R.computers
                $DeviceName = $Computer.general | select -ExpandProperty name
                $DeviceId = $Computer.general | select -ExpandProperty id
                Add-Member -InputObject $Computer -MemberType NoteProperty -Name "computer_name" -Value $DeviceName
                Add-Member -InputObject $Computer -MemberType NoteProperty -Name "id" -Value $DeviceId
                $Computer
                continue

            }

        }
        
    }
    elseif ($Name) {

        $query = "computers/name/$name"
        $Uri = "$JssAPIurl/JSSResource/$query"

        if ($OutFilePath) {

            Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
            Write-Output "File saved at $OutFilePath"

        }
        else {

            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $Computer = $R.computer
            $DeviceName = $Computer.general | select -ExpandProperty name
            $DeviceId = $Computer.general | select -ExpandProperty id
            Add-Member -InputObject $Computer -MemberType NoteProperty -Name "computer_name" -Value $DeviceName
            Add-Member -InputObject $Computer -MemberType NoteProperty -Name "id" -Value $DeviceId
            return $Computer

        }

    }
    elseif ($SerialNumber) {

        $query = "computers/serialnumber/$SerialNumber"
        $Uri = "$JssAPIurl/JSSResource/$query"
        
        if ($OutFilePath) {

            Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
            Write-Output "File saved at $OutFilePath"

        }
        else {

            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $Computer = $R.computer
            $DeviceName = $Computer.general | select -ExpandProperty name
            $DeviceId = $Computer.general | select -ExpandProperty id
            Add-Member -InputObject $Computer -MemberType NoteProperty -Name "computer_name" -Value $DeviceName
            Add-Member -InputObject $Computer -MemberType NoteProperty -Name "id" -Value $DeviceId
            return $Computer

        }

    }
    elseif ($MacAddress) {

        $query = "computers/macaddress/$MacAddress"
        $Uri = "$JssAPIurl/JSSResource/$query"
        
        if ($OutFilePath) {

            Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
            Write-Output "File saved at $OutFilePath"

        }
        else {

            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $Computer = $R.computer
            $DeviceName = $Computer.general | select -ExpandProperty name
            $DeviceId = $Computer.general | select -ExpandProperty id
            Add-Member -InputObject $Computer -MemberType NoteProperty -Name "computer_name" -Value $DeviceName
            Add-Member -InputObject $Computer -MemberType NoteProperty -Name "id" -Value $DeviceId
            return $Computer

        }

    }
    elseif ($udid) {

        $query = "computers/udid/$udid"
        $Uri = "$JssAPIurl/JSSResource/$query"
        
        if ($OutFilePath) {

            Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
            Write-Output "File saved at $OutFilePath"

        }
        else {

            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $Computer = $R.computer
            $DeviceName = $Computer.general | select -ExpandProperty name
            $DeviceId = $Computer.general | select -ExpandProperty id
            Add-Member -InputObject $Computer -MemberType NoteProperty -Name "computer_name" -Value $DeviceName
            Add-Member -InputObject $Computer -MemberType NoteProperty -Name "id" -Value $DeviceId
            return $Computer

        }

    }
    elseif ($Match) {

        $query = "computers/match/$Match"
        $Uri = "$JssAPIurl/JSSResource/$query"
        
        if ($OutFilePath) {

            Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -OutFile $OutFilePath
            Write-Output "File saved at $OutFilePath"

        }
        else {

            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $Computer = $R.computers
            # $DeviceName = $Computer.general | select -ExpandProperty name
            # $DeviceId = $Computer.general | select -ExpandProperty id
            # Add-Member -InputObject $Computer -MemberType NoteProperty -Name "computer_name" -Value $DeviceName
            # Add-Member -InputObject $Computer -MemberType NoteProperty -Name "id" -Value $DeviceId
            return $Computer

        }

    }

}

# Get-JamfComputer

function Get-JamfDeviceCommand {
    #Incomplete Function
    [Cmdletbinding()]
    param(
        [Parameter(ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true)][String[]]$Id,
        [ValidateSet("Settings", "EraseDevice", "ClearPasscode", "UnmanageDevice", "UpdateInventory", "ClearRestrictionsPassword", "SettingsEnableDataRoaming", "SettingsDisableDataRoaming", "SettingsEnableVoiceRoaming", "SettingsDisableVoiceRoaming", "SettingsEnableAppAnalytics", "SettingsDisableAppAnalytics", "SettingsEnableDiagnosticSubmission", "SettingsDisableDiagnosticSubmission", "BlankPush", "ShutDownDevice", "RestartDevice", "PasscodeLockGracePeriod")]
        [string]$Command,
        [System.Management.Automation.CredentialAttribute()]$Credential,
        [Parameter(Mandatory=$true)]$JssAPIurl,
        )

    if ($Credential -eq $null) {
        
        $Credential = Get-Credential

    }

    if ($id -eq $null) {

        $query = "mobiledevicecommands"
        $Uri = "$JssAPIurl/JSSResource/$query"
        $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential

    }
    else {

        $query = "mobiledevicecommands/command/id/$Id"
        $Uri = "$JssAPIurl/JSSResource/$query"
        $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
        
    }
    if ($Command -eq $true) {

        $CmdUri = "$JssAPIurl/JSSResource/mobiledevicecommands/command/$Command"
        $Rcmd = Invoke-RestMethod -Uri $CmdUri -Method Get -Credential $Credential
        return $Rcmd.mobile_device_commands.mobile_device_command

    }

}

function Send-JamfDeviceCommand {
    [Cmdletbinding()]
    param(
        [Parameter(ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true)][String[]]$Id,
        [ValidateSet("Settings", "EraseDevice", "ClearPasscode", "UnmanageDevice", "UpdateInventory", "ClearRestrictionsPassword", "SettingsEnableDataRoaming", "SettingsDisableDataRoaming", "SettingsEnableVoiceRoaming", "SettingsDisableVoiceRoaming", "SettingsEnableAppAnalytics", "SettingsDisableAppAnalytics", "SettingsEnableDiagnosticSubmission", "SettingsDisableDiagnosticSubmission", "BlankPush", "ShutDownDevice", "RestartDevice", "PasscodeLockGracePeriod")]
        [string]$Command,
        [System.Management.Automation.CredentialAttribute()]$Credential,
        [Parameter(Mandatory=$true)]$JssAPIurl,
        [switch]$OutPutCommands
        )
    if ($Credential -eq $null) {
        $Credential = Get-Credential
    }

    if ($id -eq $null) {
        Write-Host "ERROR: Please provide valid Device ID(s) in orther to process commands" -ForegroundColor Red
    }
    else {
        $JoinId = $Id -join ","
        $query = "mobiledevicecommands/command/$Command/id/$JoinId"
        $Uri = "$JssAPIurl/JSSResource/$query"
        $R = Invoke-RestMethod -Uri $Uri -Method Post -Credential $Credential
        
        
    }
    if ($OutPutCommands -eq $true) {

        $CmdUri = "$JssAPIurl/JSSResource/mobiledevicecommands/command/$Command"
        $Rcmd = Invoke-RestMethod -Uri $CmdUri -Method Get -Credential $Credential
        return $Rcmd.mobile_device_commands.mobile_device_command

    }

}








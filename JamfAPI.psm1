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
<# Snippets:
     $Body = "<mobile_device><general><display_name>EWTDEVTEST</display_name><device_name>EWTDEVTEST</device_name><name>EWTDEVTEST</name></general></mobile_device>"
     $ProdUri = "https://nychh.jamfcloud.com/JSSResource/$query"


#>

function Get-JamfMobileDevice {
    [Cmdletbinding()]
    param(
        [String[]][AllowNull()]$Id,
        [System.Management.Automation.CredentialAttribute()]$Credential,
        [Parameter(Mandatory=$true)]$JssAPIurl
        )
    if ($Credential -eq $null) {
        $Credential = Get-Credential
    }

    if ($id -eq $null) {
        $Uri = "$JssAPIurl/JSSResource/mobiledevices"
        $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
        $MobileDevices = $R.mobile_devices.mobile_device
        return $MobileDevices
    }
    else {
        foreach($i in $Id){
            $query = "mobiledevices/id/$i"
            $Uri = "$JssAPIurl/JSSResource/$query"
            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $MobileDevice = $R.mobile_device
            $DeviceName = $MobileDevice.general | select -ExpandProperty device_name
            $DeviceId = $MobileDevice.general | select -ExpandProperty id
            Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "device_name" -Value $DeviceName
            Add-Member -InputObject $MobileDevice -MemberType NoteProperty -Name "id" -Value $DeviceId
            $MobileDevice
            continue
        }
        # $JoinId = $Id -join ","
    }

}

#Get-JamfMobileDevice -Id 1

function Get-JamfComputer {
    [Cmdletbinding()]
    param(
        [String[]][AllowNull()]$Id,
        #[parameter(Mandatory = $true)]
        [System.Management.Automation.CredentialAttribute()]$Credential,
        [Parameter(Mandatory=$true)]$JssAPIurl
        )
    if ($Credential -eq $null) {
        $Credential = Get-Credential
    }

    if ($Id -eq $null) {
        $Uri = "$JssAPIurl/JSSResource/computers"
        $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
        $Computers = $R.computers.computer
        return $Computers
    }
    else {
        foreach($i in $Id){
            $query = "computers/id/$i"
            $Uri = "$JssAPIurl/JSSResource/$query"
            $R = Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential
            $Computer = $R.computer
            $ComputerName = $Computer.general | select -ExpandProperty Name
            $ComputerId = $Computer.general | select -ExpandProperty id
            Add-Member -InputObject $Computer -MemberType NoteProperty -Name "computer_name" -Value $ComputerName
            Add-Member -InputObject $Computer -MemberType NoteProperty -Name "id" -Value $ComputerId
            $Computer
            continue
        }
        
    }

}

# Get-JamfComputer

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









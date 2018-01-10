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
                $Computer = $R.computer
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
        [Parameter(Mandatory=$true)]$JssAPIurl
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

function Rename-JamfComputerFromCsv {
    [CmdletBinding(ConfirmImpact='High',DefaultParameterSetName='Direct Rename')]
    <#
    .Synopsis
    Short description
    .DESCRIPTION
    Long description
    .EXAMPLE
    Example of how to use this cmdlet
    .EXAMPLE
    Another example of how to use this cmdlet
    .INPUTS
    Inputs to this cmdlet (if any)
    .OUTPUTS
    Output from this cmdlet (if any)
    .NOTES
    General notes
    .COMPONENT
    The component this cmdlet belongs to
    .ROLE
    The role this cmdlet belongs to
    .FUNCTIONALITY
    The functionality that best describes this cmdlet
    #>
    param (
        [Parameter(Mandatory=$true)]$JssAPIurl,

        [Parameter(Mandatory=$true)]
        [System.Management.Automation.CredentialAttribute()]
        $Credential,

        # Path to Xml report location generated by Jamf cmdlets.
        [Parameter(Mandatory=$true,
                   ParameterSetName='CSV Rename',
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true,
                   HelpMessage="Path to Xml report location generated by Jamf cmdlets.")]
        [Alias("Path")]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({test-path $_})]
        [Alias('csv')]
        [string]
        $CSVReport
    )
    
    begin {
       
        # Validate CSV report:

        $csv = Get-Content -Path $CSVReport
        $csvarray = $csv.Split(',')
        $Validate = [bool](($csvarray -contains "Serial Number") -and ($csvarray -contains "Computer Name"))
        if ($Validate -eq $false) {
            Write-Error "Unable to validate CSV report. Please ensure report contains columns named 'Computer Name' and 'Serial Number'."
        }

        $csvobj = Import-Csv $CSVReport | select -Property "Computer Name","Serial Number"
        $csvsn = $csvobj | select -ExpandProperty "Serial Number"
        $csvnames = $csvobj | select -ExpandProperty "Computer Name"

        # Get computer info based on provided SN:
        
        $Computers += foreach ($sn in $csvsn) {
            try {

                $query = "computers/serialnumber/$SN"
                $Uri = "$JssAPIurl/JSSResource/$query"
                $r = Invoke-RestMethod -Uri $Uri -Credential $Credential -Method Get -ErrorAction SilentlyContinue -ErrorVariable ER
                $CompGen = $r.computer.general | select -Property "name","serial_number"
                $CompGen
                
            }
            catch {
                Write-Warning "A computer that matches $sn was not found, skipping renaming $($CompGen.name)"
            }
            

        }
        
        # ForEach computer object name that is not equal to other computer object name create variable that contains resultant computer objects that are different.
       
        $ToRenameComps += foreach ($comp in $csvobj) {
            if ($Computers.name -contains $comp.'Computer Name') {
                continue
            }
            else {
                $rename = $Computers | where {$_.serial_number -eq $comp.'Serial Number'}
                $rename
            }
            
        } 
        $RenamedComps += foreach ($comp in $Computers) {
            if ($csvobj.'Computer Name' -contains $comp.name) {
                continue
            }
            else {
                $renamed = $csvobj | where {$_.'Serial Number' -eq $comp.serial_number}
                $renamed
            }
            
        }
        $toRenamest = $ToRenameComps | select -ExpandProperty name
        $Renamedst= $RenamedComps | select -ExpandProperty 'Computer Name'

        if ($ToRenameComps -eq $null) {
            write-host "There are no devices to rename." -ForegroundColor Green
            exit
        }

        for ($i = 0; $i -lt $ToRenameComps.Length; $i++) {

            $Message = "Rename '$($toRenamest[$i])' to '$($Renamedst[$i])'"
            Write-Host $Message -ForegroundColor blue

        }
        
        # Ask for confirmation:

        $caption = "Choose Action";
        $message = "Rename the above computers?"
        $continue = new-Object System.Management.Automation.Host.ChoiceDescription "&Continue","Continue renaming computers";
        $stop = new-Object System.Management.Automation.Host.ChoiceDescription "&Stop","No computers will be renamed";
        $choices = [System.Management.Automation.Host.ChoiceDescription[]]($continue,$stop);
        $answer = $host.ui.PromptForChoice($caption,$message,$choices,0)

        switch ($answer){
            0 {"Renaming Computers..."}
            1 {"No changes made"; exit}
        }

        # Renaming:
        foreach ($rcmps in $RenamedComps) {
            
            try {
                Write-host "Renaming to $($rcmps.'Computer Name')" -ForegroundColor Magenta
                $query = "computers/serialnumber/$($rcmps.'Serial Number')"
                $Uri = "$JssAPIurl/JSSResource/$query"
                $body = "<computer><general><name>" + $($rcmps.'Computer Name') + "</name></general></computer>"
                $Putr = Invoke-RestMethod -Uri $Uri -Credential $Credential -Method Put -Body $body -ErrorAction SilentlyContinue -ErrorVariable RE
            }
            catch {
                Write-Warning "An error has occured while trying to rename $($rcmps.'Computer Name') read following error message:"
                Write-Output -InputObject $RE
            }
            
        }

    }
    
    process {
        
        
    }
    
    end {


    }
}

function Rename-JamfDeviceFromCsv {
    [CmdletBinding(ConfirmImpact='High',DefaultParameterSetName='Direct Rename')]
    <#
    .Synopsis
    Renames Mobile Devices based on a provided CSV file.
    .DESCRIPTION
    Long description
    .EXAMPLE
    Example of how to use this cmdlet
    .EXAMPLE
    Another example of how to use this cmdlet
    .INPUTS
    Inputs to this cmdlet (if any)
    .OUTPUTS
    Output from this cmdlet (if any)
    .NOTES
    General notes
    .COMPONENT
    The component this cmdlet belongs to
    .ROLE
    The role this cmdlet belongs to
    .FUNCTIONALITY
    The functionality that best describes this cmdlet
    #>
    param (
        [Parameter(Mandatory=$true)]$JssAPIurl,

        [Parameter(Mandatory=$true)]
        [System.Management.Automation.CredentialAttribute()]
        $Credential,

        # Path to Xml report location generated by Jamf cmdlets.
        [Parameter(Mandatory=$true,
                   ParameterSetName='CSV Rename',
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true,
                   HelpMessage="Path to Xml report location generated by Jamf cmdlets.")]
        [Alias("Path")]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({test-path $_})]
        [Alias('csv')]
        [string]
        $CSVReport
    )
    
    begin {
       
        # Validate CSV report:
        Write-Host "Validating CSV Report..." -ForegroundColor Blue
        $csv = Get-Content -Path $CSVReport
        $csvarray = $csv.Split(',')
        $Validate = [bool](($csvarray -contains "Serial Number") -and ($csvarray -contains "Display Name"))
        if ($Validate -eq $false) {
            Write-Error "Unable to validate CSV report. Please ensure report contains columns named 'Device Name' and 'Serial Number'."
        }

        $csvobj = Import-Csv $CSVReport | select -Property "Display Name","Serial Number"
        $csvsn = $csvobj | select -ExpandProperty "Serial Number"
        $csvnames = $csvobj | select -ExpandProperty "Display Name"

        # Get computer info based on provided SN:
        
        Write-Host "Comparing data with Jamf Databse..." -ForegroundColor Blue
        $Devices += foreach ($sn in $csvsn) {
            try {

                $query = "mobiledevices/serialnumber/$SN"
                $Uri = "$JssAPIurl/JSSResource/$query"
                $r = Invoke-RestMethod -Uri $Uri -Credential $Credential -Method Get -ErrorAction SilentlyContinue -ErrorVariable ER
                $DevGen = $r.mobile_device.general | select -Property "name","serial_number","id"
                $DevGen
                
            }
            catch {
                Write-Warning "A computer that matches $sn was not found, skipping renaming $($DevGen.name)"
            }
            

        }
        
        # ForEach computer object name that is not equal to other computer object name create variable that contains resultant computer objects that are different.

        for ($d = 0; $d -lt $Devices.Count; $d++) {

            if ($Devices.name -contains $csvobj[$d].'Display Name') {continue}
            elseif ($Devices[$d].serial_number -eq $csvobj[$d].'Serial Number') {
                
                [array]$ToRenameDevices += $Devices[$d] | select -Property 'name','serial_number','id'
                [array]$RenamedDevices += $csvobj[$d] | select -Property 'Display Name','Serial Number'
                $RenamedDevices[$d] | Add-Member -MemberType NoteProperty -Name 'id' -Value $ToRenameDevices[$d].id -Force
                
                $toRenamest = @($ToRenameDevices | select -ExpandProperty name)
                $Renamedst= @($RenamedDevices | select -ExpandProperty 'Display Name')

                $Message = "Rename '$($toRenamest[$d])' to '$($Renamedst[$d])'"
                Write-Host $Message -ForegroundColor blue

            }
            else {

                Write-Warning "Current Serial Number: $($csvobj[$d].'Serial Number'), on Possition: $d does not match Device on database. Skipping"

            }
            
        }
        
        if ($ToRenameDevices -eq $null) {
            write-host "There are no devices to rename." -ForegroundColor Green
            exit
        }

        # Ask for confirmation:

        $caption = "Choose Action";
        $message = "Rename the above Devices?"
        $continue = new-Object System.Management.Automation.Host.ChoiceDescription "&Continue","Continue renaming Devices";
        $stop = new-Object System.Management.Automation.Host.ChoiceDescription "&Stop","No Devices will be renamed";
        $choices = [System.Management.Automation.Host.ChoiceDescription[]]($continue,$stop);
        $answer = $host.ui.PromptForChoice($caption,$message,$choices,0)

        switch ($answer){
            0 {"Renaming Devices..."}
            1 {"No changes made"; exit}
        }

        # Renaming:
        foreach ($dev in $RenamedDevices) {
            
            try {

                Write-host "Renaming to $($dev.'Display Name')" -ForegroundColor Magenta
                $query = "mobiledevicecommands/command/DeviceName/$($dev.'Display Name')/id/$($dev.'id')"
                $Uri = "$JssAPIurl/JSSResource/$query"
                $Putr = Invoke-RestMethod -Uri $Uri -Credential $Credential -Method Put -ErrorAction SilentlyContinue -ErrorVariable RE
            }
            catch {
                Write-Warning "An error has occured while trying to rename $($rcmps.'Display Name') read following error message:"
                Write-Output -InputObject $RE
            }
            
        }

    }

}








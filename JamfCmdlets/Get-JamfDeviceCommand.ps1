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
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
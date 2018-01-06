
function Set-JamfMobileExtensionAttribute {
    [Cmdletbinding()]
    param(

        [Parameter(Mandatory=$true)]$JssAPIurl,

        [ValidateNotNull()]
        [System.Management.Automation.Credential()]
        [PScredential]
        $Credential,

        # Mobile device to change extension attribute
        [ValidateNotNull()][String[]]$DeviceName,

        # Provide Extension Attribure Name
        [ValidateNotNull()][string]$ExtensionAttribute,

        # Provide Value to be set
        [ValidateNotNull()][string]$Value,

        # Skip Confirmation
        [Parameter(Mandatory=$false)]
        [switch]$Force = $false
    
    )
    
    # Validate Extension Attribute Exists and get type
    
    $Uri = "$JssAPIurl/JSSResource/mobiledeviceextensionattributes/name/$ExtensionAttribute"
    Invoke-RestMethod -Uri $Uri -Method Get -Credential $Credential -ErrorAction Stop | Out-Null

    # Ask for confirmation if Force = False
    if ($Force -eq $false){

        Write-Host $DeviceName -ForegroundColor Blue
        
        $caption = "Choose Action";
        $message = "Are you sure you want to change '$ExtensionAttribute' value to '$value' on all above devices?"
        $continue = new-Object System.Management.Automation.Host.ChoiceDescription "&Continue","Provided value will be changed on all devices entered";
        $stop = new-Object System.Management.Automation.Host.ChoiceDescription "&Stop","No Extension Attribute value will be changed";
        $choices = [System.Management.Automation.Host.ChoiceDescription[]]($continue,$stop);
        $answer = $host.ui.PromptForChoice($caption,$message,$choices,0)

        switch ($answer){
            0 {"Changing Values..."}
            1 {"No changes made"; exit}
        }

    }

    # Update Jamf

    foreach ($Name in $DeviceName) {

        $Uri = "$JssAPIurl/JSSResource/mobiledevices/name/$Name"
        $body = '<?xml version="1.0" encoding="UTF-8"?><mobile_device><extension_attributes><extension_attribute><id>3</id><name>' + "$ExtensionAttribute" + '</name><type>Number</type><value>' + "$Value" + '</value></extension_attribute></extension_attributes></mobile_device>'
        Invoke-RestMethod -Uri $Uri -Method Put -Credential $Credential -Body $body -ContentType "text/xml" | Out-Null
        
    }
    
}


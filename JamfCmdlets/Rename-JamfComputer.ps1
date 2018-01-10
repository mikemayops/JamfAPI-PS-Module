
function Rename-JamfComputer {
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
        [pscredential]
        $Credential,

        # Provide current computername
        [Parameter(Mandatory=$false,
                   ParameterSetName='Direct Rename')]
        [AllowNull()][string]$Name,

        # Provide Serial Number
        [Parameter(Mandatory=$false,
                   ParameterSetName='Direct Rename')]
        [AllowNull()][string]$SerialNumber,

        # Provide JSS ID
        [Parameter(Mandatory=$false,
                   ParameterSetName='Direct Rename')]
        [AllowNull()][string]$Id,

        # Provide new name.
        [Parameter(Mandatory=$false,
                   ParameterSetName='Direct Rename',
                   HelpMessage='wait... what?')]
        [string]$RenameTo
    )
    
    begin {
        
        

    }
    
    process {

        if (condition) {
            
        }
        elseif (condition) {
            
        }
        elseif (condition) {
            
        }
        elseif (condition) {
            
        }
        
    }
    
    end {


    }
}

# test area:

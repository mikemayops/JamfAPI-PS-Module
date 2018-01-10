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
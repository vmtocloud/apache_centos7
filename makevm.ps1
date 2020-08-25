<#
    .NOTES
    ===========================================================================
	 Created by:   	Ryan Kelly
     Date:          August 24th, 2019
	 Organization: 	VMware
     Blog:          vmtocloud.com
     Twitter:       @vmtocloud
    ===========================================================================
    
	.DESCRIPTION
    This will allow you to create a VM from template in the correct locations on VMware Cloud on AWS.

    .Example
    $vCenter = "vcenter.sddc-52-53-75-20.vmc.vmware.com"
    $vCenterUser = "cloudadmin@vmc.local"
    $vCenterPassword = 'VMware1!'
    $ResourcePool = "Compute-ResourcePool"
    $Datastore = "WorkloadDatastore"
    $DestinationFolder = "Workloads"
    $Template = "Gold_Linux_Template"
    $VMNamePrefix = "NEWVM"
    $NumofVMs = 100
    $RunASync = $true #Set this to $True to create the VMs and not wait for the result before starting the next one
#>

# ------------- VARIABLES SECTION - EDIT THE VARIABLES BELOW ------------- 
$vCenter = "vcenter.sddc-34-194-236-229.vmwarevmc.com"
$vCenterUser = "cloudadmin@vmc.local"
$vCenterPassword = 'yourpasswordhere'
$ResourcePool = "Compute-ResourcePool"
$Datastore = "WorkloadDatastore"
$DestinationFolder = "RKELLY"
$Template = "CentOS7-RKelly"
$VMName = "rkellycentos"
# ------------- END VARIABLES - DO NOT EDIT BELOW THIS LINE ------------- 

# Connect to VMC vCenter Server
$VCConn = Connect-VIServer -Server $vCenter -User $vCenterUser -Password $vCenterPassword

New-VM -Name "$VMName" -Template $Template -ResourcePool $ResourcePool -Datastore $datastore -Location $DestinationFolder
Start-VM -VM "$VMName"

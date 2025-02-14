# Define vCenter server details
$vCenterServer = "your_vcenter_server"
$username = "your_username"
$password = "your_password"

# Connect to vCenter
Connect-VIServer -Server $vCenterServer -User $username -Password $password


$CSVFilePath = "C:\Users\pusindhu\OneDrive - Capgemini\Documents\Book1.csv"

# Import the CSV file
$vms = Import-Csv $CSVFilePath -Header 'VM Name'

 #Write-Host $vms
 $threshold = "80"
 $memory= "10"
 
#iterate through each row to output VM names
foreach ($vm in $vms) {
    $vmName = $vm.'VM Name'
    #Write-Host $vmName
     
    # Get the virtual machine
    $vmDetails = Get-VM -Name $vmName | Select-Object CpuUsageMhz, CpuTotalMhz, MemoryUsageGB, MemoryTotalGB
    if ($vmDetails){
        $cpuUsage = $vmDetails.CpuUsageMhz
        $cpuTotal = $vmDetails.CpuTotalMhz
        $MemoryUsage = $vmDetails.MemoryUsageGB
        $MemoryTotal =  $vmDetails.MemoryTotalGB

    
    }
    
    $cthresholdvalue = ($cpuUsage/$cpuTotal)*100

    if($cthresholdvalue -ge $threshold) {
    
        CpuIncrease($vm)
    
    }

}

    # Get the virtual machine
    #$memory = Get-VM -Name $vmName | Select-Object 

    $mthresholdvalue = ($memoryUsage/$memoryTotal)*100

    if($mthresholdvalue -ge $threshold){

    memoryincrease($vm)
}
  function CpuIncrease($VMName) {

        Stop-VM -VM $vm -Confirm
        # Update the virtual machine configuration with the new CPU count
        Set-VM -VM $vm -NumCpu $newCPUs

        Write-Host "Number of CPUs for '$vmName' increased to $newCPUs."
        Start-VM -VM $vm -Confirm -RunAsync

}


function memoryIncrease($VMName) {
    Stop-VM -VM $vm -Confirm
    # Update the virtual machine configuration with the new CPU count
    Set-VM -VM $vm -Memory $memory

    Write-Host "memory size for '$vmName' increased to $memory."
    Start-VM -VM $vm -Confirm -RunAsync

    }
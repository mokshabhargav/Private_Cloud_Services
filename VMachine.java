package cmpe283Project;
import com.vmware.vim25.*;
import com.vmware.vim25.mo.*;

/*
 * Class for creating Virtual Machine from Scratch 
 */
public class VMachine {
    public static boolean createVM(Folder vmFolder, VirtualMachineConfigSpec vmSpec, ResourcePool rp, HostSystem hs ) {
        try {
            Task task = vmFolder.createVM_Task(vmSpec, rp, hs);
            String result = task.waitForMe();
            if (result == Task.SUCCESS) {
                System.out.println("VM Created Successfully");

                //create cd/dvd drive from iso path
                VirtualMachine[] v1 =  (VirtualMachine[]) hs.getVms();
                int len = v1.length;

                //v1[len-1].powerOffVM_Task();

                MountISO miso = new MountISO();
                miso.setVirtualMachine(v1[len-1]);
                
                String isoPath = "[nfs4team02] __DEPLOY__/ESXI_HOST_FILES/iso-linux/ubuntu-10.04-desktop-i386.iso";
                
                if(v1[len-1].getName().contains("Ubu"))
                {
                	isoPath = "[nfs4team02] __DEPLOY__/ESXI_HOST_FILES/iso-linux/ubuntu-10.04-desktop-i386.iso";
                }
                
                else if(v1[len-1].getName().contains("Win"))
                {
                	isoPath = "[nfs4team02] __DEPLOY__/ESXI_HOST_FILES/iso-win/Windows_Server_2008_R2_SP1_WG_Apr-5-2012/7601.17514.101119-1850_x64fre_server_eval_en-us-GRMSXEVAL_EN_DVD.iso";
                }
                               
                miso.addCdDriveFromIso(isoPath, true);
                
                
                //miso.addCdDriveFromIso("[nfs4team02] __DEPLOY__/ESXI_HOST_FILES/iso-linux/ubuntu-10.04-desktop-i386.iso", true);

                v1[len-1].powerOnVM_Task(hs);

                //Thread.sleep(100000);

			    /*VirtualMachinePowerState vmPowerState = v1[len-1].getRuntime().getPowerState();
			    if(vmPowerState == VirtualMachinePowerState.poweredOn) {
                    v1[len-1].mountToolsInstaller();
                    if(v1[len-1].getGuest().toolsVersionStatus == "guestToolsCurrent") {
			    	    System.out.println("VM Tools are installed and upto date");
			    	    v1[len-1].powerOnVM_Task(hs);
                    }
                    if(v1[len-1].getGuest().toolsVersionStatus == "guestToolsNeedUpgrade") {
			    	    System.out.println("VM Tools are installed and needs to update");
			    	    v1[len-1].powerOnVM_Task(hs);
                    }
                    if(v1[len-1].getGuest().toolsVersionStatus == "guestToolsUnmanaged") {
			    	    System.out.println("VM Tools are installed but not managed by VMWare");
                    }
			    }
			    else {
			    	System.out.println("VM is poweredOff. Cannot install VMTools ");
			    } */
                
                return true;
            } else {
                System.out.println("VM could not be created. ");
                return false;
            }
        } catch (Exception e) {
            System.out.println("Error in Creating VM : " + e.getMessage());
            return false;
        }
    }

    static VirtualDeviceConfigSpec createScsiSpec(int cKey) {
        VirtualDeviceConfigSpec scsiSpec = new VirtualDeviceConfigSpec();
        scsiSpec.setOperation(VirtualDeviceConfigSpecOperation.add);
        VirtualLsiLogicController scsiCtrl = new VirtualLsiLogicController();
        scsiCtrl.setKey(cKey);
        scsiCtrl.setBusNumber(0);
        scsiCtrl.setSharedBus(VirtualSCSISharing.noSharing);
        scsiSpec.setDevice(scsiCtrl);
        return scsiSpec;
    }

    static VirtualDeviceConfigSpec createDiskSpec(String dsName, int cKey,
                                                  long diskSizeKB, String diskMode) {
        VirtualDeviceConfigSpec diskSpec = new VirtualDeviceConfigSpec();
        diskSpec.setOperation(VirtualDeviceConfigSpecOperation.add);
        diskSpec.setFileOperation(VirtualDeviceConfigSpecFileOperation.create);

        VirtualDisk vd = new VirtualDisk();
        vd.setCapacityInKB(diskSizeKB);
        diskSpec.setDevice(vd);
        vd.setKey(0);
        vd.setUnitNumber(0);
        vd.setControllerKey(cKey);

        VirtualDiskFlatVer2BackingInfo diskfileBacking = new VirtualDiskFlatVer2BackingInfo();
        String fileName = "[" + dsName + "]";
        diskfileBacking.setFileName(fileName);
        diskfileBacking.setDiskMode(diskMode);
        diskfileBacking.setThinProvisioned(true);
        vd.setBacking(diskfileBacking);
        return diskSpec;
    }

    static VirtualDeviceConfigSpec createNicSpec(String netName, String nicName)
            throws Exception {
        VirtualDeviceConfigSpec nicSpec = new VirtualDeviceConfigSpec();
        nicSpec.setOperation(VirtualDeviceConfigSpecOperation.add);

        VirtualEthernetCard nic = new VirtualPCNet32();
        VirtualEthernetCardNetworkBackingInfo nicBacking = new VirtualEthernetCardNetworkBackingInfo();
        nicBacking.setDeviceName(netName);

        Description info = new Description();
        info.setLabel(nicName);
        info.setSummary(netName);
        nic.setDeviceInfo(info);

        nic.setAddressType("generated");
        nic.setBacking(nicBacking);
        nic.setKey(0);

        nicSpec.setDevice(nic);
        return nicSpec;
    }
}

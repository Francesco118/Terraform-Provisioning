# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "Francesco3-vm" { #VM name
    #Force Create a new machine
    force_create = true # not working yet

    # VM General Settings
    target_node = "22512-R720"
    vmid = "709"
    name = "TF-openvas3"
    desc = "Openvas kali"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "TMP-openvas-kali"

    # VM System Settings
    agent = 0
    
    # VM CPU Settings
    cores = 2
    sockets = 2
    cpu = "x86-64-v2-AES"
    
    # VM Memory Settings
    memory = 8192

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Disk Settings
    disks {
        scsi {
            scsi0 {
                disk {
                    size = "100"
                    storage = "TechLabVMs"
                }
            }
        }
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
    
    # (Optional) Default User
    # ciuser = "your-username"
    
    # (Optional) Add your SSH KEY
    # sshkeys = <<EOF
    # #YOUR-PUBLIC-SSH-KEY
    # EOF
}
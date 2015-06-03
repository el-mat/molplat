
[Tuturials] (https://github.com/PacificBiosciences/Bioinformatics-Training/wiki)

## Instructions to do the SMRT Analysis in a virtualbox can be found:
[link] (https://github.com/PacificBiosciences/Bioinformatics-Training/wiki/SMRT-Analysis-Virtual-Machine-Install)

You will need to install Virtualbox and vagrant (not the one build-in ubuntu one)

Create a new folder called SMRT

In that folder:

```wget https://gist.githubusercontent.com/mjhsieh/701716a527a7966d26ad/raw/92bed57ca054323d0be525eaedbd0749082b8404/Vagrantfile```

Edit the Vagrantfile to share the data folder with the host machine: 

add `"config.vm.synced_folder "/data/PacBio_data", "/vagrant/vagrant_data"` in the do |config| part of the file. It will create a folder called vagrant_data in the VM containing the data from /data/PacBio_data. 

If you want to update your VM without having to do `vagrant up`, you can do `vagrant reload`. 

###To launch SMRT virtualbox (this might take a long time to launch!)

`cd /data/tools/SMRT`

`vagrant up` if it is the first time 
`vagrant reload` if you made changes to the Vagrantfile

`vagrant box list`

`vagrant ssh` to go into the VM, the prompt should change to: ```vagrant@vagrant-ubuntu-trusty-64:~$```

`exit` to go back to the host machine 

###To launch SMRT portal 

In the internet browser: `http://localhost:8080`

user: administrator

password: PacBio#1 

[video tuturial] (http://www.pacificbiosciences.com/Tutorials/Bacterial_Assembly_Epigenetic_Analysis_HGAP/story.html)

###Run HGAP on lambda to establish a baseline.

Run RS_HGAP_Assembly using the SMRT Cell in $SEYMOUR_HOME/common/test/primary/lambda, and the pre-packaged lambda reference in $SEYMOUR_HOME/common/userdata/references/lambda. 

Make sure you set the Estimated Genome size to 40,000 bp and Minimum Seed Read Length to 3500 bp. 

Set these parameters by clicking the box with three dots "..." next to the protocol drop-down menu:

            p_preassembler.minLongReadLength = 3500
            p_celeraassembler.genomeSize = 40000  

If the lambda job also fails, then there is a problem with the software configuration that must be investigated. 

For more troubleshooting: 
[RS HGAP Assembly protocol fails in SMRT Portal] (https://github.com/PacificBiosciences/SMRT-Analysis/wiki/RS-HGAP-Assembly-protocol-fails-in-SMRT-Portal)

###Results

Contig sequences can be found in the following file:

/home/vagrant/userdata/jobs/016/16439/reference/sequence/reference.fasta

To export from the VM to the host:

cat /home/vagrant/userdata/jobs/016/016439/reference/sequence/reference.fasta > /vagrant/vagrant_data/B07_reference.fasta

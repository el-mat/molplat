
[https://github.com/PacificBiosciences/Bioinformatics-Training/wiki]

## Instructions to do the SMRT Analysis in a virtualbox can be found:
[https://github.com/PacificBiosciences/Bioinformatics-Training/wiki/SMRT-Analysis-Virtual-Machine-Install]

You will need to install Virtualbox and vagrant (not the one build-in ubuntu)

Create a new folder called SMRT

In that folder:
     ```
wget https://gist.githubusercontent.com/mjhsieh/701716a527a7966d26ad/raw/92bed57ca054323d0be525eaedbd0749082b8404/Vagrantfile
     ```

###To launch SMRT virtualbox (this might take a long time to launch!)

`cd /data/tools/SMRT`

`vagrant up` if it is the first time 
`vagrant provision` if you made changes to the Vagrantfile

`vagrant box list`

`vagrant ssh` to go into the VM, the prompt should change to: ```vagrant@vagrant-ubuntu-trusty-64:~$```

`exit` to go back to the host machine 

###To launch SMRT portal 

In the internet browser: `http://localhost:8080`

user: administrator

password: PacBio#1 

video tuturial [http://www.pacificbiosciences.com/Tutorials/Bacterial_Assembly_Epigenetic_Analysis_HGAP/story.html]



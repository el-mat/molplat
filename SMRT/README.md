
[https://github.com/PacificBiosciences/Bioinformatics-Training/wiki]

## Instructions to do the SMRT Analysis in a virtualbox can be found:
[https://github.com/PacificBiosciences/Bioinformatics-Training/wiki/SMRT-Analysis-Virtual-Machine-Install]

You will need to install Virtualbox and vagrant (not the one build-in ubuntu)

### to launch SMRT virtual box (this might take a long time to launch!)
cd /data/tools/SMRT
'vagrant up' 
vagrant provision 
vagrant box list
vagrant ssh # vagrant@vagrant-ubuntu-trusty-64:~$ 

# Paste " http://localhost:8080 " in an internet browser

administrator
PacBio#1 

Design job
Create new
De Novo assembly
Select Protocols -> HGAP
... -> Assembly (adapt genome size)


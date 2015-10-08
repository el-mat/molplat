---
title: "Fastq.rmd"
author: "elmat"
date: "Tuesday, May 19, 2015"
output: html_document
---

##FastQC


To evaluate the quality of the sequences in the .fastq files:

- launch in Linux through run programs
- launch in Windows run_fastqc.bat (Downloads folder)

##Mira-assembler

Installation:

```apt-get install mira-assembler``` or something else

###Mira assembly

- create two folders (data and assemblies)
- assemblies folder: [manifest.conf] (https://github.com/el-mat/molplat/blob/master/mira/manifest.conf)
- assemblies folder:

```mira manifest.conf >& log_assembly.txt```

When the program has stopped, check the log.txt for errors and launch again after changing parameters in the manifest.conf file

##Read and write fastq files

in R:
```
source("http://bioconductor.org/biocLite.R")
biocLite("ShortRead")
library(ShortRead)
```

Create an example.fastq file in notepad

```
example <- readFastq("C:/Users/elmat/Desktop/example.fastq")
writeFastq(example, "C:/Users/elmat/Desktop/example1.fastq", compress=FALSE)
```


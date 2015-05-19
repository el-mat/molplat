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

```sudo frvan```

password

```sudo su```

password

```sudo frvan```

```apt-get install mira-assembler``` or something else

```su user3```

###Mira assembly

- create two folders (data and assemblies)
- assemblies folder: manifest.conf (see examples of content in file)
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


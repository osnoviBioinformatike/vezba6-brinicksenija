#!/bin/bash

#1.Kreiranje foldera
mkdir -p klebsiella_genome
cd klebsiella_genome

#2. Preuzimanje fajlova
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/021/057/265/GCF_02157265.1_ASM2105726v1/GCF_021057265.1_ASM2105726v1_genomic.fna.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/021/057/265/GCF_02157265.1_ASM2105726v1/GCF_021057265.1_ASM2105726v1_genomic.gff.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/021/057/265/GCF_02157265.1_ASM2105726v1/md5checksum.txt
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/021/057/265/GCF_02157265.1_ASM2105726v1/uncompressed_checksum.txt

#3. Raspakivanje 
gunzip -c GFC_021057265.1_ASM2105726v1_genomic.fna.gz > GFC_021057265.1_ASM2105726v1_genomic.fna
gunzip -c GFC_021057265.1_ASM2105726v1_genomic.gff.gz > GFC_021057265.1_ASM2105726v1_genomic.gff

#4. Struktura
mkdir genomes annotations
mv GCF_021057265.1_ASM2105726v1_genomic.fna genomes/
mv GCF_021057265.1_ASM2105726v1_genomic.gff annotations/

#5. Arhiva 
cd..
tar -cvzf klebsiella_archive.tar.gz klebsiella_genome
 

# komande.md

*Ve�ba 6*

## >>> README.md

### 1.5 - 1.9 - uneti komande

```bash
#5.Raspakujte komprimovanu datoteku.
tar -xvzf za_vezbe_Klebsiella_sekvence.tar.gz

#6.Premestite se u folder sa .fna (genomske sekvence u FASTA formatu 
#za različite sojeve) i .gff datotekama (fajlovi sa anotacijama za 
#svaki soj).
cd za_vezbe_Klebsiella_sekvence

#7.Odatle, jednom komandom napravite folder data u korenu repozitorijuma 
#(vezba-6-PeraPeric), sa pod-folderima genomes i annotations, u koje ćete 
#u sledećim koracima premestiti fajlove i dobiti strukturu direktorijuma
#šematski prikazanu ispod. Dakle, folder data treba da bude folder Git 
#repozitorijuma vezba-6-PeraPeric, i treba da sadrži 2 foldera - genomes 
#i annotations. Prilikom kreiranja foldera iskoristite opciju -p da zadate 
#da se odjednom kreiraju navedeni folderi višeg i nižeg nivoa.
mkdir -p ../data/genomes ../data/annotations

#8.Premestite sve .fna fajlove u folder genomes, a .gff fajlove u folder
#annotations.
mv *.fna ../data/genomes/
mv *.gff ../data/annotations/

#9.Vratite se u koren repozitorijuma vežbe (vezba-6-PeraPeric), 
#pa kreirajte direktorijum results za čuvanje izlaznih fajlova alata 
#Kleborate (dakle, results treba da bude folder Git repozitorijuma 
#vezba-6-PeraPeric, kao što je i folder data).

cd ..
mkdir -p results


kleborate \
    -a data/genomes/*.fna \
    -o results \
    -p kpsc \
head -n l klebsiella_pneumo_complex_output.txt | tr '\t' '\n' | nl -ba | head
```

---

## >>> klebsiella_demonstracija_prosirena.md

### 4.1 - uneti *output* komandi, a ne komande

```bash
# Upi�ite brojeve kolona koje izdvajate:
1 strain
71 virulence_score
52 iucA
60 iroB
67 rmpA
73 rmpA2

# Prika�ite izdvojene kolone za Strain, Virulence score, iucA, iroB, rmpA i rmpA2:
strain         iucA  iroB  rmpA     virulence_score  rmpA2
GCF_017743115  1     1     2        4                rmpA2_5-54%
GCF_017743135  9     6     11       4                -
GCF_017815715  1     1     2        3                rmpA2_5-54%
GCF_021057265  1     -     27       4                rmpA2_6*-47%
GCF_021442005  1     -     40*-47%  4                rmpA2_3-47%
GCF_902723695  1     1     2        4                rmpA2_2*-54%
GCF_902723705  1     1     2        4                rmpA2_4*-34%
GCF_902827215  2     4     82-19%   5                -

### 4.4 - uneti *output* komandi, a ne komande
```

```bash
# Upi�ite brojeve kolona koje izdvajate:
71 virulnce_score
98 resistance_score
1 strain

# Prika�ite izdvojene kolone za Strain, Virulence score i Resistance score
strain         virulence_score  resistance_score
GCF_017743115  4                0
GCF_017743135  4                0
GCF_017815715  3                0
GCF_021057265  4                1
GCF_021442005  4                2
GCF_902723695  4                2
GCF_902723705  4                1
GCF_902827215  5                0

# Odaberite 1 soj koji je samo hipervirulentan (+ ima rmpA2):
GCF_017743115

# Upi�ite informaciju o njegovoj virulentnosti/rezistentnosti sa NCBI/Genome:
Description
    hypervirulent Klebsiella pneumoniae

# Odaberite 1 soj koji je hipervirulentan i multirezistentan (+ ima iroB):
GCF_902723695 

# Upi�ite informaciju o njegovoj virulentnosti/rezistentnosti sa NCBI/Genome:
Carbapenem resistant and hypervirulent Klebsiella pneumoniae kpn154


```

### 5.3 - uneti komande

```bash
cd data/annotations

for file in *.gff; do
echo "=== $file ==="
grep -Ei "peg-344|iroB|iucA|rmpA|rmpA2" "$file" || echo " (nijedan marker nije pronadjen)"
echo
done
```

### 2 - uneti komande

```bash
mkdir klebsiella_genome

cd klebsiella_genome

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/021/057/265/GCF_021057265.1_ASM2105726v1/GCF_021057265.1_ASM2105726v1_genomic.fna.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/021/057/265/GCF_021057265.1_ASM2105726v1/GCF_021057265.1_ASM2105726v1_genomic.gff.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/021/057/265/GCF_021057265.1_ASM2105726v1/md5checksums.txt

gunzip -k GCF_021057265.1_ASM2105726v1_genomic.fna.gz
gunzip -k GCF_021057265.1_ASM2105726v1_genomic.gff.gz

grep "GCF_021057265.1_ASM2105726v1_genomic.fna.gz" md5checksums.txt > genome_compressed.txt

cat genome_compressed.txt

md5sum -c genome_compressed.txt
```

### 3 - uneti komande

```bash
cd klebsiella_genome

mkdir genomes annotations

mv GCF_021057265.1_ASM2105726v1_genomic.fna.gz genomes/
mv GCF_021057265.1_ASM2105726v1_genomic.gff.gz annotations/

cd ..

tar -czvf klebsiella_archive.tar.gz klebsiella_genome
tar -tzvf klebsiella_archive.tar.gz
```

### 4 - uneti komande i sadrzaj klebsiella_download_archive.sh fajla

```bash
mkdir scripts
touch scripts/klebsiella_download_archive.sh
cd scripts

#Sadrzaj klebsiella_download_archive.sh
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

#Izvrsavanje skripte:
./klebsiella_download_archive.sh
```

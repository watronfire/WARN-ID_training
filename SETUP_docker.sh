#!/bin/bash
apt-get update && apt-get install -y --no-install-recommends \
  wget \
  curl \
  ca-certificates \
  git \
  openjdk-11-jre \
  r-base-core \
  libminizip1 \
  libxcb-xinerama0 \
  procps && \
  apt-get autoclean

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh && \
  sh get-docker.sh

# install conda
curl -fsSL https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -o anaconda.sh && \
  sh anaconda.sh

# install WDL engine
conda install -c conda-forge miniwdl

# Test  WDL engine NOTE: need to restart aftering changing docker permissions.
# miniwdl run_self_test

# Download viral-ngs repo
# TODO Move viral-pipelines to correct directory or add to path.
wget -nv -O - https://github.com/broadinstitute/viral-pipelines/archive/refs/tags/v2.1.33.9.tar.gz | tar zx && \
  mv viral-pipelines-*/pipes/WDL/workflows/* pipeline/

# Install the remaining programs into software.
cd software/

# Download RStudio
RSTUDIO_VER="2022.02.1-461"
curl -fsSL https://download1.rstudio.org/desktop/bionic/amd64/rstudio-${RSTUDIO_VER}-amd64.deb -o rstudio.deb && \
  dpkg -i rstudio.deb

# Teamviewer
curl -fsSL https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -o teamviewer.deb && \
  dpkg -i teamviewer.deb

# UGENE TODO: Add to path
UGENE_VER="42.0"
wget https://github.com/ugeneunipro/ugene/releases/download/42.0/ugene-${UGENE_VER}-linux-x86-64.tar.gz && \
  tar -xzvf ugene-${UGENE_VER}-linux-x86-64.tar.gz && \
  rm -v ugene-${UGENE_VER}-linux-x86-64.tar.gz

# Nextflow TODO: Add to path
curl -s https://get.nextflow.io | bash

# Mafft
MAFFT_VER="7.450"
wget https://mafft.cbrc.jp/alignment/software/mafft_${MAFFT_VER}-1_amd64.deb && \
  dpkg -i mafft_${MAFFT_VER}-1_amd64.deb && \
  rm mafft_${MAFFT_VER}-1_amd64.deb

# IQ-TREE TODO: Add to path
IQTREE_VER="2.2.0"
wget https://github.com/iqtree/iqtree2/releases/download/v${IQTREE_VER}/iqtree-${IQTREE_VER}-Linux.tar.gz && \
  tar -xzvf iqtree-${IQTREE_VER}-Linux.tar.gz && \
  rm -v iqtree-${IQTREE_VER}-Linux.tar.gz

# samtools
SAMTOOLS_VER="1.15"
wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VER}/samtools-${SAMTOOLS_VER}.tar.bz2 && \
  tar -xjf samtools-${SAMTOOLS_VER}.tar.bz2 && \
  rm samtools-${SAMTOOLS_VER}.tar.bz2 && \
  cd samtools-${SAMTOOLS_VER} && \
  ./configure && \
  make && \
  make install && \
  cd ..

# snp-sites
apt-get install -y snp-sites && \
  apt-get auto-clean

# Figtree
FIGTREE_VER="1.4.4"
wget https://github.com/rambaut/figtree/releases/download/v${FIGTREE_VER}/FigTree_v${FIGTREE_VER}.tgz && \
  tar -xzvf FigTree_v${FIGTREE_VER}.tgz && \
  rm -v FigTree_v${FIGTREE_VER}.tgz

# IGV
IGV_VER="2.12"
wget https://data.broadinstitute.org/igv/projects/downloads/${IGV_VER}/IGV_${IGV_VER}.3.zip && \
  unzip IGV_${IGV_VER}.3.zip


# AliView
ALIVIEW_VER="1.28"
wget https://ormbunkar.se/aliview/downloads/linux/linux-version-${ALIVIEW_VER}/aliview.install.run && \
  chmod +x aliview.install.run && \
  sudo ./aliview.install.run

# Cleanup
rm get-docker.sh anaconda.sh
rm aliview.install.run
rm -r viral-pipelines-*

# TODO Move desktop files to appropriate locations

# Remove conda base name
cd ~/anaconda3/etc/ && \
  mkdir conda && \
  cd conda/ && \
  mkdir activate.d && \
  cd activate.d && \
  mv ~/sequencing/remove_base_ps1.sh .
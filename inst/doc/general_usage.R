## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse=TRUE,comment='#>')

## ----eval=FALSE----------------------------------------------------------
#  library(theseus)
#  library(phyloseq)
#  library(ggplot2)
#  
#  data('WWTP_Impact')

## ----eval=FALSE----------------------------------------------------------
#  fns <- sort(list.files(file.path(system.file(package='theseus'), 'testdata'), full.names=TRUE))
#  f_path <- fns[grepl('R1.fastq.gz', fns)]
#  r_path <- fns[grepl('R2.fastq.gz', fns)]
#  p.qc <- qualcontour(f_path, r_path, n_samples=2, verbose=TRUE, percentile=.25, nc=1)
#  
#  p.qc + geom_hline(yintercept=175) + geom_vline(xintercept=275)

## ----eval=FALSE----------------------------------------------------------
#  p.prev <- prev(WWTP_Impact, taxon="Phylum", n_taxa=10)
#  p.prev

## ----eval=FALSE----------------------------------------------------------
#  dim(otu_table(WWTP_Impact))
#  taxa_are_rows(WWTP_Impact)
#  otu <- pstoveg_otu(WWTP_Impact)
#  dim(otu)
#  
#  data(GlobalPatterns, package='phyloseq')
#  dim(otu_table(GlobalPatterns))
#  taxa_are_rows(GlobalPatterns)
#  otu.gp <-pstoveg_otu(GlobalPatterns)
#  dim(otu.gp)

## ----eval=FALSE----------------------------------------------------------
#  dim(sample_data(WWTP_Impact))
#  sampdat <- pstoveg_sd(WWTP_Impact)
#  dim(sampdat)
#  
#  data(GlobalPatterns, package='phyloseq')
#  dim(sample_data(GlobalPatterns))
#  sampdat.gp <-pstoveg_sd(GlobalPatterns)
#  dim(sampdat.gp)

## ----eval=FALSE----------------------------------------------------------
#  wwtp <- WWTP_Impact
#  otu.ra <- vegan::decostand(otu, method='total')
#  otu_table(wwtp) <- otu_table(otu.ra, taxa_are_rows = taxa_are_rows(WWTP_Impact))

## ----eval=FALSE----------------------------------------------------------
#  sampdat.altered <- sampdat
#  sampdat.altered$TotDisP_PercentMax <- vegan::decostand(sampdat$TotDisP, method='max')
#  sample_data(wwtp) <- as.data.frame(sampdat.altered)

## ----eval=FALSE----------------------------------------------------------
#  cv <- c('log_NO3N', 'log_PO4')
#  envtoverlay(WWTP_Impact, covariates=cv)

## ----eval=FALSE----------------------------------------------------------
#  constord(PS=WWTP_Impact, formula=~ log_NO3N + log_PO4, method='RDA', facets=Position~Location, scaling=2)

## ----eval=FALSE----------------------------------------------------------
#  data('sigtab')
#  data('sigtab.2vs3')
#  cohort_relabund(
#    PS=prune_samples(sample_data(WWTP_Impact)$site %in% c(1,2,3,4),WWTP_Impact),
#    comp1=sigtab,
#    comp2=sigtab.2vs3,
#    comp1lab=c('Decreased at Effluent',
#               'No change at Effluent',
#               'Increased at effluent'),
#    comp2lab=c('Decreased btwn plants',
#               'No change btwn plants',
#               'Increased btwn plants')) +
#    theme(axis.text.y = element_text(angle=90, vjust=0, hjust=0.5)) +
#    theme(legend.text=element_text(size=5))


# Commands run in Almazan et al

### Download SRA files:
 
`mkdir 00-DATA`
 
`cd 00-DATA`
 
`fastq-dump --skip-technical --defline-seq '@$sn[_$rn]/$ri' --readids --dumpbase --split-files --split-spot --clip SRR3479053`
 
`fastq-dump --skip-technical --defline-seq '@$sn[_$rn]/$ri' --readids --dumpbase --split-files --split-spot --clip SRR3479052`
 
`fastq-dump --skip-technical --defline-seq '@$sn[_$rn]/$ri' --readids --dumpbase --split-files --split-spot --clip SRR3479051`
 
`fastq-dump --skip-technical --defline-seq '@$sn[_$rn]/$ri' --readids --dumpbase --split-files --split-spot --clip SRR3479050`
 
`fastq-dump --skip-technical --defline-seq '@$sn[_$rn]/$ri' --readids --dumpbase --split-files --split-spot --clip SRR3479049`
 
`fastq-dump --skip-technical --defline-seq '@$sn[_$rn]/$ri' --readids --dumpbase --split-files --split-spot --clip SRR3479048`
 
#### NOTE:
> SRR3479048_1.fastq - clonal auricles
> SRR3479049_1.fastq - non-clonal auricles
> SRR3479050_1.fastq - non-clonal auricles
> SRR3479051_1.fastq - non-clonal bodies (no auricles)
> SRR3479052_1.fastq - clonal intact
> SRR3479053_1.fastq - non-clonal intact
 
### Concatenate clonal sequences:
 
`gzip -dc SRR3479048_1.fastq.gz SRR3479052_1.fastq.gz > clonal_48_52_1`
 
`gzip -dc SRR3479048_2.fastq.gz SRR3479052_2.fastq.gz > clonal_48_52_2`
 
`cd ..`
 
### Trinity: (version 2.12.0)
 
`mkdir 01-TRINITY`
 
`cd 01-TRINITY`

`/usr/local/trinityrnaseq-v2.12.0/Trinity --seqType fq --max_memory 750G --CPU 45 --trimmomatic --left ../00-DATA/clonal_48_52_1.fq.gz --right ../00-DATA/clonal_48_52_2.fq.gz --full_cleanup --include_supertranscripts --output Gdor_all.trinity`
 
`cd ..`
 
### alien index: (version 3.00) 
 
`mkdir 01-DB`
 
`cd 01-DB`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/schmidtea_mediterranea/PRJNA12585/schmidtea_mediterranea.PRJNA12585.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/schmidtea_mediterranea/PRJNA379262/schmidtea_mediterranea.PRJNA379262.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/clonorchis_sinensis/PRJDA72781/clonorchis_sinensis.PRJDA72781.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/clonorchis_sinensis/PRJDA72781/clonorchis_sinensis.PRJDA72781.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/dibothriocephalus_latus/PRJEB1206/dibothriocephalus_latus.PRJEB1206.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/echinococcus_canadensis/PRJEB8992/echinococcus_canadensis.PRJEB8992.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/echinostoma_caproni/PRJEB1207/echinostoma_caproni.PRJEB1207.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/fasciola_gigantica/PRJNA230515/fasciola_gigantica.PRJNA230515.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/gyrodactylus_salaris/PRJNA244375/gyrodactylus_salaris.PRJNA244375.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/hydatigera_taeniaeformis/PRJEB534/hydatigera_taeniaeformis.PRJEB534.WBPS15.protein.fa.gz`

`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/hymenolepis_diminuta/PRJEB30942/hymenolepis_diminuta.PRJEB30942.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/macrostomum_lignano/PRJNA284736/macrostomum_lignano.PRJNA284736.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/macrostomum_lignano/PRJNA371498/macrostomum_lignano.PRJNA371498.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/mesocestoides_corti/PRJEB510/mesocestoides_corti.PRJEB510.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/opisthorchis_felineus/PRJNA413383/opisthorchis_felineus.PRJNA413383.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/paragonimus_westermani/PRJNA454344/paragonimus_westermani.PRJNA454344.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/protopolystoma_xenopodis/PRJEB1201/protopolystoma_xenopodis.PRJEB1201.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/schistocephalus_solidus/PRJEB527/schistocephalus_solidus.PRJEB527.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/schistosoma_bovis/PRJNA451066/schistosoma_bovis.PRJNA451066.WBPS15.protein.fa.gz`
 
`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/spirometra_erinaceieuropaei/PRJEB1202/spirometra_erinaceieuropaei.PRJEB1202.WBPS15.protein.fa.gz`

`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/taenia_asiatica/PRJEB532/taenia_asiatica.PRJEB532.WBPS15.protein.fa.gz`

`wget ftp://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS15/species/trichobilharzia_regenti/PRJEB4662/trichobilharzia_regenti.PRJEB4662.WBPS15.protein.fa.gz`

`wget http://ryanlab.whitney.ufl.edu/downloads/alien_index/meta.fa.gz`

`wget http://ryanlab.whitney.ufl.edu/downloads/alien_index/non_meta.fa.gz`

`wget 'https://github.com/josephryan/reduce_refseq/raw/master/HumRef2015.fa.gz'`

`gzip -dc meta.fa.gz non_meta.fa.gz HumRef2015.fa.gz > db.fa`

`perl -pi -e 's/^>/>ALIEN_/' db.fa`

`gzip -dc *.protein.fa.gz >> db.fa`

`diamond makedb --in db.fa -d alien_index_db`

`cd ..`

`diamond blastx --masking 0 -d 01-DB/alien_index_db.dmnd -q ../01-TRINITY/Gdor_all.trinity.Trinity.SuperTrans.fasta -o Gdor_all.trinity.Trinity.SuperTrans.fasta_v_alien_index_db.blastx`

`alien_index --blast=Gdor_all.trinity.Trinity.SuperTrans.fasta_v_alien_index_db.blastx --alien_pattern=ALIEN_ > ai.out 2> ai.err`

### Gdor Transdecoder: (version 3.0.1)

`mkdir 04-TRANSDECODER`

`cd 04-TRANSDECODER`

`TransDecoder.LongOrfs -t ../01-TRINITY/Gdor_all.trinity.Trinity.SuperTrans.fasta -m 50 > td.lo.out 2> td.lo.err &`

`blastp -query Gdor_all.trinity.Trinity.SuperTrans.fasta.transdecoder_dir/longest_orfs.pep -db /bwdata1/mdebiasse/04-CNIDO/06-TRANSDECODER/01-SYMBIODINIUM/swissprot -max_target_seqs 1 -outfmt 6 -evalue 1e-5 -num_threads 40 > Gdor_blastp.out 2> Gdor_blastp.err`

`hmmscan --cpu 40 --domtblout Gdor.domtblout /bwdata1/mdebiasse/01-DEEPC/02-TRANSDECODER/Pfam-A.hmm Gdor_all.trinity.Trinity.SuperTrans.fasta.transdecoder_dir/longest_orfs.pep > hmmscan.out 2> hmmscan.err`

`/usr/local/TransDecoder-3.0.1/TransDecoder.Predict -t ../01-TRINITY/Gdor_all.trinity.Trinity.SuperTrans.fasta --retain_pfam_hits Gdor.domtblout --retain_blastp_hits Gdor_blastp.out`

`cd ..`

### Smed Transdecoder: (version 3.0.1)

`mkdir 05-SMED_TRANSDECODER`

`cd 05-SMED_TRANSDECODER`

`wget https://planmine.mpibpc.mpg.de/planmine/model/bulkdata/dd_Smed_v6.pcf.contigs.fasta.zip`

`unzip dd_Smed_v6.pcf.contigs.fasta.zip`

`/usr/local/TransDecoder-3.0.1/TransDecoder.LongOrfs -t dd_Smed_v6.pcf.contigs.fasta -m 50 > td.lo.out 2> td.lo.err`

`blastp -query dd_Smed_v6.pcf.contigs.fasta.transdecoder_dir/longest_orfs.pep -db /bwdata1/mdebiasse/04-CNIDO/06-TRANSDECODER/01-SYMBIODINIUM/swissprot -max_target_seqs 1 -outfmt 6 -evalue 1e-5 -num_threads 45 > dd_Smed_blastp.out 2> dd_Smed_blastp.err`

`hmmscan --cpu 200 --domtblout dd_Smed.domtblout /bwdata1/mdebiasse/01-DEEPC/02-TRANSDECODER/Pfam-A.hmm dd_Smed_v6.pcf.contigs.fasta.transdecoder_dir/longest_orfs.pep > hmmscan.out 2> hmmscan.err`

`/usr/local/TransDecoder-3.0.1/TransDecoder.Predict -t dd_Smed_v6.pcf.contigs.fasta --retain_pfam_hits dd_Smed.domtblout --retain_blastp_hits dd_Smed_blastp.out > td.p.stdout 2> td.p.err`

`cd ..`

### Orthofinder:

`mkdir -p 07-ORTHOFINDER_AA/01-INPUT_DATA`
 
`cd 07-ORTHOFINDER_AA/01-INPUT_DATA/`
 
`ln -s ../../04-TRANSDECODER/Gdor_all.trinity.Trinity.SuperTrans.fasta.transdecoder.pep .`
 
`ln -s ../../05-SMED_TRANSDECODER/dd_Smed_v6.pcf.contigs.fasta.transdecoder.pep .`
 
`orthofinder -oa -f 01-INPUT_DATA/ -M msa`
 
### Monte Carlo analysis: (see 01-MONTE_CARLO directory of this repo)

`perl mcmc_single_copy.pl`



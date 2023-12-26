//
// Check input samplesheet and get read channels
//

include { MINIMAP2_INDEX } from '../../modules/nf-core/minimap2/index/main'
include { MINIMAP2_ALIGN } from '../../modules/nf-core/minimap2/align/main'
include { SAMTOOLS_INDEX } from '../../modules/nf-core/samtools/index/main'

workflow ALIGN_MINIMAP2 {
    take:
    ch_fastq //[meta, fastq]
    ch_fasta //[meta2, fasta]

    main:
    MINIMAP2_INDEX ( ch_fasta )
    ch_fasta_index = MINIMAP2_INDEX.out.index

    bam_format = true
    cigar_paf_format = false
    cigar_bam = false
    MINIMAP2_ALIGN ( ch_fastq, ch_fasta, bam_format, cigar_paf_format, cigar_bam )
    ch_bam = MINIMAP2_ALIGN.out.bam
    
    SAMTOOLS_INDEX ( ch_bam )
    ch_bai = SAMTOOLS_INDEX.out.bai

    ch_bam
        .join( ch_bai, by: 0 )
        .set { ch_bam_bai }

    emit:
    ch_bam_bai    
}

// Function to get list of [ meta, [ fastq_1, fastq_2 ] ]
def create_fastq_channel(LinkedHashMap row) {
    // create meta map
    def meta = [:]
    meta.id         = row.sample
    meta.single_end = row.single_end.toBoolean()

    // add path(s) of the fastq file(s) to the meta map
    def fastq_meta = []
    if (!file(row.fastq_1).exists()) {
        exit 1, "ERROR: Please check input samplesheet -> Read 1 FastQ file does not exist!\n${row.fastq_1}"
    }
    if (meta.single_end) {
        fastq_meta = [ meta, [ file(row.fastq_1) ] ]
    } else {
        if (!file(row.fastq_2).exists()) {
            exit 1, "ERROR: Please check input samplesheet -> Read 2 FastQ file does not exist!\n${row.fastq_2}"
        }
        fastq_meta = [ meta, [ file(row.fastq_1), file(row.fastq_2) ] ]
    }
    return fastq_meta
}

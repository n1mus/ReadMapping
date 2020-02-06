/*
A KBase module: ReadMapping
*/

module ReadMapping {
    typedef structure {
        string report_name;
        string report_ref;
    } ReportResults;

    funcdef hisat2(mapping<string,UnspecifiedObject> params) returns (ReportResults output) authentication required;
    funcdef bwa(mapping<string,UnspecifiedObject> params) returns (ReportResults output) authentication required;
    funcdef minimap2(mapping<string,UnspecifiedObject> params) returns (ReportResults output) authentication required;
    funcdef bowtie2(mapping<string,UnspecifiedObject> params) returns (ReportResults output) authentication required;

};

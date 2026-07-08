namespace OlistEtl
{
    class CsvProfileResult
    {
        public string FileName { get; set; } = "";
        public string Header { get; set; } = "";
        public int LineCount { get; set; }
        public int DataRowCount { get; set; }
    }
}
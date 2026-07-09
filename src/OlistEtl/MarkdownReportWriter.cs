namespace OlistEtl
{
    class MarkdownReportWriter
    {
        public void WriteCsvProfileReport(List<CsvProfileResult> profileResults)
        {
            string outputFilePath = "data/processed/csv_profile_report.md";

            using(StreamWriter sw = new StreamWriter(outputFilePath))
            {
                sw.WriteLine("# CSV Profile Report");
                sw.WriteLine();
                sw.WriteLine("## Summary");
                sw.WriteLine();
                sw.WriteLine($"Files processed: {profileResults.Count}");
                sw.WriteLine($"Total data rows: {profileResults.Sum(result => result.DataRowCount)}");
                sw.WriteLine();
                sw.WriteLine("## Files");
                sw.WriteLine();
                sw.WriteLine("| File | Line Count | Data Row Count |");
                sw.WriteLine("|---|---:|---:|");
                foreach(var result in profileResults)
                {
                    sw.WriteLine($"| {result.FileName} | {result.LineCount} | {result.DataRowCount} |");
                }
            }
        }
    }
}
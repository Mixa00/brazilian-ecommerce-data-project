namespace OlistEtl
{
    class CsvProfiler
    {
        public CsvProfileResult ProfileCsvFile(string fileName)
        {
            string header = File.ReadLines(fileName).FirstOrDefault() ?? "";
            int numberOfLines = File.ReadLines(fileName).Count();
            int dataRowCount = Math.Max(numberOfLines - 1, 0);

            Console.WriteLine($"File: {Path.GetFileName(fileName)}");
            Console.WriteLine($"Header: {header}");
            Console.WriteLine($"Line count: {numberOfLines}");
            Console.WriteLine($"Data row count: {dataRowCount}");
            Console.WriteLine();

            return new CsvProfileResult
            {
                FileName = Path.GetFileName(fileName),
                Header = header,
                LineCount = numberOfLines,
                DataRowCount = dataRowCount
            };
        }
    }
}
namespace OlistEtl
{
    class Program
    {
        
        static void Main(string[] args)
        {
            if (args.Length == 0)
            {
                Console.WriteLine("Please provide a CSV file path or directory path.");
                return;
            }

            if (!File.Exists(args[0]) && !Directory.Exists(args[0]))
            {
                Console.WriteLine($"File or directory not found: {args[0]}");
                return;
            }

            string path = args[0];

            if (Directory.Exists(path))
            {
                DirectoryProcess(path);
                return;
            }
            else
                ProfileCsvFile(path);
            
        }

        static void DirectoryProcess(string pathName)
        {
            List<int> dataRowCounts = new List<int>();
            List<string> csvFiles = Directory.GetFiles(pathName, "*.csv").ToList();

            foreach(string file in csvFiles)
            {
                int dataRowCount = ProfileCsvFile(file);
                dataRowCounts.Add(dataRowCount);
            }

            Console.WriteLine("Summary");
            Console.WriteLine($"Files processed: {csvFiles.Count}");
            Console.WriteLine($"Total data rows: {dataRowCounts.Sum()}");
        }

        static int ProfileCsvFile(string fileName)
        {
            string header = File.ReadLines(fileName).FirstOrDefault() ?? "";
            int numberOfLines = File.ReadLines(fileName).Count();
            int dataRowCount = Math.Max(numberOfLines - 1, 0);

            Console.WriteLine($"File: {Path.GetFileName(fileName)}");
            Console.WriteLine($"Header: {header}");
            Console.WriteLine($"Line count: {numberOfLines}");
            Console.WriteLine($"Data row count: {dataRowCount}");
            Console.WriteLine();

            return dataRowCount;
        }
    }
}

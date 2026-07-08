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
            {
                ProfileCsvFile(path);
            }
        }

        static void FileCountCheck(List<string> csvFiles, List<string> expectedFiles)
        {
            int counter = 0;
            List<string> missingFiles = new List<string>();

            foreach (var file in expectedFiles)
            {
                if (csvFiles.Any(f => Path.GetFileName(f).Equals(file, StringComparison.OrdinalIgnoreCase)))
                {
                    counter++;
                }
                else
                {  
                    missingFiles.Add(file);
                }
            }
            
            Console.WriteLine("Expected files check");
            Console.WriteLine($"Found: {counter}");
            Console.WriteLine($"Missing: {expectedFiles.Count - counter}");

            if (missingFiles.Count > 0)
            {
                Console.WriteLine("Missing files:");
                foreach (string missingFile in missingFiles)
                {
                    Console.WriteLine($"- {missingFile}");
                }
            }

            Console.WriteLine();
        }

        static void DirectoryProcess(string pathName)
        {
            List<string> expectedFiles = new List<string>
            {
                "olist_customers_dataset.csv",
                "olist_geolocation_dataset.csv",
                "olist_order_items_dataset.csv",
                "olist_order_payments_dataset.csv",
                "olist_order_reviews_dataset.csv",
                "olist_orders_dataset.csv",
                "olist_products_dataset.csv",
                "olist_sellers_dataset.csv",
                "product_category_name_translation.csv"
            };

            //List<int> dataRowCounts = new List<int>();
            List<CsvProfileResult> profileResults = new List<CsvProfileResult>();
            List<string> csvFiles = Directory.GetFiles(pathName, "*.csv").ToList();

            FileCountCheck(csvFiles, expectedFiles);

            foreach(string file in csvFiles)
            {
                CsvProfileResult result = ProfileCsvFile(file);
                profileResults.Add(result);

                //int dataRowCount = ProfileCsvFile(file);
                //dataRowCounts.Add(dataRowCount);
            }

            Console.WriteLine("Summary");
            Console.WriteLine($"Files processed: {csvFiles.Count}");
            Console.WriteLine($"Total data rows: {profileResults.Sum(result => result.DataRowCount)}");
        }

        static CsvProfileResult ProfileCsvFile(string fileName)
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

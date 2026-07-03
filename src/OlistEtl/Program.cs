namespace OlistEtl
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length == 0)
            {
                Console.WriteLine("Please provide a CSV file path.");
                return;
            }

            if (!File.Exists(args[0]))
            {
                Console.WriteLine($"File not found: {args[0]}");
                return;
            }

            string fileName = args[0];
            string header = File.ReadLines(fileName).FirstOrDefault() ?? "";
            int numberOfLines = File.ReadLines(fileName).Count();
            int dataRowCount = Math.Max(numberOfLines - 1, 0);

            Console.WriteLine($"File: {Path.GetFileName(fileName)}");
            Console.WriteLine($"Header: {header}");
            Console.WriteLine($"Line count: {numberOfLines}");
            Console.WriteLine($"Data row count: {dataRowCount}");
        }
    }
}

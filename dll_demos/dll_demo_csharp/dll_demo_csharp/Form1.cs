using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace dll_demo_csharp
{
    public partial class Form1 : Form
    {
        [DllImport("Kernel32.dll")]
        private static extern bool QueryPerformanceCounter(out long lpPerformanceCount);

        [DllImport("Kernel32.dll")]
        private static extern bool QueryPerformanceFrequency(out long lpFrequency);

        [DllImport("kernel32.dll", EntryPoint = "LoadLibrary")]
        static extern IntPtr LoadLibrary(
           [MarshalAs(UnmanagedType.LPStr)] string lpLibFileName);

        [DllImport("kernel32.dll", EntryPoint = "GetProcAddress")]
        static extern IntPtr GetProcAddress(IntPtr hModule,
            [MarshalAs(UnmanagedType.LPStr)] string lpProcName);

        [DllImport("kernel32.dll", EntryPoint = "FreeLibrary")]
        static extern bool FreeLibrary(IntPtr hModule);

        [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
        delegate void Fvoid(int[] arr, int size);

        [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
        delegate int Fint(int[] arr, int size);

        [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
        delegate double Fdouble(IntPtr[] matrix, int size);

        private long FBeginCount, FEndCount;
        private long FFrequence;
        Double Ftime;

        public int nd_arr = 400000;
        public int nd_matrix = 2500;
        public int[] arr;
        public double[][] matrix;

        public double[] timeArr;
        public double minTime = 0, maxTime = 0, avgTime = 0;

        string[] func_name1 = { "shellSort", "multiplesOfNine", "avgDiagonalMatrix" };
        string[] func_name2 = { "_shellSort", "_multiplesOfNine", "_avgDiagonalMatrix" };

        public Form1()
        {
            InitializeComponent();

            matrix = new double[nd_matrix][];
            for (int y = 0; y < nd_matrix; y++)
            {
                matrix[y] = new double[nd_matrix];
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        void Dll_demo_working(string dll_name, string[] func_name)
        {
            IntPtr pProc;
            richTextBox1.Clear();

            IntPtr pDll = LoadLibrary(dll_name);
            if (pDll == IntPtr.Zero)
            {
                richTextBox1.AppendText("ОШИБКА: Не удалось загрузить DLL:  " + dll_name);
                return;
            }

            richTextBox1.AppendText("Библиотека (" + dll_name + ") загружена успешно! \n");

            pProc = GetProcAddress(pDll, func_name[0]);
            if (pProc == IntPtr.Zero)
            {
                richTextBox1.AppendText("\nОШИБКА: Не удалось найти DLL функцию - (" + func_name[0] + ")");
            }
            else
            {
                Fvoid shellSort = (Fvoid)Marshal.GetDelegateForFunctionPointer(pProc, typeof(Fvoid));

                richTextBox1.AppendText("\n--------------------Тестирование функции сортировки методом шелла--------------------\n".ToString());

                arr = new int[nd_arr];
                timeArr = new double[50];
                for (int iters = 0; iters < 50; iters++)
                {
                    randomArr(arr, nd_arr);

                    QueryPerformanceFrequency(out FFrequence);
                    QueryPerformanceCounter(out FBeginCount);

                    shellSort(arr, nd_arr);

                    QueryPerformanceCounter(out FEndCount);
                    Ftime = ((FEndCount - FBeginCount) / (double)FFrequence) * 1000;
                    timeArr[iters] = Ftime;
                }
                minTime = minValueArr(timeArr, 50);
                maxTime = maxValueArr(timeArr, 50);
                avgTime = avgValueArr(timeArr, 50);
                richTextBox1.AppendText($"Минимальное значение времени: {Math.Round(minTime, 4)}\n".ToString());
                richTextBox1.AppendText($"Максимальное значение времени: {Math.Round(maxTime, 4)}\n".ToString());
                richTextBox1.AppendText($"Среднее арифмитическое значение времени: {Math.Round(avgTime, 4)}\n".ToString());
            }

            pProc = GetProcAddress(pDll, func_name[1]);
            if (pProc == IntPtr.Zero)
            {
                richTextBox1.AppendText("\nОШИБКА: Не удалось найти DLL функцию - (" + func_name[1] + ")");
            }
            else
            {
                Fint multiplesOfNine = (Fint)Marshal.GetDelegateForFunctionPointer(pProc, typeof(Fint));
                richTextBox1.AppendText("\n--------------------Тестирование функции поиска элементов массива кратных 9--------------------\n".ToString());

                int res = 0;
                arr = new int[nd_arr];
                timeArr = new double[50];
                for (int iters = 0; iters < 50; iters++)
                {
                    randomArr(arr, nd_arr);

                    QueryPerformanceFrequency(out FFrequence);
                    QueryPerformanceCounter(out FBeginCount);

                    res = multiplesOfNine(arr, nd_arr);

                    QueryPerformanceCounter(out FEndCount);
                    Ftime = ((FEndCount - FBeginCount) / (double)FFrequence) * 1000;
                    timeArr[iters] = Ftime;
                }
                minTime = minValueArr(timeArr, 50);
                maxTime = maxValueArr(timeArr, 50);
                avgTime = avgValueArr(timeArr, 50);
                richTextBox1.AppendText($"Минимальное значение времени: {Math.Round(minTime, 4)}\n".ToString());
                richTextBox1.AppendText($"Максимальное значение времени: {Math.Round(maxTime, 4)}\n".ToString());
                richTextBox1.AppendText($"Среднее арифмитическое значение времени: {Math.Round(avgTime, 4)}\n".ToString());
            }

            pProc = GetProcAddress(pDll, func_name[2]);
            if (pProc == IntPtr.Zero)
            {
                richTextBox1.AppendText("\nОШИБКА: Не удалось найти DLL функцию - (" + func_name[2] + ")");
            }
            else
            {
                Fdouble avgDiagonalMatrix = (Fdouble)Marshal.GetDelegateForFunctionPointer(pProc, typeof(Fdouble));

                richTextBox1.AppendText("\n--------------------Тестирование функции нахождения среднего арифметического диагонали матрицы--------------------\n".ToString());

                double res = 0;
                
                timeArr = new double[50];
                for (int iters = 0; iters < 50; iters++)
                {
                    randomMatrix(matrix, nd_matrix);

                    QueryPerformanceFrequency(out FFrequence);
                    QueryPerformanceCounter(out FBeginCount);
                    unsafe
                    {
                        IntPtr[] mas_ptrs = new IntPtr[nd_matrix];
                        for (int i = 0; i < nd_matrix; i++)
                        {
                            fixed (void* ptr = matrix[i])
                            {
                                mas_ptrs[i] = new IntPtr(ptr);
                            }
                        }
                        res = avgDiagonalMatrix(mas_ptrs, nd_matrix);
                    }

                    QueryPerformanceCounter(out FEndCount);
                    Ftime = ((FEndCount - FBeginCount) / (double)FFrequence) * 1000;
                    timeArr[iters] = Ftime;
                }
                minTime = minValueArr(timeArr, 50);
                maxTime = maxValueArr(timeArr, 50);
                avgTime = avgValueArr(timeArr, 50);
                richTextBox1.AppendText($"Минимальное значение времени: {Math.Round(minTime, 4)}\n".ToString());
                richTextBox1.AppendText($"Максимальное значение времени: {Math.Round(maxTime, 4)}\n".ToString());
                richTextBox1.AppendText($"Среднее арифмитическое значение времени: {Math.Round(avgTime, 4)}\n".ToString());
            }

            FreeLibrary(pDll);
        }
        void randomArr(int[] arr, int size)
        {
            Random rand = new Random();

            for (int i = 0; i < size; i++)
                arr[i] = rand.Next(0, 100000);
        }
        void randomMatrix(double[][] matrix, int size)
        {
            Random rand = new Random();

            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size; j++)
                {
                    matrix[i][j] = rand.Next(0, 100000);
                }
            }
        }

        double maxValueArr(double[] arr, int size)
        {
            double max = arr[0];
            for (int i = 1; i < size; i++)
            {
                if (arr[i] > max)
                {
                    max = arr[i];
                }
            }
            return max;
        }

        double minValueArr(double[] arr, int size)
        {
            double min = arr[0];
            for (int i = 1; i < size; i++)
            {
                if (arr[i] < min)
                {
                    min = arr[i];
                }
            }
            return min;
        }

        double avgValueArr(double[] arr, int size)
        {
            double sum = 0;
            for (int i = 0; i < size; i++)
            {
                sum += arr[i];
            }
            return sum / size;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Dll_demo_working("dll_sample_cpp.dll", func_name1);
        }
        private void button2_Click(object sender, EventArgs e)
        {
            Dll_demo_working("dll_sample_lazarus.dll", func_name1);
        }
        private void button3_Click(object sender, EventArgs e)
        {
            Dll_demo_working("dll_sample_cpp_builder.dll", func_name2);
        }
    }
}
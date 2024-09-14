using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace Kazino.Pages
{
    /// <summary>
    /// Логика взаимодействия для RulePage.xaml
    /// </summary>
    public partial class RulePage : Page
    {

        private Random random;
        private DispatcherTimer timer;
        private int spinCount;


        static MainWindow _mainWindow;
        public RulePage(MainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;

            random = new Random();
            timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromMilliseconds(100); // Время между спинами
            timer.Tick += Timer_Tick;
        }
        private void SpinButton_Click(object sender, RoutedEventArgs e)
        {
            spinCount = 0;
            ResultTextBlock.Text = "";
            timer.Start(); // Начинаем таймер
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            // Генерируем случайное число от 0 до 36
            int result = random.Next(0, 21);
            ResultTextBlock.Text = result.ToString();
            spinCount++;
            int result1 = random.Next(0, 21);
            ResultTextBlock1.Text = result1.ToString();
            spinCount++;
            int result2 = random.Next(0, 21);
            ResultTextBlock2.Text = result2.ToString();
            spinCount++;

            // Останавливаем вращение через 20 раз (например)
            if (spinCount >= 10 )
            {
                timer.Stop(); // Останавливаем таймер
            }
        }
    }
}
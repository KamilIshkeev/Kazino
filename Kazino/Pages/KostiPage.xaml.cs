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

namespace Kazino.Pages
{
    /// <summary>
    /// Логика взаимодействия для KostiPage.xaml
    /// </summary>
    public partial class KostiPage : Page
    {
        static MainWindow _mainWindow;
        public KostiPage(MainWindow mainWindow)
        {

            InitializeComponent();
            _mainWindow = mainWindow;

        }

        private void RollButtonClick(object sender, RoutedEventArgs e)
        {
            // Генерация случайного числа от 1 до 6
            Random random = new Random();
            int result = random.Next(1, 7);

            // Отображение результата в TextBlock
            resultTextBlock.Text = "Результат: " + result;

            // Отображение соответствующего изображения кубика
            diceImage.Source =
                new BitmapImage(new Uri($"Img/dice{result}.png", UriKind.Relative));
        }
    }
}

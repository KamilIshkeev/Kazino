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
using System.ComponentModel;
using Kazino.Base;
using System.Diagnostics;
using System.Security.Cryptography;

namespace Kazino.Pages
{
    /// <summary>
    /// Логика взаимодействия для KostiPage.xaml
    /// </summary>
    public partial class KostiPage : Page
    {
        private Random random;
        private DispatcherTimer timer; 
        private int spinCount;
        static MainWindow _mainWindow;
        private Random random2;
        private int stavka;
        private int result;
        private int result2;
        public KostiPage(MainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;
            random = new Random(); timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromMilliseconds(70); // Время между спинами        timer.Tick += Timer_Tick;
        }


        private void RollButtonClick(object sender, RoutedEventArgs e)
        {
            if(Sum_Stavki.Text == "Укажите сумму ставки")
            {
                Sum_Stavki.Text = "1000";
            }
            stavka = Convert.ToInt32(Sum_Stavki.Text);
            result = random.Next(1, 7);

            // Отображение результата в TextBlock
            resultTextBlock.Text = "Результат: " + result;

            // Отображение соответствующего изображения кубика
            diceImage.Source =
                new BitmapImage(new Uri($"Img/dice{result}.png", UriKind.Relative));
            RollButtonClick();

            var sumstav = Convert.ToInt32(Sum_Stavki.Text);
            var dates = DateTime.Today;
            var prof = Convert.ToInt32(Sum_Stavki.Text);
            var game = 1;
            

            var hz = connect.db.ind_history.FirstOrDefault(id => id.bet_credits == sumstav && id.date_game == dates && id.profit == prof && id.id_game == game);

            var indhs = new ind_history()
            {
                bet_credits = sumstav,
                date_game = dates,
                profit = prof,
                id_game = game
            };

            connect.db.ind_history.Add(indhs);
            connect.db.SaveChanges();
            return;
        }

        private void RollButtonClick()
        {
            Random random2 = new Random();
            result2 = random2.Next(1, 7);

            // Отображение результата в TextBlock
            resultTextBlock2.Text = "Результат: " + result2;

            // Отображение соответствующего изображения кубика
            diceImage2.Source =
                new BitmapImage(new Uri($"Img/dice{result2}.png", UriKind.Relative));

            if(result > result2)
            {
                itog_Stavki.Text = $"Итог: Вы выиграли {stavka}";
            }
            if(result < result2)
            {
                itog_Stavki.Text = $"Итог: Вы проиграли {stavka}";
            }
            if (result == result2)
            {
                itog_Stavki.Text = $"Итог: Ничья, никто не забрал ставку";
            }
        }

       
    }
}

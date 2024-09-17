using Kazino.Base;
using System;
using System.Collections;
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
        private int stavka;


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
            if (Sum_Stavki.Text == "Укажите сумму ставки")
            {
                Sum_Stavki.Text = "1000";
            }

            if (Kf_stav.Text == "Укажите К/Ф")
            {
                Kf_stav.Text = "5";
            }
            var kf = Convert.ToInt32(Kf_stav.Text);
            
            stavka = Convert.ToInt32(Sum_Stavki.Text);
            // Генерируем случайное число от 0 до 36
            int result = random.Next(0, kf);
            ResultTextBlock.Text = result.ToString();
            spinCount++;
            int result1 = random.Next(0, kf);
            ResultTextBlock1.Text = result1.ToString();
            spinCount++;
            int result2 = random.Next(0, kf);
            ResultTextBlock2.Text = result2.ToString();
            spinCount++;

            // Останавливаем вращение через 20 раз (например)
            if (spinCount >= 10)
            {
                timer.Stop(); // Останавливаем таймер
                if (result == result1 && result1 == result2 && kf < 3)
                {
                    itog_Stavki.Text = $"Итог: Вы выиграли {stavka * 5}";
                }
                else if (result == result1 && result1 == result2 && kf < 5)
                {
                    itog_Stavki.Text = $"Итог: Вы выиграли {stavka * 15}";
                }
                else if (result == result1 && result1 == result2 && kf < 10)
                {
                    itog_Stavki.Text = $"Итог: Вы выиграли {stavka * 25}";
                }
                else if (result == result1 && result1 == result2 && kf < 15)
                {
                    itog_Stavki.Text = $"Итог: Вы выиграли {stavka * 30}";
                }
                else
                {
                    itog_Stavki.Text = $"Итог: Вы проиграли {stavka}";
                }


            var sumstav = Convert.ToInt32(Sum_Stavki.Text);
            var dates = DateTime.Today;
            var prof = Convert.ToInt32(Sum_Stavki.Text);

            var hz = connect.db.ind_history.FirstOrDefault(id => id.bet_credits == sumstav && id.date_game == dates && id.profit == prof);

            var indhs = new ind_history()
            {
                bet_credits = sumstav,
                date_game = dates,
                profit = prof,
            };

            connect.db.ind_history.Add(indhs);
            connect.db.SaveChanges();
            return;



            }


            


        }
    }
}
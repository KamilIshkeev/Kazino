using System;
using Kazino;
using Kazino.Base;
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
using Kazino.Pages;



namespace Kazino.Pages
{
    /// <summary>
    /// Логика взаимодействия для RegistPage.xaml
    /// </summary>
    public partial class RegistPage : Page
    {
        static MainWindow _mainWindow;
        public RegistPage(MainWindow mainWindow)
        {
            _mainWindow = mainWindow;
            InitializeComponent();
        }

        private void Button_Registration(object sender, RoutedEventArgs e)
        {

            string login = txtLogin.Text.Trim();
            int password = Convert.ToInt32(txtPass.Text);
            // Приводим к целочисленному типу

            // Проверяем, есть ли уже пользователь с таким логином в базе данных
            var existingUser = connect.db.user.FirstOrDefault(u => u.login_user == login);

            if (existingUser != null)
            {
                // Если такой пользователь есть
                if (existingUser.password == password)
                {
                    // Пароль верный - переходим в профиль
                    _mainWindow.MainFrame.NavigationService.Navigate(new ProfilePage(_mainWindow));
                }
                else
                {
                    // Пароль неверный - выводим сообщение об ошибке
                    MessageBox.Show("Неверный пароль!");
                }
            }
            else
            {
                // Пользователь не найден - регистрируем его
                var newUser = new user()
                {
                    login_user = login,
                    password = password
                };
                connect.db.user.Add(newUser);
                connect.db.SaveChanges();
                MessageBox.Show("Пользователь зарегистрирован");
                _mainWindow.MainFrame.NavigationService.Navigate(new MainPage(_mainWindow));
            }
        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
            string login = txtLogin.Text.Trim();
            //int password = Convert.ToInt32(txtPass.Text);
            bool status = (bool)chek_stat.IsChecked;
            // Приводим к целочисленному типу

            // Проверяем, есть ли уже пользователь с таким логином в базе данных
            var existingUser = connect.db.user.FirstOrDefault(u => u.login_user == login);

            if (status == true)
            {
                existingUser.id_status = true;
                connect.db.SaveChanges();

            }
            else
            {
                // Пользователь не найден - регистрируем его
                //var newUser = new user()
                //{
                //    login_user = login,
                //    password = password
                //};
                //connect.db.user.Add(newUser);
                //connect.db.SaveChanges();
                //MessageBox.Show("Пользователь зарегистрирован");
                //_mainWindow.MainFrame.NavigationService.Navigate(new MainPage(_mainWindow));
            }
        }
    }



  
}


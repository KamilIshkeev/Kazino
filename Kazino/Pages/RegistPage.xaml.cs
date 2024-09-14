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
            var iduser = txtLogin.Text;

            var pass = Convert.ToInt32(txtPass.Text);

            var usersss = connect.db.user.FirstOrDefault(id => id.login_user == iduser && id.password == pass);

            var UsEr = new user()
            {
                login_user = iduser,
                password = pass
            };

            var iduser1 = "";

            var pass1 = 0;

            var ussser = connect.db.user.FirstOrDefault(id1 => id1.login_user == iduser1 && id1.password == pass1);

            var UsEr1 = new user()
            {
                login_user = iduser1,
                password = pass1,
                

            };
            if (txtLogin.Text != iduser & Convert.ToInt32(txtPass.Text) != pass)/*(iduser != iduser1 & pass != pass1)*/
            {
                string login = txtLogin.Text;
                int password = Convert.ToInt32(txtPass.Text);
                var userTemp = new user() { login_user = login, password = password };
                connect.db.user.Add(userTemp);
                connect.db.SaveChanges();
                MessageBox.Show("Пользователь зарегистрирован");
                _mainWindow.MainFrame.NavigationService.Navigate(new MainPage(_mainWindow));
            }
            else if (txtLogin.Text == iduser & Convert.ToInt32(txtPass.Text) != pass)
            {
                MessageBox.Show("Пароль введен не правильно!");
            }
            else if (txtLogin.Text == iduser & Convert.ToInt32(txtPass.Text) == pass)
            {
                _mainWindow.MainFrame.NavigationService.Navigate(new ProfilePage(_mainWindow));
            }

        }
    }
}

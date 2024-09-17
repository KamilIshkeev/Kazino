using Kazino.Base;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
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
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        static MainWindow _mainWindow;
        public UserPage(MainWindow mainWindow)
        {
            _mainWindow = mainWindow;
            InitializeComponent();
            ListUser.ItemsSource = connect.db.user.ToList();
          
        }


        private void btn_admin(object sender, RoutedEventArgs e)
        {
            user users = ListUser.SelectedItem as user;
            users = connect.db.user.Find(users.id_status);
            if (users != null)
            {
                users.id_status = true;
                connect.db.SaveChanges();
                ListUser.Items.Refresh();
            }
            else
            {
                //users.id_status = false;
                //connect.db.SaveChanges();
                //ListUser.Items.Refresh();
            }




        }

    }
}

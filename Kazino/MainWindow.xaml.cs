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
using Kazino.Pages;

namespace Kazino
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.NavigationService.Navigate(new RegistPage(this));
            WindowState = WindowState.Maximized;
            WindowStyle = WindowStyle.None;
        }

        private void Button_Click_Exit(object sender, RoutedEventArgs e)
        {
            Environment.Exit(0);
        }

        private void Button_Profile(object sender, RoutedEventArgs e)
        {
            MainFrame.NavigationService.Navigate(new ProfilePage(this));
        }

        private void Button_Kosti(object sender, RoutedEventArgs e)
        {
            MainFrame.NavigationService.Navigate(new KostiPage(this));
        }

        private void Button_Ruletka(object sender, RoutedEventArgs e)
        {
            MainFrame.NavigationService.Navigate(new RulePage(this));
        }
    }
}

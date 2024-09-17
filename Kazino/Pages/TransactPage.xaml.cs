using Kazino.Base;
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
    /// Логика взаимодействия для TransactPage.xaml
    /// </summary>
    public partial class TransactPage : Page
    {
        static MainWindow _mainWindow;
        public TransactPage(MainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;
            ListTransact.ItemsSource = connect.db.transactions.ToList();
        }
    }
}

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
    /// Логика взаимодействия для HistoryGame.xaml
    /// </summary>
    public partial class HistoryGame : Page
    {
        static MainWindow _mainWindow;
        public HistoryGame(MainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;
            ListHistory.ItemsSource = connect.db.ind_history.ToList();
        }
    }
}

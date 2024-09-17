using Kazino.Base;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
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
    /// Логика взаимодействия для ProfilePage.xaml
    /// </summary>
    public partial class ProfilePage : Page
    {
        int useR;
        string log;
        string Pas;
        int Cred;
       
        static MainWindow _mainWinsow;
        public ProfilePage(MainWindow mainWindow)
        {
            InitializeComponent();
            _mainWinsow = mainWindow;
            useR = RegistPage.User.id_user;
            txtId.Text = $"ID:{Convert.ToString(useR)}"; //$"ID:{}"
            log = RegistPage.User.login_user;
            txtlogin.Text = $"Login:{log}";
            Pas = Convert.ToString(RegistPage.User.password);
            txtpass.Text = $"Password:{Pas}";
            //Cred = Convert.ToInt32(RegistPage.User.credits);

            QrCodeImage.Source = GenerateQrCodeBitmapImage($"User: {log}, {Pas}");

        }





        private BitmapImage GenerateQrCodeBitmapImage(string text)
        {
            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            {
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(text, QRCodeGenerator.ECCLevel.Q); using (QRCode qrCode = new QRCode(qrCodeData))
                {
                    using (Bitmap qrBitmap = qrCode.GetGraphic(20))
                    {
                        using (MemoryStream ms = new MemoryStream())
                        {
                            qrBitmap.Save(ms, ImageFormat.Png);
                            ms.Position = 0;
                            BitmapImage bitmapImage = new BitmapImage(); bitmapImage.BeginInit();
                            bitmapImage.CacheOption = BitmapCacheOption.OnLoad; bitmapImage.StreamSource = ms;
                            bitmapImage.EndInit();
                            return bitmapImage;
                        }
                    }
                }
            }
        }
    }
}

//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Kazino.Base
{
    using System;
    using System.Collections.Generic;
    
    public partial class trade_chips
    {
        public int id_trade { get; set; }
        public Nullable<int> id_bank { get; set; }
        public Nullable<int> id_user { get; set; }
        public Nullable<int> credits { get; set; }
        public Nullable<int> chips { get; set; }
    
        public virtual bank_kazino bank_kazino { get; set; }
        public virtual user user { get; set; }
    }
}

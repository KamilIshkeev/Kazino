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
    
    public partial class rep_game
    {
        public int id_rep { get; set; }
        public Nullable<int> id_history { get; set; }
        public Nullable<int> bet_credits { get; set; }
    
        public virtual ind_history ind_history { get; set; }
    }
}

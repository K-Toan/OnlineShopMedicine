using System;
using System.Collections.Generic;

namespace OnlineShopMedicine.Models
{
    public partial class Cart
    {
        public int AccountId { get; set; }
        public int MedicineId { get; set; }
        public int TypeId { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }

        public virtual Account Account { get; set; } = null!;
        public virtual MedicineType MedicineType { get; set; } = null!;
    }
}

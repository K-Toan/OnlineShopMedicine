using System;
using System.Collections.Generic;

namespace OnlineShopMedicine.Models
{
    public partial class MedicineType
    {
        public MedicineType()
        {
            Carts = new HashSet<Cart>();
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int MedicineId { get; set; }
        public int TypeId { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }

        public virtual Medicine Medicine { get; set; } = null!;
        public virtual Type Type { get; set; } = null!;
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}

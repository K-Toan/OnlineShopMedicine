using System;
using System.Collections.Generic;

namespace OnlineShopMedicine.Models
{
    public partial class Type
    {
        public Type()
        {
            MedicineTypes = new HashSet<MedicineType>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;

        public virtual ICollection<MedicineType> MedicineTypes { get; set; }
    }
}

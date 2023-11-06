using System;
using System.Collections.Generic;

namespace OnlineShopMedicine.Models
{
    public partial class Medicine
    {
        public Medicine()
        {
            MedicineTypes = new HashSet<MedicineType>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public int? CountryId { get; set; }
        public DateTime? ExpiredDate { get; set; }
        public string? Image { get; set; }
        public string? Descript { get; set; }
        public int? MinAge { get; set; }
        public int CategoryId { get; set; }

        public virtual Category Category { get; set; } = null!;
        public virtual Country? Country { get; set; }
        public virtual ICollection<MedicineType> MedicineTypes { get; set; }
    }
}

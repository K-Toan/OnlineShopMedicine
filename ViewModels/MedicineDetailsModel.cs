using OnlineShopMedicine.Models;

namespace OnlineShopMedicine.ViewModels
{
    public class MedicineDetailsModel
    {
        public int? Number { get; set; }
        public Medicine Medicine { get; set; }
        public List<MedicineType> MedicineTypes { get; set; }
    }
}

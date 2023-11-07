using OnlineShopMedicine.Models;

namespace OnlineShopMedicine.ViewModels
{
    public class MedicineListModel
    {
        public List<int>? CategoryIds { get; set; }
        public List<Medicine> Medicines { get; set; }
        public List<Category> Categories { get; set; }
    }
}

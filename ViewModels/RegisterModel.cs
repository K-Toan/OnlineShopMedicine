using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace OnlineShopMedicine.ViewModels
{
    public class RegisterModel
    {
        [Required]
        public string Username { get; set; }
        [Required, MinLength(6)]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Required, MinLength(6)]
        [DataType(DataType.Password)]
        [Display(Name = "Repeat Password")]
        public string RepeatPassword { get; set; }
        [Required]
        public string Address { get; set; }
        [Required, MinLength(8)]
        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace LaptopSales13.Models
{

    public class LoginViewModel
    {
        [Required]
        public string Username { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        //[Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterViewModel
    {
        [Required]
        [RegularExpression(@"^[A-Za-z0-9]{4,}$", ErrorMessage = "Tối thiểu 4 ký tự")]
        public string Username { get; set; }

        [Required]
        [RegularExpression(@"^(([^<> ()\[\]\.,;:\s@\""]+(\.[^<>()\[\]\.,;:\s@\""]+)*)|(\"".+\""))@(([^<>()[\]\.,;:\s@\""]+\.)+[^<>()[\]\.,;:\s@\""]{2,})$", ErrorMessage ="Vui lòng nhập đúng định dạng email")]
        public string Email { get; set; }

        [Required]        
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$", ErrorMessage = "Tối thiểu 8 ký tự, ít nhất một chữ cái viết hoa, một chữ cái viết thường, một số và một ký tự đặc biệt")]
        //[StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        //[Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "Không trùng khớp.")]
        public string ConfirmPassword { get; set; }        
    }

    public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

}
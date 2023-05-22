using System;
using System.Collections.Generic;

namespace Otaku_No_Sekai.Models
{
    public partial class Account
    {

        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Pass { get; set; }
		public Account()
		{

		}
		public Account(int id, string? name, string? pass, ICollection<Product> products)
		{
			this.Id = id;
			this.Name = name;
			this.Pass = pass;
			this.Products = products;
		}

		public Account(string? name, string? pass)
		{
			this.Name = name;
			this.Pass = pass;
		}

		public virtual ICollection<Product> Products { get; } = new List<Product>();
	}
}

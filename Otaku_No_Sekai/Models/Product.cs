using System;
using System.Collections.Generic;

namespace Otaku_No_Sekai.Models
{
    public partial class Product
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? Author { get; set; }
        public int Poster { get; set; }
        public string? Image { get; set; }

        public virtual Account PosterNavigation { get; set; } = null!;
		public Product()
		{

		}
		public Product(int id, string? name, string? description, string? author, int poster, string? image, Account posterNavigation)
		{
			this.Id = id;
			this.Name = name;
			this.Description = description;
			this.Author = author;
			this.Poster = poster;
			this.Image = image;
			this.PosterNavigation = posterNavigation;
		}
		public Product(string? name, string? description, string? author, int poster, string? image)
		{
			this.Name = name;
			this.Description = description;
			this.Author = author;
			this.Poster = poster;
			this.Image = image;
		}
		public Product(int id, string? name, string? description, string? author, string? image)
		{
			this.Id = id;
			this.Name = name;
			this.Description = description;
			this.Author = author;
			this.Image = image;
		}
		public Product(int id, string? name, string? description, string? author, int poster, string? image)
		{
			this.Id = id;
			this.Name = name;
			this.Description = description;
			this.Author = author;
			this.Poster = poster;
			this.Image = image;
		}
	}
}

using Microsoft.AspNetCore.Mvc;
using Otaku_No_Sekai.Models;

namespace Otaku_No_Sekai.Controllers
{
	public class ProductController : Controller
	{
		private readonly IHttpContextAccessor _httpContextAccessor;
		public Variable v = new Variable();
		public ProductController(IHttpContextAccessor httpContextAccessor)
		{
			_httpContextAccessor = httpContextAccessor;
		}
		public ActionResult Detail(int id)
		{
			var name = _httpContextAccessor.HttpContext.Session.GetString("name");
			var aid = _httpContextAccessor.HttpContext.Session.GetInt32("id");
			ViewBag.Name = name;
			ViewBag.Id = aid;
			using var context = new Otaku_No_SekaiContext();
			List<Product> products = context.Products.ToList();
			Product product = v.GetProduct(id, products);
			if (product == null)
			{
				return RedirectToAction("Index", "Home");
			}
			else
			{
				ViewBag.Product = product;
				return View();
			}
		}
		public ActionResult Library(int aid)
		{
			var name = _httpContextAccessor.HttpContext.Session.GetString("name");
			var id = _httpContextAccessor.HttpContext.Session.GetInt32("id");
			ViewBag.Name = name;
			ViewBag.Id = id;
			using var context = new Otaku_No_SekaiContext();
			List<Product> products = context.Products.ToList();
			List<Product> userList = v.GetProductById(aid, products);
			ViewBag.UserList = userList;

			return View();
		}
		public ActionResult Add(int uid, string pro_name_txt, string pro_author_txt, string pro_image_txt, string pro_des_txt)
		{
			using var context = new Otaku_No_SekaiContext();
			List<Product> products = context.Products.ToList();
			var name = _httpContextAccessor.HttpContext.Session.GetString("name");
			var id = _httpContextAccessor.HttpContext.Session.GetInt32("id");
			ViewBag.Name = name;
			ViewBag.Id = id;
			if (uid == 0)
			{
				return RedirectToAction("Login", "Account");
			}
			else
			{
				if (v.checkExistName(pro_name_txt, products) == false)
				{
					if (pro_image_txt == null)
					{
						context.Products.Add(new Product(pro_name_txt, pro_des_txt, pro_author_txt, uid, "https://res.cloudinary.com/dawscodko/image/upload/v1679778293/nocover_fbxr7d.jpg"));
						context.SaveChanges();
						return RedirectToAction("Library", "Product", new { aid = uid });
					}
					else
					{
						context.Products.Add(new Product(pro_name_txt, pro_des_txt, pro_author_txt, uid, pro_image_txt));
						context.SaveChanges();
						return RedirectToAction("Library", "Product", new { aid = uid });
					}
				}
				else
				{
					return RedirectToAction("Library", "Product", new
					{
						aid = uid
					});
				}
			}
		}

		public IActionResult Delete(int pid)
		{
			var name = _httpContextAccessor.HttpContext.Session.GetString("name");
			var id = _httpContextAccessor.HttpContext.Session.GetInt32("id");
			ViewBag.Name = name;
			ViewBag.Id = id;
			using var context = new Otaku_No_SekaiContext();
			List<Product> products = context.Products.ToList();
			Product product = v.GetProduct(pid, products);
			context.Products.Remove(product);
			context.SaveChanges();
			return RedirectToAction("Library", "Product", new { aid = id });
		}
		public IActionResult LoadDetail(int pid)
		{
			using var context = new Otaku_No_SekaiContext();
			var name = _httpContextAccessor.HttpContext.Session.GetString("name");
			var id = _httpContextAccessor.HttpContext.Session.GetInt32("id");
			ViewBag.Name = name;
			ViewBag.Id = id;
			List<Product> products = context.Products.ToList();
			Product product = v.GetProduct(pid, products);
			if (product == null)
			{
				return RedirectToAction("Library", "Product", new { aid = id });
			}
			else
			{
				ViewBag.Product = product;
				return View();
			}
		}
		public ActionResult Edit(string pro_id_txt, string pro_name_txt, string pro_author_txt, string pro_image_txt, string pro_poster_txt, string pro_des_txt)
		{
			using var context = new Otaku_No_SekaiContext();
			var name = _httpContextAccessor.HttpContext.Session.GetString("name");
			var id = _httpContextAccessor.HttpContext.Session.GetInt32("id");
			ViewBag.Name = name;
			ViewBag.Id = id;
			Product product = new Product(Int32.Parse(pro_id_txt), pro_name_txt, pro_des_txt, pro_author_txt, Int32.Parse(pro_poster_txt), pro_image_txt);
			context.Products.Update(product);
			context.SaveChanges();
			return RedirectToAction("Library", "Product", new { aid = id });
		}
	}
}

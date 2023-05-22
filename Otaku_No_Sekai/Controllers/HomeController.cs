using Microsoft.AspNetCore.Mvc;
using Otaku_No_Sekai.Models;
using System.Diagnostics;

namespace Otaku_No_Sekai.Controllers
{
    public class HomeController : Controller
    {
		private readonly IHttpContextAccessor _httpContextAccessor;
		private readonly ILogger<HomeController> _logger;

		public HomeController(ILogger<HomeController> logger, IHttpContextAccessor httpContextAccessor)
		{
			_logger = logger;
			_httpContextAccessor = httpContextAccessor;
		}

		public IActionResult Index()
		{
			var name = _httpContextAccessor.HttpContext.Session.GetString("name");
			var id = _httpContextAccessor.HttpContext.Session.GetInt32("id");
			ViewBag.Name = name;
			ViewBag.Id = id;
			using var context = new Otaku_No_SekaiContext();
			Product product = context.Products.OrderBy(p => p.Id).LastOrDefault();
			ViewBag.Pro = product;
			List<Product> products = context.Products.ToList();
			List<Product> randomProducts = products.OrderBy(x => Guid.NewGuid()).Take(6).ToList();
			ViewBag.RandomProducts = randomProducts;
			return View();
		}

		public IActionResult Privacy()
		{
			return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
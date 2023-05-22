using Microsoft.AspNetCore.Mvc;
using Otaku_No_Sekai.Models;

namespace Otaku_No_Sekai.Controllers
{
	public class AccountController : Controller
	{
		private readonly IHttpContextAccessor _httpContextAccessor;
		public Variable v = new Variable();
		public AccountController(IHttpContextAccessor httpContextAccessor)
		{
			_httpContextAccessor = httpContextAccessor;
		}

		[HttpGet]
		public IActionResult Login()
		{
			return View();
		}
		[HttpPost]
		public ActionResult Login(string login_txt, string password_txt)
		{
			List<Account> accounts = new List<Account>();
			using var context = new Otaku_No_SekaiContext();
			accounts = context.Accounts.ToList();
			if (ModelState.IsValid)
			{
				foreach (Account account in accounts)
				{
					if (login_txt == account.Name && password_txt == account.Pass)
					{
						//ViewBag.Name = account.Name;
						_httpContextAccessor.HttpContext.Session.SetString("name", account.Name);
						_httpContextAccessor.HttpContext.Session.SetInt32("id", account.Id);
						return RedirectToAction("Index", "Home");
					}
					else
					{
						ModelState.AddModelError("", "Invalid username or password.");
					}
				}

			}
			return View();
		}

		[HttpGet]
		public IActionResult Signup()
		{
			return View();
		}
		[HttpPost]
		public ActionResult Signup(string login_txt, string password_txt, string re_password_txt)
		{
			using var context = new Otaku_No_SekaiContext();
			List<Account> accounts = context.Accounts.ToList();
			Account account1 = new Account(login_txt, password_txt);
			if (ModelState.IsValid)
			{
				if (v.checkExistAccount(account1, accounts) == true)
				{
					ModelState.AddModelError("", "Username is already taken.");
				}
				else
				{
					if (re_password_txt.Equals(password_txt))
					{
						context.Accounts.Add(new Account(login_txt, password_txt));
						context.SaveChanges();
						return RedirectToAction("Login", "Account");
					}
					else
					{
						ModelState.AddModelError("", "Invalid username or password.");
					}
				}
			}
			return View();
		}
		//[HttpGet]
		//public IActionResult Logout()
		//{
		//	return View("Index", "Home");
		//}
		//[HttpPost]
		//[ValidateAntiForgeryToken]
		public ActionResult Logout()
		{
			_httpContextAccessor.HttpContext.Session.Clear();
			return RedirectToAction("Index", "Home");
		}
	}
}

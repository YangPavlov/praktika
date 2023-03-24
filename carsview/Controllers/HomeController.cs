using carsview.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace carsview.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index(){
            ViewBag.CarsBrand = ModelAndBrandContext.GetContext().Brand.ToList();
            ViewBag.CarsBrandModel = ModelAndBrandContext.GetContext().Models.ToList();




            return View();
        }
        public IActionResult Change(int Id){
            if (Id != 0){
                ViewBag.CarsModel = ModelAndBrandContext.GetContext().Models.ToList().Where(p => p.IdModels == Id).ToList().FirstOrDefault();

                ViewData["ChangeOrAdd"] = "Изменить марку";
            }
            else{
                ViewData["ChangeOrAdd"] = "Добавить марку";
            }
            ViewBag.Brand = ModelAndBrandContext.GetContext().Brand.ToList();
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Change(Model model){
            ModelAndBrandContext _context = new ModelAndBrandContext();

            model.IdModels = _context.Models.ToList().OrderBy(p => p.IdModels).Last().IdModels + 1;
            model.Brand = _context.Brand.Where(p => p.IdBrands == model.BrandId).First();
            _context.Models.Add(model);



            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Change1(Model model){
            Console.WriteLine("qwerqweasdf");
            ModelAndBrandContext _context = new ModelAndBrandContext();

            Model model1 = _context.Models.ToList().Where(p => p.IdModels == model.IdModels).Last();
            Console.WriteLine("q " + model.IdModels);
            model1.IdModels = model.IdModels;
            model1.Name = model.Name;
            model1.Active = model.Active;
            model1.BrandId = model.BrandId;
            model1.Brand = model.Brand;

            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

    }
}

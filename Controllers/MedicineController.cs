using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using OnlineShopMedicine.Models;
using OnlineShopMedicine.ViewModels;

namespace OnlineShopMedicine.Controllers
{
    public class MedicineController : Controller
    {
        private readonly AppDbContext _context;

        public MedicineController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Medicine
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            List<Medicine> medicines = _context.Medicines
                                    .Include(m => m.Category)
                                    .Include(m => m.Country)
                                    .ToList();

            List<Category> categories = _context.Categories
                                        .ToList();

            MedicineListModel model = new MedicineListModel
            {
                Medicines = medicines,
                Categories = categories
            };

            return View(model);
        }

        // GET: Medicine
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Index(List<int>? CategoryIds)
        {
            List<Medicine> medicines = _context.Medicines
                                    .Include(m => m.Category)
                                    .Include(m => m.Country)
                                    .Where(m => CategoryIds == null || CategoryIds.Contains(m.CategoryId))
                                    .ToList();

            List<Category> categories = _context.Categories
                                        .ToList();

            MedicineListModel model = new MedicineListModel
            {
                CategoryIds = CategoryIds,
                Medicines = medicines,
                Categories = categories
            };

            return View(model);
        }

        // GET: Medicine/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Medicines == null)
            {
                return NotFound();
            }

            Medicine? medicine = await _context.Medicines
                                .Include(m => m.Category)
                                .Include(m => m.Country)
                                .Include(m => m.MedicineTypes)
                                .FirstOrDefaultAsync(m => m.Id == id);

            List<MedicineType> medicineTypes = _context.MedicineTypes
                                        .Include(mt => mt.Type)
                                        .Where(mt => mt.MedicineId == medicine.Id)
                                        .ToList();

            if (medicine == null)
                return NotFound();

            MedicineDetailsModel model = new MedicineDetailsModel
            {
                Medicine = medicine,
                MedicineTypes = medicineTypes,
            };

            return View(model);
        }

        // GET: Medicine/Create
        public IActionResult Create()
        {
            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "Id");
            ViewData["CountryId"] = new SelectList(_context.Countries, "Id", "Id");
            return View();
        }

        // POST: Medicine/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,CountryId,ExpiredDate,Image,Descript,MinAge,CategoryId")] Medicine medicine)
        {
            if (ModelState.IsValid)
            {
                _context.Add(medicine);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "Id", medicine.CategoryId);
            ViewData["CountryId"] = new SelectList(_context.Countries, "Id", "Id", medicine.CountryId);
            return View(medicine);
        }

        // GET: Medicine/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Medicines == null)
            {
                return NotFound();
            }

            var medicine = await _context.Medicines.FindAsync(id);
            if (medicine == null)
            {
                return NotFound();
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "Id", medicine.CategoryId);
            ViewData["CountryId"] = new SelectList(_context.Countries, "Id", "Id", medicine.CountryId);
            return View(medicine);
        }

        // POST: Medicine/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,CountryId,ExpiredDate,Image,Descript,MinAge,CategoryId")] Medicine medicine)
        {
            if (id != medicine.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(medicine);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MedicineExists(medicine.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "Id", medicine.CategoryId);
            ViewData["CountryId"] = new SelectList(_context.Countries, "Id", "Id", medicine.CountryId);
            return View(medicine);
        }

        // GET: Medicine/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Medicines == null)
            {
                return NotFound();
            }

            var medicine = await _context.Medicines
                .Include(m => m.Category)
                .Include(m => m.Country)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (medicine == null)
            {
                return NotFound();
            }

            return View(medicine);
        }

        // POST: Medicine/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Medicines == null)
            {
                return Problem("Entity set 'AppDbContext.Medicines'  is null.");
            }
            var medicine = await _context.Medicines.FindAsync(id);
            if (medicine != null)
            {
                _context.Medicines.Remove(medicine);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MedicineExists(int id)
        {
          return (_context.Medicines?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}

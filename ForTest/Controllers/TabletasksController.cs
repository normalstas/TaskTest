using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ForTest;

namespace ForTest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TabletasksController : ControllerBase
    {
        private readonly TesttaskContext _context;

        public TabletasksController(TesttaskContext context)
        {
            _context = context;
        }

        // GET: api/Tabletasks
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Tabletask>>> GetTabletasks(int? parentId = null)
        {
			var folders = await _context.Tabletasks.Where(f => f.ParentId == parentId || parentId == null)
								   .ToListAsync();
			return Ok(folders);
		}

        // GET: api/Tabletasks/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Tabletask>> GetTabletask(int id)
        {
            var tabletask = await _context.Tabletasks.FindAsync(id);

            if (tabletask == null)
            {
                return NotFound();
            }

            return tabletask;
        }

        // PUT: api/Tabletasks/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTabletask(int id, Tabletask tabletask)
        {
            if (id != tabletask.Id)
            {
                return BadRequest();
            }

            _context.Entry(tabletask).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TabletaskExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Tabletasks
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Tabletask>> PostTabletask(Tabletask tabletask)
        {
            _context.Tabletasks.Add(tabletask);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTabletask", new { id = tabletask.Id }, tabletask);
        }

        // DELETE: api/Tabletasks/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTabletask(int id)
        {
            var tabletask = await _context.Tabletasks.FindAsync(id);
            if (tabletask == null)
            {
                return NotFound();
            }

            _context.Tabletasks.Remove(tabletask);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TabletaskExists(int id)
        {
            return _context.Tabletasks.Any(e => e.Id == id);
        }
    }
}

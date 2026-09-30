using Microsoft.AspNetCore.Mvc;
using SeniorCare.Data;

namespace SeniorCare.Controllers
{
    public class ResidenteController : Controller
    {
        private readonly ConexionBD _conexionBD;

        public ResidenteController(ConexionBD conexionBD)
        {
            _conexionBD = conexionBD;
        }

        public IActionResult Index()
        {
            var residenteData = new ResidenteData(_conexionBD);
            var listaResidentes = residenteData.ObtenerTodos();
            
            return View(listaResidentes);
        }
    }
}

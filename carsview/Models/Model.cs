using carsview.Models;
using Models;

namespace carsview
{
    public partial class Model{
        public int IdModels { get; set; }
        public int? BrandId { get; set; }
        public string? Name { get; set; }
        public bool? Active { get; set; }

        public virtual Brand? Brand { get; set; }
    }
}

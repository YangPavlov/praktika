using carsview;

namespace Models
{
    public partial class Brand{
        public Brand(){
            Models = new HashSet<Model>();
        }

        public int IdBrands { get; set; }
        public string? Name { get; set; }
        public bool? Active { get; set; }

        public virtual ICollection<Model> Models { get; set; }
    }
}

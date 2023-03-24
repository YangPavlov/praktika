using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Models;

namespace carsview.Models
{
    public partial class ModelAndBrandContext : DbContext
    {
        public static ModelAndBrandContext _context;
        public ModelAndBrandContext(){
        }

        public ModelAndBrandContext(DbContextOptions<ModelAndBrandContext> options) : base(options){
        }

        public static ModelAndBrandContext GetContext(){
            return _context == null ? new ModelAndBrandContext() : _context;
        }
        public virtual DbSet<Brand> Brand { get; set; } = null!;
        public virtual DbSet<Model> Models { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder){
            if (!optionsBuilder.IsConfigured)
                optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=MDBDPW;Username=postgres;Password=root");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder){
            modelBuilder.Entity<Brand>(entity =>{
                entity.HasKey(e => e.IdBrands).HasName("Brand_pkey");
                entity.Property(e => e.IdBrands).ValueGeneratedNever().HasColumnName("Id");
            });

            modelBuilder.Entity<Model>(entity =>{
                entity.HasKey(e => e.IdModels).HasName("Model_pkey");
                entity.Property(e => e.IdModels).ValueGeneratedNever().HasColumnName("Id");
                entity.Property(e => e.BrandId).HasColumnName("BrandID");
                entity.HasOne(d => d.Brand).WithMany(p => p.Models).HasForeignKey(d => d.BrandId).HasConstraintName("brand_fkey");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

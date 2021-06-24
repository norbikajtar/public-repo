using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DataLayer
{
  public partial class DatabaseContext : DbContext
  {
    public DatabaseContext()
        : base("name=DatabaseContext")
    {
    }

    public virtual DbSet<Company> Companies { get; set; }
    public virtual DbSet<CompanyType> CompanyTypes { get; set; }
    public virtual DbSet<Market> Markets { get; set; }
    public virtual DbSet<NotificationSchedule> NotificationSchedules { get; set; }
    public virtual DbSet<NotificationScheduleRule> NotificationScheduleRules { get; set; }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
      modelBuilder.Entity<Company>()
          .HasMany(e => e.NotificationSchedules)
          .WithRequired(e => e.Company)
          .WillCascadeOnDelete(false);

      modelBuilder.Entity<CompanyType>()
          .HasMany(e => e.Companies)
          .WithRequired(e => e.CompanyType)
          .HasForeignKey(e => e.TypeID)
          .WillCascadeOnDelete(false);

      modelBuilder.Entity<CompanyType>()
          .HasMany(e => e.NotificationScheduleRules)
          .WithRequired(e => e.CompanyType)
          .HasForeignKey(e => e.TypeID)
          .WillCascadeOnDelete(false);

      modelBuilder.Entity<Market>()
          .HasMany(e => e.Companies)
          .WithRequired(e => e.Market)
          .WillCascadeOnDelete(false);

      modelBuilder.Entity<Market>()
          .HasMany(e => e.NotificationScheduleRules)
          .WithRequired(e => e.Market)
          .WillCascadeOnDelete(false);
    }
  }
}

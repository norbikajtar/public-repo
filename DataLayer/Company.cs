namespace DataLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Company")]
    public partial class Company
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Company()
        {
            NotificationSchedules = new HashSet<NotificationSchedule>();
        }

        public Guid ID { get; set; }

        [Required]
        public string Name { get; set; }

        public int Number { get; set; }

        public int TypeID { get; set; }

        public int MarketID { get; set; }

        public virtual CompanyType CompanyType { get; set; }

        public virtual Market Market { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NotificationSchedule> NotificationSchedules { get; set; }
    }
}

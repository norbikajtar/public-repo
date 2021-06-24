namespace DataLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NotificationScheduleRule")]
    public partial class NotificationScheduleRule
    {
        public int ID { get; set; }

        public int MarketID { get; set; }

        public int TypeID { get; set; }

        [Required]
        public string Occurences { get; set; }

        public virtual CompanyType CompanyType { get; set; }

        public virtual Market Market { get; set; }
    }
}

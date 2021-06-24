namespace DataLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NotificationSchedule")]
    public partial class NotificationSchedule
    {
        public int ID { get; set; }

        public Guid CompanyID { get; set; }

        public int Notification { get; set; }

        public DateTime SendDate { get; set; }

        public virtual Company Company { get; set; }
    }
}

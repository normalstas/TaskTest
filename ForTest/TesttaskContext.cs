using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ForTest;

public partial class TesttaskContext : DbContext
{
    public TesttaskContext()
    {
    }

    public TesttaskContext(DbContextOptions<TesttaskContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Tabletask> Tabletasks { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost; Database=testtask; Trusted_Connection=True; MultipleActiveResultSets=true; TrustServerCertificate=true;encrypt=false");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Tabletask>(entity =>
        {
            entity.ToTable("tabletask");

            entity.Property(e => e.Name).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

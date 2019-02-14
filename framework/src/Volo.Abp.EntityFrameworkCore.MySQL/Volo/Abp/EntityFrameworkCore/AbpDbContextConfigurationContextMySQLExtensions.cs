using JetBrains.Annotations;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System;
using Volo.Abp.EntityFrameworkCore.DependencyInjection;

namespace Volo.Abp.EntityFrameworkCore
{
    public static class AbpDbContextConfigurationContextMySQLExtensions
    {
        public static DbContextOptionsBuilder UseMySQL(
           [NotNull] this AbpDbContextConfigurationContext context,
           [CanBeNull] Action<MySqlDbContextOptionsBuilder> mySQLOptionsAction = null)
        {
            if (context.ExistingConnection != null)
            {
                return context.DbContextOptions.UseMySql(context.ExistingConnection, mySQLOptionsAction);
            }
            else
            {
                return context.DbContextOptions.UseMySql(context.ConnectionString, mySQLOptionsAction);
            }
        }
    }
}

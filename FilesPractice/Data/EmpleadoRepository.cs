using FilesPractice.interfaces;
using FilesPractice.poco;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace FilesPractice.Data
{
    public class EmpleadoRepository : IEmpleadoRepository
    {
        private RAFContext context;
        private readonly int SIZE = 228;

        public EmpleadoRepository()
        {
            context = new RAFContext("Empleados", SIZE);
        }

        public void Create(Empleado t)
        {
            context.Create<Empleado>(t);
        }

        public bool Delete(Empleado t)
        {
            return context.Delete(t.id);
        }

        public IEnumerable<Empleado> Find(Expression<Func<Empleado, bool>> where)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Empleado> GetAll()
        {
           return context.GetAll<Empleado>();
        }

        public int Update(Empleado t)
        {
            return context.Update<Empleado>(t);
        }
    }
}

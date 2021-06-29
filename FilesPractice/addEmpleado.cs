using FilesPractice.Data;
using FilesPractice.poco;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FilesPractice
{
    public partial class addEmpleado : Form
    {
        private EmpleadoRepository empleadoRepository;
        public bool update;
        public addEmpleado()
        {
            InitializeComponent();
            empleadoRepository = new EmpleadoRepository();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string nombre = txtName.Text;
            string apellido = txtApellido.Text;
            string cedula = txtCedula.Text;
            string telefono = txtTelefono.Text;

            if (update == true)
            {
                //
            }

            Empleado emple = new Empleado
            {
                nombre = nombre,
                apellido = apellido,
                cedula = cedula,
                telefono = telefono,            
            };

            empleadoRepository.Create(emple);

            this.Dispose();
        }
    }
}

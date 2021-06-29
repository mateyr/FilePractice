using FilesPractice.Data;
using FilesPractice.poco;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FilesPractice
{
    public partial class EmpleadosView : Form
    {
        private EmpleadoRepository  empleadoRepository;
        List<Empleado> empleados = new List<Empleado>();

        static StreamReader r = new StreamReader("resources/EmpleadosData.json");
        public static string  jsonString = r.ReadToEnd();
        

        public EmpleadosView()
        {
            InitializeComponent();
            empleadoRepository = new EmpleadoRepository();
            empleados = JsonConvert.DeserializeObject<List<Empleado>>(jsonString);
            dgvEmpleados.DataSource = empleados;
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            addEmpleado addEmpleado = new addEmpleado();
            addEmpleado.ShowDialog();
            dgvEmpleados.DataSource = empleadoRepository.GetAll();
        }
    }
}

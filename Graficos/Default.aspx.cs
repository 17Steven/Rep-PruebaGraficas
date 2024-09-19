using System;
using System.Collections.Generic;
using System.Web.UI;
using Newtonsoft.Json;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var facturas = GetFacturas();

            // Convertimos los datos a JSON
            var facturasJson = JsonConvert.SerializeObject(facturas);

            // Asignamos los datos serializados a un control del lado del servidor que el cliente puede leer
            FacturasData.Value = facturasJson;
        }
    }
    private List<Factura> GetFacturas()
    {
        // Aquí obtienes tus datos (puede ser desde una base de datos)
        return new List<Factura>
        {
            new Factura { Producto = "Producto A", Cantidad = 10, Precio = 200 },
            new Factura { Producto = "Producto B", Cantidad = 5, Precio = 100 },
            new Factura { Producto = "Producto C", Cantidad = 8, Precio = 300 }
        };
    }
}
public class Factura
{
    public string Producto { get; set; }
    public int Cantidad { get; set; }
    public decimal Precio { get; set; }
}
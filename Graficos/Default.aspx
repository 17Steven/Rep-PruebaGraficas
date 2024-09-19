<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <h2>Reporte de Ventas</h2>
        <div class="row">
            <div class="col-md-4" style="border-radius:20px;">
                <div id="chart_div" style="width: 100%; height: 100%;"></div>
            </div>
            <div class="col-md-4">
                <div id="piechart_div" style="width: 100%; height: 100%;"></div>
            </div>
            <div class="col-md-4">
                <div id="curvechart_div" style="width: 100%; height: 100%;"></div>
            </div>
        </div>
    </div>
    <!-- Hidden field donde los datos JSON se almacenan desde el backend -->
    <asp:HiddenField ID="FacturasData" runat="server" />

    <script type="text/javascript">
        // Cargar Google Charts
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            // Obtenemos los datos del HiddenField
            var facturasJson = document.getElementById('<%= FacturasData.ClientID %>').value;
            var facturas = JSON.parse(facturasJson); // Parseamos el JSON para obtener los datos

            // Preparamos los datos para Google Charts
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Producto');
            data.addColumn('number', 'Cantidad');

            facturas.forEach(function (factura) {
                data.addRow([factura.Producto, factura.Cantidad]);
            });

            // Opciones del gráfico
            var options = {
                title: 'Cantidad de productos vendidos',
                hAxis: { title: 'Producto' },
                vAxis: { title: 'Cantidad' },
                legend: { position: 'none' }
            };

            // Dibujamos el gráfico en el div con id "chart_div"
            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }

        google.charts.setOnLoadCallback(drawCharts);

        function drawCharts() {
            // Obtenemos los datos del HiddenField
            var facturasJson = document.getElementById('<%= FacturasData.ClientID %>').value;
            var facturas = JSON.parse(facturasJson);

            // Preparamos los datos para Google Charts
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Producto');
            data.addColumn('number', 'Cantidad');

            facturas.forEach(function (factura) {
                data.addRow([factura.Producto, factura.Cantidad]);
            });

            // Opciones para el gráfico circular
            var pieOptions = {
                title: 'Porcentaje de productos vendidos',
                is3D: false,
                fill:"#f8f8f8"
                
            };

            // Opciones para el gráfico de líneas curvas
            var curveOptions = {
                title: 'Cantidad de productos vendidos a lo largo del tiempo',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

            // Dibujar el gráfico circular
            var pieChart = new google.visualization.PieChart(document.getElementById('piechart_div'));
            pieChart.draw(data, pieOptions);

            // Dibujar el gráfico de líneas curvas
            var curveChart = new google.visualization.LineChart(document.getElementById('curvechart_div'));
            curveChart.draw(data, curveOptions);
        }
    </script>

</asp:Content>

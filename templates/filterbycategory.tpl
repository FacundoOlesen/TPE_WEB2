{include file="header.tpl"}

<h1>Productos por <span class="highlight"> categoría</span></h1>
<table class='table table-striped'>
    <th>Categoría</th>

    {foreach from=$categories item=$category}
        <tr>
            <td> <a href="category/{$category->nombre_categoria}"> {$category->nombre_categoria} </a> </td>
        </tr>
    {/foreach}
</table>

<table class='table table-striped'>
    <th>Nombre </th>
    <th>Precio</th>
    <th>Talle</th>
    <th>Detalle</th>
    <th>Categoría</th>
    {foreach from=$productsbycategory item=$productbycategory}
        
        <tr>
            <td> {$productbycategory->nombre} </td>
            <td> {$productbycategory->precio} </td>
            <td> {$productbycategory->talle} </td>
            <td> <a href='details/{$productbycategory->id}' type='button' class='btn btn-warning'>Detalles</a> </td>
            <td> {$productbycategory->id_categoria_fk} </td>
            </tr>
        {/foreach}
    </table>


    

 
{include file="footer.tpl"}

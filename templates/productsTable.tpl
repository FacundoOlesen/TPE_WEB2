{include file="header.tpl"}

{include file="formproducts.tpl"}

<table class='table table-striped'>
    <th>Nombre </th>
    <th>Precio</th>
    <th>Talle</th>
    {if isset($smarty.session.USER_ID)}
        <th>Descripción</th>
    {/if}
    <th>Imagen</th>
    <th>Categoría</th>
    <th>Detalles</th>

    {if isset($smarty.session.USER_ID)}
        <th>Modificar</th>
        <th>Borrar</th>
    {/if}
    {foreach from=$products item=$product}
        <tr>
            <td> {$product->nombre} </td>
            <td> {$product->precio} </td>
            <td> {$product->talle} </td>
            {if isset($smarty.session.USER_ID)}
                <td> {$product->descripcion} </td>
            {/if}
            {if $product->imagen == NULL}
                <td> Sin imagen disponible </td>
            {else}
                <td> <img style="width: 85px; height: 85px" src="{$product->imagen}" </td>
                {/if}
            <td> {$product->id_categoria_fk} </td>
            <td><a href='details/{$product->id}' type='button' class='btn btn-warning'>Detalles</a></td>
            {if isset($smarty.session.USER_ID)}
                <td><a href='modifyproduct/{$product->id}' type='button' class='btn btn-info'> Modificar </a> </td>
                <td><a href='delete/{$product->id}' type='button' class='btn btn-danger ml-auto'> Borrar </a> </td>
            {/if}
        </tr>
    {/foreach}

</table>
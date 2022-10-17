{include file="header.tpl"}

{include file="formcategories.tpl"}

<table class='table table-striped'>
<th>Categoría</th>
{if isset($smarty.session.USER_ID)}
    <th>Modificar</th>
    <th>Borrar</th>
    {/if}
    {foreach from=$categories item=$category}
        <tr>
            <td> <a  href="category/{$category->nombre_categoria}">  {$category->nombre_categoria} </a> </td>
            {if isset($smarty.session.USER_ID)}
            <td><a href='modifycategorie/{$category->id_categoria}' type='button' class='btn btn-info'> Modificar </a> </td>
            
            <td><a href='deletecategorie/{$category->id_categoria}' type='button' class='btn btn-danger ml-auto'> Borrar </a> </td>
        {/if}
        </tr>
    {/foreach}
</table>

{include file="footer.tpl"}

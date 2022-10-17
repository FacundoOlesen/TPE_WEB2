{include file="header.tpl"}

<h1> Edite el producto: <span class="highlight"> {$product->nombre} </span> </h1>
<form action="modifyproduct/{$product->id}" method="POST" class="form-group">
<input type="text" required class="form-control" name="editname" placeholder="Editar nombre" value="{$product->nombre}">
<input type="text" required class="form-control" name="editprice" placeholder="Editar precio" value="{$product->precio}">
<input type="text" required class="form-control" name="editsize" placeholder="Editar talle" value="{$product->talle}">
<input type="text" required class="form-control" name="description" placeholder="Editar descripción" value="{$product->descripcion}">

<h3> Elija la nueva categoría  </h3>
<h3> Categoría actual: <span class="highlight"> {$product->id_categoria_fk} </span></h3>
<select name="category">
{foreach from=$categories item=$r}
    <option name="category">{$r->nombre_categoria} </option>
{/foreach}
</select>
<br>
<br>
<a href="products" class="btn btn-danger">Cancelar</a>
<input type="submit" class="btn btn-primary" value="Editar">

</form>

{include file="footer.tpl"}
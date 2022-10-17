{include file="header.tpl"}

<h1> Edite la categoría: <span class="highlight"> {$category->nombre_categoria} </span> </h1>
<form action="modifycategorie/{$category->id_categoria}" method="POST" class="form-group">
<input type="text" required  class="form-control" name="category" placeholder="Editar categoría"  value="{$category->nombre_categoria} ">
<a href="categories" class="btn btn-danger">Cancelar</a>
<input type="submit"  class="btn btn-primary" value="Editar">
</form>
{include file="footer.tpl"}
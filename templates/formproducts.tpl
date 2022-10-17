               
 {if isset($smarty.session.USER_ID)}
    <h1 >  Administra tus<span class="highlight"> Productos </span></h1>
    {else}
        <h1 > <span class="highlight">Productos  </span>disponibles</h1>
    {/if}
    {if isset($smarty.session.USER_ID)}
    <form action="insertproduct" method="POST"  class="form-group" enctype="multipart/form-data" >
    
        
        <input type="text" class="form-control"  name="name" placeholder="Nombre de la prenda">
        <input type="text" class="form-control" name="price"  placeholder="Precio" >
        <input type="text" class="form-control"  name="size" placeholder="Talle">
        <input type="text" class="form-control"  name="description" placeholder="Descripción del producto">
        <br>
        <h3> Elije la categoria: </h3>
        <select name="category">
        {foreach from=$category item=$r}
            <option name="category">{$r->nombre_categoria}</option>
        {/foreach}
        </select>
        <br>
        <br>
        <h6> Subir imagen (Opcional) </h6>
        <input type="file" name="input_name">
        
        <input type="submit" class="btn btn-primary" value="Agregar">
    </form>
{/if}
</body>
</html>


    {if isset($smarty.session.USER_ID)}
        <h1 >  Administra tus<span class="highlight"> Categorías </span></h1>
        {else}
            <h1 > <span class="highlight">Categorías </span>disponibles</h1>
        {/if}
        {if isset($smarty.session.USER_ID)}

    <form action="insertcategorie" method="POST" class="form-group">
        <input type="text"  class="form-control" name="category" placeholder="Nombre de la categoría">
        <input type="submit" class="btn btn-primary" value="Agregar">
    </form>
{/if}
 
</body>
</html>

{include file="header.tpl"}
{if $error ==1}
<div class="alert alert-danger" role="alert">
<strong> Error!</strong> Hay campos sin completar.
</div>
<a class="btn btn-primary" aria-current="page" href="/Tienda-Ropa/products">Volver a productos</a>
{/if}

{if $error ==2}
    <div class="alert alert-danger" role="alert">
    <strong> Error!</strong> Hay campos sin completar.
    </div>
    <a class="btn btn-primary" aria-current="page" href="/Tienda-Ropa/categories">Volver a categorías</a>
    {/if}

{if $error == 3}
    <div class="alert alert-danger" role="alert">
<strong> Error!</strong> Estas queriendo borrar una categoría que está siendo utilizada por un producto.
Para eliminarla primero debes sacarsela al producto.
</div>
<a class="btn btn-primary" aria-current="page" href="/Tienda-Ropa/categories">Volver a categorías</a>

{/if}

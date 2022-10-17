{include file="header.tpl"}
<h1> Viendo detalles del producto: <span class="highlight"> {$products->nombre} </span> </h1>

<div class="card" style="width: 18rem;">
{if $products->imagen != NULL}  
<img class="card-img-top" src="{$products->imagen}" alt="Acá iria la imagen">
{/if}
  <div class="card-body">
    <h5 class="card-title">{$products->nombre}</h5>
    <p class="card-text"><strong> <span class="highlight"> Precio:</span> </strong>{$products->precio}</p>
    <p class="card-text"><strong><span class="highlight">Talle: </span></strong>{$products->talle}</p>
    <p class="card-text"><strong><span class="highlight">Categoría:</span></strong> {$products->id_categoria_fk}</p>
    <p class="card-text"><strong><span class="highlight">Descripcion:</span></strong> {$products->descripcion}</p>
    <a href="products" class="btn btn-primary">Volver</a>
  </div>
</div>
{include file="footer.tpl"}

{include file="header.tpl"}
<h1 class="hola"> Bienvenido a TID Store</h1>
<div class="card-group" style="margin-top:40px">
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Productos</h5>
      {if !isset($smarty.session.USER_ID)}
      <p class="card-text">Para ver nuestro productos disponibles hace click acá!</p>
      <a href="products" class="btn btn-primary">Ver productos</a>
      {else}
        <p class="card-text">Para administrar los productos s hace click acá!</p>
      <a href="products" class="btn btn-primary">Administar productos</a>
      {/if}
    </div>
  </div>
  <div class="card">
    
    <div class="card-body">
      <h5 class="card-title">Categorías</h5>
      {if !isset($smarty.session.USER_ID)}
      <p class="card-text">Para ver nuestras categorías disponibles hace click acá!</p>
      <a href="categories" class="btn btn-primary">Ver productos</a>
      {else}
        <p class="card-text">Para administrar las categorías hace click acá!</p>
        <a href="categories" class="btn btn-primary">Administar productos</a>
        {/if}
    </div>
  </div>


{include file="footer.tpl"}

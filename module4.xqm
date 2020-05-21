(:~
 : This module contains some basic examples for RESTXQ annotations.
 : @author BaseX Team
 :)
module namespace page = 'http://basex.org/examples/web-page';

(:~
 : Generates a welcome page.
 : @return HTML page
 :)
declare
  %rest:GET
  %rest:path('/add')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:tvshows(
) as element(html) {
  <html>
    <head>
      <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
          <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
          <title>Listado de series </title>
          <meta name="author" content="Mónica Ilenia Tardón Vera"/>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"></link>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <link rel="stylesheet" type='text/css' href="https://use.fontawesome.com/releases/v5.1.1/css/all.css"
              integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous"></link>
          <script src="https://www.gstatic.com/firebasejs/7.6.2/firebase-app.js"></script>
          <link rel='stylesheet' type='text/css' href='static/style.css'/>
    </head>
    <body>
    <div class="container-fluid bg-danger">
    <header class="text-white bg-danger">
                <div class="row align-items-center">
                    <div class="col-lg-12 text-center">
                        <h1>Añade una serie a la base de datos</h1>
                    </div>
                </div>
        </header>
        <div class="row bg-danger">
        <div class="col-lg-2 bg-danger">
        <ul>
            <br/>
        	<li><a href="/series">Home</a></li>
        	<li><a href="/find">Buscar</a></li>
        	<li><a href="/add">Añadir</a></li>
            <li><a href="/mod">Modificar</a></li>
            <li><a href="/delete">Eliminar</a></li>
        </ul>
        </div>
        <div class="col-sm-10 text-center text-white bg-dark">
                      <br/>
                      <br/>
                        <form class="" action="/addcontent" method="POST">
                              <div class="row justify-content-center">
                                <div class="col-4 text-left"><label for="name"><h3>Titulo de la Serie:</h3></label></div>
                                <div class="col-4"><input type="text" id="name" name="name" class="form-control mb-4" placeholder="Nombre de la serie"/>
                                </div>
                              </div>
                              <br/>
                              <div class="row justify-content-center">
                              <div class="col-4 text-left"><label for="ano"><h3>Año de estreno:</h3></label></div>
                              <div class="col-4"><input type="text" id="año" name="ano" class="form-control mb-4" placeholder="año estreno"/>
                              </div>
                              </div>
                              <br/>
                              <div class="row justify-content-center">
                                <div class="col-4 text-left"><label for="sinopsis"><h3>Sinopsis:</h3></label></div>
                                <div class="col-4"><textarea class="form-control rounded-0" id="sinopsis" name="sinopsis" rows="3"
                                    placeholder="Sinopsis"></textarea></div>
                              </div>
                              <br/>
                              <br/>
                              <div class="row justify-content-center">
                                  <div class="col-4 text-left"><label for="poster"><h3>Link imagen del Poster:</h3></label></div>
                                   <div class="col-4"><input type="text" id="name" name="poster" class="form-control mb-4" placeholder="Link"/>
                                   </div>
                              </div>
                              <br/>
                              <button type="submit" class="btn btn-secondary"><i class="fas fa-plus-circle"></i> Añadir a la base de datos</button>
                            </form>
                      <br/>
        </div>
        </div>
    <footer class="text-white bg-danger">
            <div class="footer-copyright text-center py-3">
                <p> © 2020 Todos los derechos reservados.</p>
            </div>
    </footer>
    </div>
    </body>
  </html>
};

declare
  %rest:POST
  %rest:path('/addcontent')
  %rest:form-param("name","{$name}","(no name)")
  %rest:form-param("ano","{$ano}","(no ano)")
  %rest:form-param("sinopsis","{$sinopsis}","(no sinopsis)")
  %rest:form-param("poster","{$poster}","(no poster)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
updating function page:tvshows(
   $name as xs:string,
   $ano as xs:string,
   $sinopsis as xs:string,
   $poster as xs:string)
  {update:output(web:redirect('/series')),
    for $series in doc("TVShows")//series
    return insert node
    <serie>
            <name>{$name}</name>
            <año>{$ano}</año>
            <sinopsis>{$sinopsis}</sinopsis>
            <poster>{$poster}</poster>
    </serie>
    as first into $series
  };

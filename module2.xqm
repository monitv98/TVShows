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
  %rest:POST
  %rest:path('/details')
  %rest:form-param("name","{$name}","(no name)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:tvshows(
   $name as xs:string
) as element(html) {
  <html>
    <head>
      <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
                <title>detalles de la serie "{$name}"</title>
                <meta name="author" content="Mónica Ilenia Tardón Vera"/>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css"
                    integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous"/>
                <script src="https://www.gstatic.com/firebasejs/7.6.2/firebase-app.js"></script>
                <link rel='stylesheet' type='text/css' href='static/style.css'/>
    </head>
    <body>
    <div class="container-fluid bg-danger">
    <header class="text-white bg-danger">
                      <div class="container">
                          <div class="row align-items-center">
                              <div class="col-lg-12 text-center">
                                  <h1>Detalles de la serie</h1>
                              </div>
                          </div>
                      </div>
    </header>
                  <div>
                  <div class="row">
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
                  <div class="col-lg-10 text-center text-white bg-dark">

                    <br/>
                    <br/>
            {
              for $serie in doc("TVShows")/series/serie
              where $serie/name/text() = $name
              return <div class="row">
              <div class="col-lg-6 text-center">
              <br/>
              <br/>
              <h1> Titulo: {$serie/name/text()}</h1>
              <br/>
              <br/>
              <h3>Año de estreno: {$serie/año/text()} </h3>
              <br/>
              <h5>Sinopsis: {$serie/sinopsis/text()} </h5>
              <br/>
              </div>
              <div class="col-lg-6">
              <img src='{$serie/poster/text()}' class="img-thumbnail" alt="POSTER"/>
              </div>
              </div>
            }
            <br/>
    </div>
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


/**
 * Module dependencies.
 */

var express = require('express')
  , routes = require('./routes')

var app = module.exports = express.createServer();

// Configuration

app.configure(function(){
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function(){
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true })); 
});

app.configure('production', function(){
  app.use(express.errorHandler()); 
});




// Routes

app.get('/', routes.index);

//load andrew in the c
app.get("/andrew", 
    function(req, res) { require("./routes/andrew").andrew( req, res );  }
);
    
//user routes
app.get( "/users", function( req, res ) { require("./routes/users").index( req, res ); } );
    
    
    
    
    
    
    

app.listen(1337);
console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);

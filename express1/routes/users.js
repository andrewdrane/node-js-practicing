/** users "controller"
 * 
 * 
 * 
 */

var models = require( '../models/user' )

//index of users
//@TODO - make this a paginated search
exports.index = function( req, res ) {
    data = {}; //handy dandy way to keep track of some data
    
    //find the user by id
    models.User.find(1)
    .on('success', function(user){
        data.myUser = u;
    });
      
    
    res.render('index', { 
        view: __dirname + '/views/andrew/andrew',
        dirname: __dirname,
        title: 'Got User ' + data.myUser.name
    })
}

//get a specific user
exports.user = function(){
    
    
}


//@TODO
// functions
//  -- add
//  -- delete
//  -- login (SESSIONS ZOMFG!)
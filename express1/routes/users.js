/** users "controller"
 * 
 * 
 * 
 */

var models = require( '../models/user' )

//index of users
//@TODO - make this a paginated search
exports.index = function( req, res ) {
    var data = {}; //handy dandy way to keep track of some data
    
    //find the user by id. THIS IS ASYNCHRONOUS!!!!!!!!!!!!!! Make sure you aren't thinking sequentially :P
    models.User.find(1).on('success', function(user){
        res.render('index', { 
            view: __dirname + '/views/andrew/andrew',
            dirname: __dirname,
            title: 'Got User ' + user.name
        })
    });    
}

//get a specific user
exports.view = function( req, res  ){
    //require( '../models/user' )
    console.log( req.params )
   models.User.find( parseInt( req.params.id ) )
    .on('success', function(user){
        //deal with empty. I guess an empty result still counts as success?
        if( !user ) {
            user = { name: 'Could not find that user. What the hell kind of ID are you putting in, are you drunk? ' }
        }
        
        res.render('index', { 
            view: __dirname + '/views/users/view',
            dirname: __dirname,
            title: 'Got User ' + user.name,
            userName: user.name
        })
    })
    .on('failure', function(error){
        res.render('index', { 
            view: __dirname + '/views/users/view',
            dirname: __dirname,
            title: 'Could not find that user. What the hell kind of ID are you putting in, are you drunk? ',
            userName: user.name
        })
    })
    ;   
}


//@TODO
// functions
//  -- add
//  -- delete
//  -- login (SESSIONS ZOMFG!)
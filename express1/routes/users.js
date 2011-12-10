/** users "controller"
 * 
 * 
 * 
 */

var models = require( '../models/user' )

//index of users
exports.index = function( req, res ) {
    data = {}; //handy dandy way to keep track of some data
    //find the user by id
    models.User.find(1)
    .on('success', function(user){
        data.myUser = u;
    });
//        
        console.log('here');
        //console.log(myUser);
//    
//    
//    
//    
//    
//    
    
    
    res.render('index', { 
        view: __dirname + '/views/andrew/andrew',
        dirname: __dirname,
        title: 'Users function',
        mcValue: "Wow - it's just like loading a controller!!"
    })
}
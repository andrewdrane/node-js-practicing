/** The ANDREW function, very important
 * 
 * 
 */
exports.andrew = function(req, res){
  res.render('andrew', { 
    view: __dirname + '/views/andrew/andrew',
    dirname: __dirname,
    title: 'WEEEE',
    mcValue: "Wow - it's just like loading a controller!!"
    })
};


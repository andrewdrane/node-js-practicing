/** The ANDREW function, very important
 * 
 * 
 */
exports.andrew = function(req, res){
  res.render('andrew', { 
    title: 'Express',
    res: res,
    mcValue: "Hi, this is mcvalue!"
    })
};

//put this in another file somewhere so we don"t double/tripple load it etc.
//lets get some sequelize going on in here
var Sequelize = require("sequelize")
//require("sequelize")

var sequelize = new Sequelize("node_1", "node", "node123", {
  host: "localhost"
  , logging: false
  //, port: 12345
})




/** Model for user - creates an ORM layer model http://sequelizejs.com/#installation
 * 
 * 
 * 
 * var Task = sequelize.define("Task", {
  title: Sequelize.STRING,
  description: Sequelize.TEXT,
  deadline: Sequelize.DATE
})
 * 
 * 
 */

//setup
var User = sequelize.define("User", {
    name: Sequelize.STRING,
    created: Sequelize.DATE
})

//export it to anyone requesting this module!
exports.User = User;
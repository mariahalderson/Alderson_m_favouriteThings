var express = require('express');
var router = express.Router();
var connect = require('../utils/sqlConnect');

/* GET home page. */
router.get('/', function(req, res, next) {
  //call db
  connect.query(`SELECT name, avatar FROM hero`, (err, result) => {
    if(err){
      throw err;
      console.log(err);
    }else{
      console.log(result);
      // res.render('index', { avatars: result });
    }
  });
});

module.exports = router;

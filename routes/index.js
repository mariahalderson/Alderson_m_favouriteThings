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
      res.render('index', { avatars: result });
    }
  });
});

router.get('/:hero', function(req, res, next) {
  //call db for individual data
  connect.query(`SELECT * FROM hero WHERE name = "${req.params.hero}"`, (err, result) => {
    if(err){
      throw err;
      console.log(err);
    }else{
      res.render('bio', { biodata: result[0] });
    }
  });
});

module.exports = router;

var express = require('express');
var router = express.Router();
var connect = require('../utils/sqlConnect');
var mysql      = require('mysql');
var async      = require('async');

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

router.get('/:thing', function(req, res, next) {
  //call db for individual data
  // ;
  // connect.query(`SELECT * FROM tbl_favourites f, tbl_images i WHERE  f.id = "${req.params.thing}" AND i.thing_id="${req.params.thing}"`, (err, result) => {
  // // connect.query(`SELECT * FROM tbl_favourites WHERE id = "${req.params.thing}"`, (err, result) => {
  //   if(err){
  //     throw err;
  //     console.log(err);
  //   }else{
  //     console.log(result);
  //     res.render('info', { thing: result[0] });
  //   }
  // });
  // var pool = mysql.createPool(credentials);
   var query1 = `SELECT * FROM tbl_favourites WHERE id = '${req.params.thing}'`;
   var query2 = `SELECT * FROM tbl_images WHERE thing_id = '${req.params.thing}'`;

   var return_data = {};

   async.parallel([
      function(parallel_done) {
          connect.query(query1, {}, function(err, results) {
              if (err) return parallel_done(err);
              return_data.thing = results;
              parallel_done();
          });
      },
      function(parallel_done) {
          connect.query(query2, {}, function(err, results) {
              if (err) return parallel_done(err);
              return_data.images = results;
              parallel_done();
          });
      }
   ], function(err) {
        if (err) console.log(err);
        // pool.end();
        console.log(return_data);
        // res.send(return_data);
        res.render('info', { thing: return_data.thing[0], images: return_data.images });
   });
});

module.exports = router;

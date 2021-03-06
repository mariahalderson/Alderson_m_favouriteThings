var express = require('express');
var router = express.Router();
var connect = require('../utils/sqlConnect');
var mysql      = require('mysql');
var async      = require('async');

/* GET home page. */
router.get('/', function(req, res, next) {
  //call db
  connect.query(`SELECT * FROM tbl_favourites`, (err, result) => {
    if(err){
      throw err;
      console.log(err);
    }else{
      res.render('index', { things: result });
    }
  });
});

router.get('/:thing', function(req, res, next) {
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
        res.render('info', { thing: return_data.thing[0], images: return_data.images });
   });
});

module.exports = router;

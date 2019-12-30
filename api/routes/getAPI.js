var express = require("express");
var router = express.Router();
var pool = require('../db')


router.get("/all", function(req, res, next) {

  pool.query(`SELECT * FROM movies_ratings 
              ORDER BY id ASC`, 
            (q_err, q_res) => {
                  res.json(q_res.rows)
  })
});


router.get("/rand", function(req, res, next) {
  
  pool.query(`SELECT * FROM movies_ratings 
              ORDER BY random()`, 
            (q_err, q_res) => {
                  res.json(q_res.rows)
  })
});

router.put('/send', (req, res, next) => {
  const values = [ req.body.id,
                   req.body.rating
                  ]
       console.log(values)
       //console.log(res)
  pool.query(`UPDATE movies_ratings SET rating= $2
              WHERE id = $1`, values,
              (q_err, q_res) => {
                //console.log(q_res)
                res.json(q_res.rows);
                //console.log(q_err)
        })
})

module.exports = router;
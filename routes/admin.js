var express = require('express');
var router = express.Router();
var pool=require("./pool")
var upload=require("./multer")
var localstorage=require("node-localstorage").LocalStorage
var localStorage=new localstorage("./scratch")

router.get('/adminregistration', function(req, res, next) {
  res.render('adminregistration',{message:""});
});

router.post("/registrationsuccessfull",upload.single("picture"),function(req,res,next){
  pool.query("select * from adminregistration where emailid=?",[req.body.email],function(error,result){
     if(error){
       res.render('adminregistration',{message:"server error"})
     }else{
       if(result.length==0){
        pool.query("insert into adminregistration(name,emailid,password,picture) value(?,?,?,?)",[req.body.username,req.body.email,req.body.pwd,req.file.originalname],function(error,result){
             if(error){
              res.render('adminregistration',{message:"server error"})
             } else{
               res.redirect("/admin/adminlogin")
             }
        })
       }else{
         res.render('adminregistration',{message:"This email is already registered"})
       }
     }
    })
})

/* GET users listing. */
router.get('/adminlogin', function(req, res, next) {
    res.render('adminlogin',{message:""});
  });

  router.get('/adminlogout', function(req, res, next) {
    localStorage.clear()
    res.render('adminlogin',{message:""});
  });

router.post("/dashboard",function(req,res,next){
  // pool.query("select * from admininfo where emailid=? and password=?",[req.body.email,req.body.pwd],function(error,result){
  //   if(error){
  //      res.render("adminlogin",{message:"Server error..."})
  //   }else{
  //     if(result.length==1){
  //       localStorage.setItem("ADMIN",JSON.stringify(result))
  //       res.render("dashboard",{admin:result[0]})
  //     }else{
  //       res.render("adminlogin",{message:"Invalid emailid/password..."})
  //     }
  //   }
  // })
  pool.query("select * from adminregistration where emailid=?",[req.body.email],function(error,result){
    if(error){
      res.render("adminlogin",{message:"server error"})
    }else{
      if(result.length==1){
         pool.query("select * from adminregistration where emailid=? and password=?",[req.body.email,req.body.pwd],function(error,result){
           if(error){
             res.render("adminlogin",{message:"server error"})
           }else{
             if(result.length==1){
              localStorage.setItem("ADMIN",JSON.stringify(result))
               res.render("dashboard",{admin:result[0]})
             }else{
               res.render("adminlogin",{message:"wrong password"})
             }
           }
         })
      }else{
         res.render("adminlogin",{message:"wrong email"})
      }
    }
  })
})

  module.exports=router
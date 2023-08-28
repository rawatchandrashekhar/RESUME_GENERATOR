var express = require('express');
var router = express.Router();
var pool=require("./pool")
var upload=require("./multer")
var localstorage=require("node-localstorage").LocalStorage
var localStorage=new localstorage("./scratch")

//websitestarterpage
router.get("/homepage",function(req,res,next){
    res.render("homepage")
})

//dashboardhomepage
router.get("/dashboardhomepage",function(req,res,next){
    res.render("dashboardhomepage")
})

/* GET users listing. */
router.get('/resumemaking', function(req, res, next) {
    try{
        if(localStorage.getItem("ADMIN")==null){
            res.render("adminlogin",{message:""})
        }else{
            res.render('resumedatauploading',{result:2});
        }
    }catch(e){
        res.render("adminlogin",{message:""})
    }
});

router.get("/updatepicture",function(req,res,next){
    res.render("updatepicture",{picture:req.query.picture,uid:req.query.uid})
})

router.post("/updatepictureresult",upload.single("newpicture"),function(req,res,next){
    pool.query("update resumedata set picture=? where userid=?",[req.file.originalname,req.body.uid],function(error,result){
        if(error){
            res.redirect("/resume/fetchresumedata")
        }else{
            res.redirect("/resume/fetchresumedata")
        }
    })
})

router.get('/showalldatawithmodal', function(req, res, next) {
    try{
        if(localStorage.getItem("ADMIN")==null){
            res.render("adminlogin",{message:""})
        }
    }catch(e){
        res.render("adminlogin",{message:""})
    }
    pool.query("select R.*,(select ST.statename from states ST where ST.stateid=R.stateid) as statename, (select C.cityname from cities C where C.cityid=R.cityid) as cityname, (select U.universityname from universities U where U.universityid=R.universityid) as universityname, (select College.collegename from colleges College where College.collegeid=R.collegeid) as collegename from resumedata R",function(error,result){
        if(error){
            res.render('showalldatawithmodal',{result:[]});
        }else{
            res.render('showalldatawithmodal',{result:result});
        }
    })
});

router.post("/pictureupdatewithmodal",upload.single("newpicture"),function(req,res,next){
    pool.query("update resumedata set picture=? where userid=?",[req.file.originalname,req.body.uid],function(error,result){
        if(error){
            res.redirect("/resume/showalldatawithmodal")
        }else{
            res.redirect("/resume/showalldatawithmodal")
        }
    })
})

router.get('/updatebyid', function(req, res, next) {
    pool.query("select R.*,(select ST.statename from states ST where ST.stateid=R.stateid) as statename, (select C.cityname from cities C where C.cityid=R.cityid) as cityname, (select U.universityname from universities U where U.universityid=R.universityid) as universityname, (select College.collegename from colleges College where College.collegeid=R.collegeid) as collegename from resumedata R where userid=?",[req.query.uid],function(error,result){
        if(error){
            res.render('updatebyids',{result:[]});
        }else{
            res.render('updatebyids',{result:result[0]});
        }
    })
});

router.get('/cvgenerate', function(req, res, next) {
    pool.query("select R.*,(select ST.statename from states ST where ST.stateid=R.stateid) as statename, (select C.cityname from cities C where C.cityid=R.cityid) as cityname, (select U.universityname from universities U where U.universityid=R.universityid) as universityname, (select College.collegename from colleges College where College.collegeid=R.collegeid) as collegename from resumedata R where userid=?",[req.query.uid],function(error,result){
        if(error){
            res.render('cvgenerate',{result:[]});
        }else{
            res.render('cvgenerate',{result:result[0]});
        }
    })
});

router.get('/updateform', function(req, res, next) {
    if(req.query.btn=="Update"){
    var name=req.query.firstname+" "+req.query.lastname
    pool.query("update resumedata set username=?,fathername=?,dateofbirth=?,gender=?,stateid=?,cityid=?,email=?,mobilenumber=?,fulladdress=?,highschoolpercentage=?,highschoolboard=?,highschoolpassingyear=?,highersecondarypercentage=?,highersecondaryboard=?,highersecondarypassingyear=?,graduationpercentage=?,graduationpassingyear=?,universityid=?,collegeid=?,skills=?,otheractivities=? where userid=?",[name,req.query.fathername,req.query.dob,req.query.gender,req.query.state,req.query.city,req.query.email,req.query.mobileno,req.query.useraddress,req.query.highschoolpercentage,req.query.highschoolboard,req.query.highschoolpassingyear,req.query.highersecondarypercentage,req.query.highersecondaryboard,req.query.highersecondarypassingyear,req.query.graduationpercentage,req.query.graduationpassingyear,req.query.university,req.query.college,req.query.skills,req.query.otheractivities,req.query.uid],function(error,result){
            if(error){
                console.log(error)
                res.redirect("/resume/showalldatawithmodal")                    
            }else{
                res.redirect("/resume/showalldatawithmodal")
            }
    })
} else {
pool.query("delete from resumedata where userid=?",[req.query.uid],function(error,result){
    if(error){
        console.log(error)
        res.redirect("/resume/showalldatawithmodal")                    
    }else{
        res.redirect("/resume/showalldatawithmodal")
    }
})
}
});

router.get('/fetchresumedata', function(req, res, next) {
    try{
        if(localStorage.getItem("ADMIN")==null){
            res.render("adminlogin",{message:""})
        }
    }catch(e){
        res.render("adminlogin",{message:""})
    }
    pool.query("select R.*,(select ST.statename from states ST where ST.stateid=R.stateid) as statename, (select C.cityname from cities C where C.cityid=R.cityid) as cityname, (select U.universityname from universities U where U.universityid=R.universityid) as universityname, (select College.collegename from colleges College where College.collegeid=R.collegeid) as collegename from resumedata R",function(error,result){
        if(error){
            res.render('showalldata',{result:[]});
        }else{
            res.render('showalldata',{result:result});
        }
    })
});

router.post("/insertrecord",upload.single("userpicture"),function(req,res){
    console.log("BODY",req.body)
    console.log("BODY",req.file)
    var name=req.body.firstname+" "+req.body.lastname
    pool.query("insert into resumedata(username,fathername,dateofbirth,gender,stateid,cityid,email,mobilenumber,fulladdress,highschoolpercentage,highschoolboard,highschoolpassingyear,highersecondarypercentage,highersecondaryboard,highersecondarypassingyear,graduationpercentage,graduationpassingyear,universityid,collegeid,skills,otheractivities,picture) value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[name,req.body.fathername,req.body.dob,req.body.gender,req.body.state,req.body.city,req.body.email,req.body.mobileno,req.body.useraddress,req.body.highschoolpercentage,req.body.highschoolboard,req.body.highschoolpassingyear,req.body.highersecondarypercentage,req.body.highersecondaryboard,req.body.highersecondarypassingyear,req.body.graduationpercentage,req.body.graduationpassingyear,req.body.university,req.body.college,req.body.skills,req.body.otheractivities,req.file.originalname],function(error,result){
        if(error){
            console.log(error)
            res.render('resumedatauploading',{result:0})
        }else{
            res.render('resumedatauploading',{result:1})
        } 
    })
})

router.get("/fetchallboard",function(req,res){
    pool.query("select * from board where stateid=?",[req.query.stateid],function(error,result){
        if(error){
            console.log(error)
            res.status(500).json([])
        }else{
            console.log(result)
            res.status(200).json(result)
        }
    })
})

router.get("/fetchalluniversities",function(req,res){
    pool.query("select * from universities where stateid=?",[req.query.stateid],function(error,result){
        if(error){
            console.log(error)
            res.status(500).json([])
        }else{
            console.log(result)
            res.status(200).json(result)
        }
    })
})

router.get("/fetchallcolleges",function(req,res){
    pool.query("select * from colleges where universityid=?",[req.query.universityid],function(error,result){
        if(error){
            console.log(error)
            res.status(500).json([])
        }else{
            console.log(result)
            res.status(200).json(result)
        }
    })
})

router.get("/fetchallstates",function(req,res){
    pool.query("select * from states",function(error,result){
        if(error){
            console.log(error)
            res.status(500).json([])
        }else{
            console.log(result)
            res.status(200).json(result)
        }
    })
})

router.get("/fetchallcities",function(req,res){
    pool.query("select * from cities where stateid=?",[req.query.stateid],function(error,result){
        if(error){
            console.log(error)
            res.status(500).json([])
        }else{
            console.log(result)
            res.status(200).json(result)
        }
    })
})

module.exports = router;

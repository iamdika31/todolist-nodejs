const express = require('express');
const path =    require('path');
const moment = require('moment');
const app = express();
const port  = process.env.PORT || 3000;
const bodyParser = require('body-parser');
const con = require('./lib/mysql/connection');

con.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
      if (error) throw error;
      console.log('The solution is: ', results[0].solution);
    });

app.set('views',path.join(__dirname,'views'));
app.set('view engine','ejs');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static("public"));  

app.get('/add', (req,res) =>{
    con.query('select * from urgensi',(err,data) =>{
        res.render('add',{urgensi:data});
    })
});

app.get('/',(req,res) =>{
    let urgensi = '';
    con.query('select * from urgensi',(err,data) =>{
        urgensi = data;
    })
    con.query('select l.*, u.urgensi as urgensi from list_task l join urgensi u on l.urgensi = u.id_urgensi',(err,data) =>{
        res.render('index',{ data_task:data, moment:moment, urgensi:urgensi});
    })
});

app.get('/delete/:id_task',(req,res) => {
     con.query('DELETE FROM list_task where id_task = ?', req.params.id_task,(err) => {
         if(err) throw err;
         res.redirect('/');
     })
});
app.get('/update/:id_task',(req,res) => {
    let join = '';
    con.query('select * from urgensi',(err,result) =>{
        join = result;
    })
    id_task = req.params.id_task
    con.query('select l.*, u.urgensi as nama_urgensi from list_task l join urgensi u on l.urgensi = u.id_urgensi where id_task = ?',req.params.id_task,(err,data) => {
        res.render('form-update', {data, moment, join, id_task});
 //       console.log(data)
    })
});


app.get('/create',(req,res) =>{
    res.redirect('/');
})

app.post('/update-data/:id_task',(req,res) =>{
    const {tanggal,namaTugas,urgensi} = req.body;
    const query = 'UPDATE list_task SET tanggal = ?, namaTugas =?, urgensi=? WHERE id_task=?';
    con.query(query,[tanggal,namaTugas,parseInt(urgensi),req.params.id_task], (err) => {
        if(err) throw err;
        res.redirect('/')
    })
});
app.post('/create',(req,res) =>{
    const {tanggal,namaTugas,urgensi} = req.body;
    con.query('INSERT into list_task set ?',{tanggal,namaTugas,urgensi},(err) =>
    {
        if(err) throw err;
        res.redirect('/');
    });
});


app.listen(port,()=>{
    console.log('berjalan pada :' +port)
});

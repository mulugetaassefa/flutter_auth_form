const express =require('express');
const bodyParser =require('body-parser');
const cors   =require('cors');
const router =require('./routes/user.route');

const app=express();
const port=6000 || process.env.PORT
app.use(cors());

app.use(express.json())
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())
app.use(router);
app.use('/' , (req,res) => {
    res.send("home page");
});
const mongoose =require('mongoose');
mongoose.connect("mongodb://localhost:27017/myDB", console.log('database is connected'));
// first rout


app.listen(port,() =>{ console.log(`server is running on port ${port}`) })
const express = require('express')
const User = require('../models/user.model')
const router = express.Router()



router.post('/signup', async (req, res) => {
    try {
      const { email, password } = req.body;
  
      const user = await User.findOne({ email });
  
      if (user) {
        console.log('User already exists! Please login.');
        return res.status(400).json({ message: 'User already exists' });
      }
  
      const newUser = new User({
        email: req.body.email,
        password: req.body.password
      });
  
      await newUser.save();
  
      console.log(newUser);
      res.status(200).json(newUser);
    } catch (error) {
      console.log(error);
      res.status(500).json({ message: 'Error occurred while saving the user' });
    }
  });


    

router.post('/signin', async(req,res)=>{
    const { email,password } =req.body;
    try {
        const user =await  User.findOne({email});
         if(!user){
                return res.status(400)
                .json({msg:"user with this email not created !"}); 
             }
            res.status(200).json(user);

          } catch (error) {
          res.status(500).json({error});
    }
}
);
   

module.exports = router 
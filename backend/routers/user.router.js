const router = require("express").Router();
const UserController = require("./../controllers/user.controller");
const User = require("../model/user.model");

router.post("/register", UserController.register);
router.post("/login", UserController.login);

router.get("/users", async (req, res) => {
  try {
    const users = await User.find({}, { password: 0 }); // Exclude the password field
    res.json(users);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});



module.exports = router;

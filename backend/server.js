const app = require("./app");
const db = require("./config/db");
const UserSchema = require("./model/user.model");
const TodoModel = require("./model/todo.model");

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port http://localhost:${PORT}`);
});
// chạy cổng  3000 rồi mà
// rứa mà k có ip hắn k đc

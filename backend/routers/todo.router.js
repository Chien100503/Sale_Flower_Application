const router = require("express").Router();
const TodoController = require("../controllers/todo.controller");


router.post("/storeTodo", TodoController.createTodo);
router.get("/getUserTodoList", TodoController.getUserTodoList);
router.delete('/todos/:id', TodoController.deleteProductById);
router.put('/todos/:id', TodoController.updateTodoById)
module.exports = router;

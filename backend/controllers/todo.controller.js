const TodoService = require("../services/todo.service");
// muốn goijcais api nào
// là răng hè, có 1 api chơ mấy
// ý
exports.createTodo = async (req, res, next) => {
  try {
    const { id, title, description, detail, image, classify, price } = req.body;
    let todo = await TodoService.createTodo(id, title, description, detail, image, classify, price);
    // xoa model
    res.json({ status: true, success: todo });
  } catch (error) {
    next(error);
  }
};
exports.getUserTodoList = async (req, res, next) => {
  try {
    const id = req.params;
    let todo = await TodoService.getTodoData(id);
    res.json({ status: true, success: todo });
  } catch (error) {
    next(error);
  }
};
exports.postUserTodoList = async (req, res, next) => {
  try {
    const { id } = req.body;

    let todo = await TodoService.getTodoData(id);
    res.json({ status: true, success: todo });
  } catch (error) {
    next(error);
  }
};
exports.deleteProductById = async (req, res, next) => {
  try {
    const { id } = req.params;
    const deleted = await TodoService.deleteTodoById(id);

    if (!deleted) {
      return res.status(404).json({ message: "Product not found" });
    }

    res.json({ status: true, success: deleted });
  } catch (error) {
    next(error);
  }
};

exports.updateTodoById = async (req, res, next) => {
  try {
    const { id } = req.params;
    const { title, description, image, price } = req.body;

    const updatedTodo = await TodoService.updateTodoById(id, title, description, image, price);

    res.json({ status: true, success: updatedTodo });
  } catch (error) {
    next(error);
  }
};

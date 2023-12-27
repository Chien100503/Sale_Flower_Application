const TodoModel = require("../model/todo.model");
const UserModel = require("../model/user.model");
const { Types } = require("mongoose");


// sửa đoạn này thêm trường detail - classify
class TodoService {
  static async createTodo(id, title, description, detail, image, classify, price) {
    const createTodo = new TodoModel({ id, title, description, detail, image, classify, price });
    return await createTodo.save();
  }

  static async getTodoData(id) {
    const todoData = await TodoModel.find(id);
    return todoData;
  }

  static async deleteTodoById(id) {
    try {
      const deletedTodo = await TodoModel.findByIdAndDelete(id);
      return deletedTodo;
    } catch (error) {
      console.error("Error deleting todo:", error);
      throw error;
    }
  }
// sửa đoạn này thêm trường detail - classify
  static async updateTodoById(id, title, description, detail, image, classify, price) {
    try {
      const updatedTodo = await TodoModel.findOneAndUpdate({ _id: id }, { id, title, description, detail, image, classify, price  }, { new: true });

      if (!updatedTodo) {
        throw new Error("Todo not found");
      }

      return updatedTodo;
    } catch (error) {
      console.error("Error updating todo:", error);
      throw error;
    }
  }
}

module.exports = TodoService;

part of todo;

class TodoWidget {
    InputElement toDoInput; 
    UListElement toDoList;
    var utils = new Utils();

    TodoWidget(){
        toDoInput = querySelector('#todo-input');
        toDoList = querySelector('#todo-list');
        toDoInput.onChange.listen(addTodoItem);
    }

    void save() {
        // save to local storage
    }

    void addTodoItem(Event e) {
        var newTodo = new LIElement();
        newTodo.text = toDoInput.value;
        newTodo.onClick.listen((e) => newTodo.remove());
        toDoInput.value = '';
        toDoList.children.add(newTodo);
    }

    
}
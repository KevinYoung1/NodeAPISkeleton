var express = require('express');
var router = express.Router();
var path = require('path');
var pg = require('pg');
var connectionString = process.env.DATABASE_URL || 'postgres://localhost:5432/todo';

var todoItem = require('../models/todoItems.js');



/*POST new todo item*/
router.post('/api/v1/todos', function(req, res) {
    var data = {text: req.body.text, complete: false};
    return todoItem.post(data, res);
});

/*GET todo items*/
router.get('/api/v1/todos', function(req, res) {
  return todoItem.get(res);
});

/*PUT for updating items*/
router.put('/api/v1/todos/:todo_id', function(req, res) {
    // Grab data from the URL parameters
    var id = req.params.todo_id;

    // Grab data from http request
    var data = {text: req.body.text, complete: req.body.complete};
    return todoItem.put(id, data, res);

});

/*DELETE for items*/
router.delete('/api/v1/todos/:todo_id', function(req, res) {
    // Grab data from the URL parameters
    var id = req.params.todo_id;
    return todoItem.delete(id, res);
});

module.exports = router;

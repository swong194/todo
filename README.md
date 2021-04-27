## User
```
GET '/users'
params: {
  offset: 10
}

### Returns a list of users with offset ###

GET '/users/:id

### Returns a user with the corresponding id ###
```

## Board
```
GET '/boards'
params: {
  offset:  10
}

### Returns a list of boards with offset ###

GET '/boards'
params: {
  offset:  10,
  user_id: 1
}

### Returns a user's boards with offset ###

GET  '/boards/:id'

### Returns a board with the corresponding id ###

POST '/boards'
params: { 
  name: 'My todo',
  user_id: 1
}

### Creates a board with name and author as 'user_id' ###
```

## Category
```
path: '/categories'
```

## Task
```
path: '/tasks'
```


# TODO
- Error handling. Current endpoints assume ideal params, however  we need better error messages.
- Authentication. We should support logins and sessions to provide some security. After all my tasks can be personal matters. We can also clean up some end points that require `user_id` with the user found in the current session. Eg. board creation should just take `:name`
- Authorization. If there is collaboration involved can all users edit tasks? Can user's create new categories?

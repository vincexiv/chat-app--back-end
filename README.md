# Chat App Back End

## Brief Description
This is is the back end of the [Chattier Chat App](https://main--euphonious-cannoli-496c7f.netlify.app), that enables persisting of actions such as creating messages, reading, updating, and deleting them by the users. It does this by the two tables/models, which are; [User](###User) and [Message](###Message), which are discuss shortly. You can find the github repo for the front end site [here](https://github.com/VinceXIV/chat-app--front-end). One thing to note ist that the deployed version of the front end doesn't work exactly as I expected so I have attached a video of me playing with the local version. Find the video [here](). As for back end, the deployment was successful with everything working as expected, so you can simply test it on link [this link](https://chat-app-back-end-production.up.railway.app)

## Features
The API provides authentication and authorization of users through some of its end points. It also enables full CRUD operation for one of its models; the **Message** model. For now, it all works using only two models; **User** and **Message**. The following endpoints have been implemented.

### POST /signup
You can signup to the site using this end point. A session will be created if it is successful for authentication purpose. Here's what you can send through this end point, and what to expect back if it is successful

send
```
{
    "username": "vincent",
    "password": "vincent",
    "email": "vincent@vincent.com",
    "full_name": "Vincent Makokha",
    "profile_picture": "https://<link to the image>",
    "bio": "I love coding, but the bugs are testing me"
}
```

return if signing up is successful
```
{
    "id": 1,
    "full_name": "Vincent Makokha",
    "email": "vincent@example.com",
    "username": "vincent",
    "bio": "Numquam perspiciatis reprehenderit. Numquam cupiditate quibusdam. Possimus est rem. Magni ducimus exercitationem. Ea in fugit.",
    "profile_picture": "https://robohash.org/quosnesciuntvoluptatibus.png?size=300x300&set=set1",
    "messages": [
        {
            "id": 3,
            "content": "Repellendus pariatur voluptas.",
            "sender": 2,
            "receiver": 1,
            "created_at": "2022-12-08T03:59:54.555Z",
            "updated_at": "2022-12-08T03:59:54.555Z",
            "sender_full_name": "Rajab Karume",
            "sender_username": "rajab",
            "receiver_full_name": "Vincent Makokha",
            "receiver_username": "vincent"
        },
                {
            "id": 4,
            "content": "Reprehenderit quae omnis.",
            "sender": 2,
            "receiver": 1,
            "created_at": "2022-12-08T03:59:54.566Z",
            "updated_at": "2022-12-08T03:59:54.566Z",
            "sender_full_name": "Rajab Karume",
            "sender_username": "rajab",
            "receiver_full_name": "Vincent Makokha",
            "receiver_username": "vincent"
        }
    ]
}
```

If signing up is not successful, you will get an error status 422 if the items are unprocessable. In our case, username, password, email, and full name have to be present before one signs up. Also, username and email need to be unique. Failure return error messages indicating these items are missing. Here is a sample output with invalid data;

```
{
    "errors": [
        "Username has already been taken"
    ]
}
```



### POST /login
This method, like sign up above, creates a session thereby facilitating authentication of users

post format
```
{
    "username": "vincent",
    "password": "vincent"
}
```
The return on login will be the same to what you get on signup

### GET /me
Use this end point to get the same return as in log in and signup if you are already in session. As mentioned above, a session is created once a person logs in and sign up which enables a person to be remembered by the backend even after refreshing their browser or moving to other pages. That way, they won't have to log in each time they are back to the site.

This enpoint expects no payload

### GET /messages
You will only get messages if you are logged in. If not, you will get the error `{"error": "Not authorized"}` with a status of 401;

```
[
    {
        "id": 1,
        "content": "Culpa illo repellat. Soluta cupiditate ipsa.",
        "sender": 3,
        "receiver": 2,
        "sender_full_name": "Mercy Cheruiyot",
        "sender_username": "mercy",
        "receiver_full_name": "Rajab Karume",
        "receiver_username": "rajab"
    },
    {
        "id": 2,
        "content": "Repellendus culpa qui. Beatae quibusdam quae.",
        "sender": 5,
        "receiver": 4,
        "sender_full_name": "Andrew Ochieng",
        "sender_username": "andrew",
        "receiver_full_name": "Zablon Nyabuto",
        "receiver_username": "zablon"
    }
```

### GET /messages/:id
Use this to only get a particular message. Expect a return of `{"error": "Not authorized"}` if you are not signed in and an object in the following format when signed in;
```
    {
        "id": 1,
        "content": "Culpa illo repellat. Soluta cupiditate ipsa.",
        "sender": 3,
        "receiver": 2,
        "sender_full_name": "Mercy Cheruiyot",
        "sender_username": "mercy",
        "receiver_full_name": "Rajab Karume",
        "receiver_username": "rajab"
    }
```






### Ruby version
2.7.4



* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

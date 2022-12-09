# Chat App Back End

## Brief Description
Before we start, I'll provide a list of useful links;
1. [Front end as deployed on Netlify](https://main--euphonious-cannoli-496c7f.netlify.app)
2. [Back end which is deployed on Railway.app](https://chat-app-back-end-production.up.railway.app)
3. [A video demonstration on how the app works on the front end](https://drive.google.com/file/d/1QC1sDezkolYe-ZP2r00G34jbyk__3NwF/view?usp=sharing)
4. [A link to the github repo for the front end](https://github.com/VinceXIV/chat-app--front-end)

Now that that's done, I can go ahead and describe what you should expect with this project. First, this is is the back end of the [Chattier Chat App](https://main--euphonious-cannoli-496c7f.netlify.app), that enables persisting of actions such as creating messages, reading, updating, and deleting them by the users. It does this by the two tables/models, which are;User and Message, which are discuss shortly. You can find the github repo for the front end site [here](https://github.com/VinceXIV/chat-app--front-end). You can also test the back which has been deployed in [this link](https://chat-app-back-end-production.up.railway.app)

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

### PATCH /message/:id
This one too requires you to be signed in. You are only allowed to patch the contents of a message. Other parameters will be ignore. After a successful patch, you will get the message in the format similar to what you getw with **GET /message/:id**, but with the content modified

### DELETE /message/:id
You can delete a message too. You will get a status 201 (no content) on a successful deletion with no body in the object

## Configuration
The api is mainly made using Ruby, so you will need to set it up. That said, it is deployed on [this link](https://chat-app-back-end-production.up.railway.app) which I mentioned above so you can test the api without having to set it up. You might still want to set it up locally, and that you can achieve through the following process;

First, you need to **have installed Ruby, specifically version 2.7.4**. We can't promise on the behavior with any other version. The requirements are;

## Setting it up
Run the following commands in the following order
1. `https://github.com/VinceXIV/chat-app--back-end`
2. `cd chat-app--back-end`
3. `bundle install`
4. `rails db:create db:migrate db:seed`
5. `rails s`

At this point you have started the server and you should be able to consume it. By default, this will be at port 4000 of your machine.

## Support and Contact Details
email: makokhavomondi@gmail.com

## License
Copyright (c) 2022 Vincent Makokha

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files , to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

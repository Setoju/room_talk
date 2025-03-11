# Real-time Chat Application (Rails API + ActionCable)

This project is a real-time chat application built as part of my internship, using Ruby on Rails in API mode and ActionCable for WebSocket functionality. Users can create and join chat rooms to communicate with each other.

## Features

* **Real-time Communication:** Utilizes ActionCable for instantaneous message delivery.
* **Chat Rooms:** Users can create and join multiple chat rooms.
* **User Authentication:** In future JWT authentication will be implemented.
* **API-driven:** Built as a Rails API, allowing for flexible front-end integration.
* **WebSocket Support:** Leverages WebSockets for efficient, bi-directional communication.

## Technologies Used

* **Ruby on Rails (API Mode):** Backend framework.
* **ActionCable:** WebSocket framework for real-time features.
* **PostgreSQL:** Database management system.
* **JWT:** Authentication (if implemented).

## Setup

1.  **Clone the repository:**

    ```bash
    git clone [repository URL]
    cd [project directory]
    ```

2.  **Install dependencies:**

    ```bash
    bundle install
    ```

3.  **Configure the database:**

    * Create a `config/database.yml` file with your database credentials.
    * Run database migrations:

        ```bash
        rails db:create db:migrate
        ```

4.  **Run the Rails server:**

    ```bash
    rails s
    ```
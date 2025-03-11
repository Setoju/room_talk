import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const messagesContainer = document.getElementById('messages')
  if (messagesContainer) {
    const roomId = messagesContainer.dataset.roomId

    consumer.subscriptions.create({ channel: "MessagesChannel", room_id: roomId }, {
      received(data) {
        const messageHtml = `
          <div class="message">
            <strong>${data.user_name}</strong>
            <p>${data.content}</p>
            <small>${data.created_at}</small>
          </div>
        `
        messagesContainer.insertAdjacentHTML('beforeend', messageHtml)
      }
    })
  }
})

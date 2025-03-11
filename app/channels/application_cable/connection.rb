module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.info "Connected as #{current_user}"
    end

    private

    def find_verified_user
      # We use the username from params
      if request.params[:username].present?
        request.params[:username]
      else
        reject_unauthorized_connection
      end
    end
  end
end

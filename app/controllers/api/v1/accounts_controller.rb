module Api::V1

  class AccountsController < ApiController

    def index
      @accounts = Realms::Account.all.page(params[:page]).per(params[:per_page])
      respond_with @accounts
    end

    def show
      @accounts = Realms::Account.find params[:id]
      respond_with @accounts
    end

    def create
      @account = Realms::Account.create! account_params
      respond_with @account
    end

    def update
      @account = Realms::Account.find params[:id]
      @account.update! account_params
      respond_with @account
    end

    def destroy
      @account = Realms::Account.find params[:id]
      @account.destroy!
    end

    private

    def account_params
      params.require(:account).permit(
        :username,
        :type,
        :password,
        :email,
        :os
      )
    end

  end

end

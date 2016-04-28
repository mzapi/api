module Api::V1

  class RealmsController < ApiController

    def index
      @realms = Realms::Realm.all.page(params[:page]).per(params[:per_page])
      respond_with @realms
    end

    def show
      @realm = Realms::Realm.find params[:id]
      respond_with @realm
    end

    def create
      @realm = Realms::Realm.create! realm_params
      respond_with @realm
    end

    def update
      @realm = Realms::Realm.find params[:id]
      @realm.update! realm_params
      respond_with @realm
    end

    def destroy
      @realm = Realms::Realm.find params[:id]
      @realm.destroy!
    end

    private

    def realm_params
      params.require(:realm).permit(
        :name,
        :ipAddress,
        :localAddress,
        :localSubnetMask,
        :port,
        :type,
        :status,
        :timezone,
        :allowedBuilds
      )
    end

  end

end

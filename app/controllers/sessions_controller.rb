class SessionsController < Devise::SessionsController
  # DELETE /resource/sign_out
  def destroy
    respond_to do |format|
      format.js do
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        render json: {status: "Logged out"}
      end
      format.all do
        super
      end
    end
  end
end

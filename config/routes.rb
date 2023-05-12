Rails.application.routes.draw do

  # Routes for the User account:

  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })
  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Gallery resource:

  # CREATE
  post("/insert_gallery", { :controller => "galleries", :action => "create" })     
  # READ
  get("/galleries", { :controller => "galleries", :action => "index" })
  get("/galleries/:path_id", { :controller => "galleries", :action => "show" })
  # UPDATE
  post("/modify_gallery/:path_id", { :controller => "galleries", :action => "update" })
  # DELETE
  get("/delete_gallery/:path_id", { :controller => "galleries", :action => "destroy" })
  #------------------------------

  # Routes for the Historical resource:

  # CREATE
  post("/insert_historical", { :controller => "historicals", :action => "create" })        
  # READ
  get("/historicals", { :controller => "historicals", :action => "index" })
  get("/historicals/:path_id", { :controller => "historicals", :action => "show" })
  # UPDATE
  post("/modify_historical/:path_id", { :controller => "historicals", :action => "update" })
  
  # DELETE
  get("/delete_historical/:path_id", { :controller => "historicals", :action => "destroy" })

  #------------------------------

  # Routes for the Upcoming resource:

  # CREATE
  post("/insert_upcoming", { :controller => "upcomings", :action => "create" })
          
  # READ
  get("/upcomings", { :controller => "upcomings", :action => "index" })
  
  get("/upcomings/:path_id", { :controller => "upcomings", :action => "show" })
  
  # UPDATE
  
  post("/modify_upcoming/:path_id", { :controller => "upcomings", :action => "update" })
  
  # DELETE
  get("/delete_upcoming/:path_id", { :controller => "upcomings", :action => "destroy" })

  #------------------------------

  # Routes for the Member resource:

  # CREATE
  post("/insert_member", { :controller => "members", :action => "create" })
          
  # READ
  get("/members", { :controller => "members", :action => "index" })
  
  get("/members/:path_id", { :controller => "members", :action => "show" })
  
  # UPDATE
  
  post("/modify_member/:path_id", { :controller => "members", :action => "update" })
  
  # DELETE
  get("/delete_member/:path_id", { :controller => "members", :action => "destroy" })

  #------------------------------

end

Rails.application.routes.draw do

  # Routes for the Date vote resource:



  get("/", {:controller => "members", :action => "index"})
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
  # ADMIN
  get("/historicals/admin", { :controller => "historicals", :action => "index" })
  #get("/historicals/admin/:path_id", { :controller => "historicals", :action => "show" })
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
  # UPVOTE
  get("/upvote/:location_id", { :controller => "upcomings", :action => "upvote"})
  # DOWNVOTE
  get("/downvote/:location_id", { :controller => "upcomings", :action => "downvote"})
      # CREATE DATE VOTE
      post("/insert_date_vote", { :controller => "upcomings", :action => "create_date" }) 
      # READ DATE VOTE
      #get("/date_votes", { :controller => "date_votes", :action => "index" })
      get("/date_votes/:path_id", { :controller => "upcomings", :action => "show_date" })
      # UPDATE DATE VOTE
      post("/modify_date_vote/:path_id", { :controller => "upcomings", :action => "update_date" })
      # DELETE DATE VOTE
      get("/delete_date_vote/:path_id", { :controller => "upcomings", :action => "destroy_date" })
      # UPVOTE
      get("/date_upvote/:date_id", { :controller => "upcomings", :action => "date_upvote"})
      # DOWNVOTE
      get("/date_downvote/:date_id", { :controller => "upcomings", :action => "date_downvote"})
      #------------------------------
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

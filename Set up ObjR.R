#########Setting up ObjR
#########Supporting docuements: https://scotgovanalysis.github.io/objr/articles/objr.html
#########downloading the zip of the repository: https://github.com/ScotGovAnalysis/objr/#installation

###########Set up R#######
#Install Objr by loading downloading the the zip of the repository using link above
#add fie path in between the "" below
#by running the following code
remotes::install_local(
  "",
  upgrade = "never",
  build_vignettes = TRUE
)

#load library
library(objr)

###########Set up user#######
#You will need your Objective Connect user email address and password to make 
#a first request to the API.You only need to do this once.

#Add two variables to your .Renviron file to define your email address and password.
#Open your .Renviron file to edit:
usethis::edit_r_environ()

#copy OBJR_USR = "xxx" and OBJR_PWD = "xxx" in to the .Renviron file 
#(replacing XXX with your credentials) putting one on each line. For example:
#OBJR_USR = "user@gov.scot"
#OBJR_PWD = "password123"

#Save and close the .Renviron file.
#Restart your R session and re-load library
#To check this has worked as expected run the two lines below. This will show
#your password and user email in the console:
Sys.getenv("OBJR_USR")
Sys.getenv("OBJR_PWD")


#test your authentication: this should show your details in the environment
#remember to clear environment when running in a new R session as your token expires
me <- my_user_id()

###########Set up Work space rights#######
#find out what workspaces you are a member of. This will create an item workspaces
#in your environment which you can open to see the list of spaces and UUIs
workspaces <- workspaces()

#check user rights - put UUI for work space in the "" 
participants("", use_proxy = FALSE)

#turn off 2FA - put the UUI of the participant you want to make changes ""
#this can only be done by a workspace owner
participant_bypass_2fa(
  "",
  allow_bypass = TRUE,
  use_proxy = FALSE
)

#find out the asset number of the document you want - put UUI for the work space in the ""
#this can be found in your workspaces item
assets <- assets("")


###########Code end#######

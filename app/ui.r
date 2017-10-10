

packages.used=c("shiny", "leaflet", "ggmap",
                "ggplot2","shinydashboard","plotly","shinyBS")


# check packages that need to be installed.
# packages.needed=setdiff(packages.used,
#                         intersect(installed.packages()[,1],
#                                   packages.used))

# install additional packages
# if(length(packages.needed)>0){
#   install.packages(packages.needed, dependencies = TRUE,
#                    repos='http://cran.us.r-project.org')
# }
library(shiny)
library(shinydashboard)
library(leaflet)
library(ggplot2)
library(shinyjs)



# dashboardPage(
#     #### Header ####
#     dashboardHeader(title='Project2'),
#     #### Sidebar ####
#     dashboardSidebar(
#        sidebarMenu(
#          menuItem('Home', tabName='home', icon=icon('home')),
#          menuItem('Ours', tabName='ours', icon=icon('user-circle-o')),
#          menuItem('App manual', tabName='manual', icon=icon('question-circle-o')),
#          menuItem('Let us try', tabName='try', icon=icon('hand-o-right'))
#         )
#     ),
#     #### Body ####
#     dashboardBody(
#         tags$head(tags$style(HTML('
#                   .main-header .logo{
#                   font-family: "Georgia", Times, "Times New Roman", serif;
#                   font-weight: bold;
#                   font-size: 24px;
#                   }
#                 '))),
#         tabItems(
#           tabItem(tabName='home', h2('Welcome!')),
#           tabItem(tabName='ours', h2('Hi, we are...')),
#           tabItem(tabName='manual', h2('How to use our App:')),
#           tabItem(tabName='try',
#                   titlePanel('Where would you like to go?'),
#                   br(),
#                   br(),
#                   fluidRow(
#                       box(title='Your Choice:', solidHeader=TRUE, width=5,
#                       status='primary',collasible=FALSE,
#                       selectInput('destination', 'Destination:', choices=c('Museum','Theater'),
#                                   multiple=FALSE, width='200px')
#                        )
#                   )
#           )
#         )
#      )
# )



shinyUI(tagList(
  useShinyjs(),
  includeCSS("styles_new.css"),
  navbarPage(
                    id='navbar',
                    inverse=TRUE, collapsible=TRUE, fluid=TRUE,
                    'Welcome, Art Foodie!',
                    tabPanel(title='Home', 
                             icon=icon('home'),
                             div(id='bg1'),
                             mainPanel(img(src='bg1.jpg'))),
                    tabPanel(title='About us', 
                             icon=icon('user-circle-o'),
                             h2(div(id='text_content1','Hi there!This application is created by Tiantian Chen, Qian Shi, Yajie Guo and Stephanie Park. We are students from Columbia University helping art-lover to find best place to dine around major museums and threaters in New York City. Hope our App can help you find restaurant which perfectly matches your preferences. Enjoy your meal, Art Foodie!'))),
                    tabPanel(title='App manual',  
                             icon=icon('question-circle-o'),
                             #h2('How to use our App: Firstly, you need to choose destination of your travel---museum or threater? After clicking sure, you can choose what type of food you want, such as American, Italian, etc. Then let us rank restaurants by grade or distance. After all these steps, a couple of restaurants which perfectly match your preferences will be shown. Finally, choose one and meal is ready, enjoy!')
                             h2(div(id='text_content2','How to use our App: Firstly, you need to choose destination of your travel---museum or threater? After clicking sure, you can choose what type of food you want, such as American, Italian, etc. Then let us rank restaurants by grade or distance. After all these steps, a couple of restaurants which perfectly match your preferences will be shown. Finally, choose one and meal is ready, enjoy!') ))             ,
                    tabPanel(title='Let us try',
                             id='tab3',
                             icon=icon('hand-o-right'),
                             div(class='outer',
                                 leafletOutput("map", width="100%",height="100%"),
                                 
                                 absolutePanel(div(id='title_content','STEP 1: Choose An Art Destination'),
                                               class='panel-default',
                                               draggable=TRUE, fixed=TRUE,
                                               top=100, left=60, bottom='auto', right='auto',
                                               width=200, height=110,
                                               selectInput('destination', width=200,
                                                           div(id='label_content', 'What type do you like?'),
                                                           choices=c('En?...','Museum','Theater'), multiple=FALSE)),
                                 
                                 hidden(
                                   absolutePanel(id="Sure",
                                                 top=190, left=60, bottom='auto', right='auto',
                                                 width=100, height=80,
                                                 actionButton('button1','Confirm',width=100,
                                                              icon=icon('hand-o-right')),
                                                 actionButton('button2', 'Go back',width=100,
                                                              icon=icon('hand-o-left'))
                                                 )),
                                 
                                 hidden(
                                   absolutePanel(div(id='title_content2','STEP 2: Choose Food Destination'),
                                                 class='panel-default',
                                                 id='Resta',draggable=TRUE, fixed=TRUE,
                                                 top=350, left=60, bottom='auto', right='auto',
                                                 width=200, height=190,
                                                 selectInput('type', div(id='label_content2','Categories:'),width=200,
                                                             choices=c('Dessert','American','QuickMeal',
                                                                      'Seafood','Italian','Asian','Mexician',
                                                                      'Chinese','European','French','Other'), multiple=FALSE),
                                                 selectInput('rank', div(id='label_content3','Ranking by:'),width=200,
                                                               choices=c('by Grade','by Distance'), multiple=FALSE),
                                                 actionButton('button3', 'Search ',width=100,
                                                              icon=icon('hand-o-right'))
                                                 )
                                   
                                 ),
                                 hidden(
                                   absolutePanel(div(id='title_content3','STEP3: Your Recommendation'),
                                                 class='panel-default',
                                                 id='Recom', draggable=TRUE, fix=TRUE, 
                                                 top=60, right=60, left='auto', bottom='auto',
                                                 width=350, height=182,
                                                 verbatimTextOutput('recom'),
                                                 actionButton('button4', 'Reset', width=100,
                                                              icon=icon('hand-o-left')))
                                 )
                                 ))
              
                    

))

)






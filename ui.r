library(shiny)

shinyUI(fluidPage(
    titlePanel("Next Word Prediction Capstone Project"),
	sidebarLayout(
    sidebarPanel(
        textInput("entry",
                  h5("Please type the sentence or set of words or word for next word prediction"),
                  "How are you"),
        submitButton("SUBMIT"),
        br(),
        helpText("Help:"),
        helpText("In order to let us predict the next word you would be typing in, please type the word, set of word or incomplete sentence.
                 Enjoy!",style = "color:blue"),
        br(),
        helpText("Note:"),
        helpText("The App will take some time to initialized at the first load, so please wait till it loads 100%. 
                 After 100% loading, you will see the default prediction 
                 for the default sentence example \"How are you\"
                 on the right side. Also this App utilizes a limited set of training set and Natural Language Processing technique, so do not expect it to be god", style = "color:red"),
      br(),
                
        h6("Developed by"),
        a("Vikas Goyal", href = "mailto:vikasgoel2000@yahoo.com")            
    ),
    
    mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Prediction",
                             h3("Next Word Prediction"),
                             h5('The sentence/ Set of Words you just typed:'),                             
                             span(h4(textOutput('sent')),style = "color:blue"),
                             br(),
                             h5('Next Word Predicted for you:'),
                             span(h4(textOutput('top1')),style = "color:green"),
							 br(),
                             p('More details of the prediction algorithm and source codes', 
                               code("prediction.R"), code("server.R"), code("ui.R"), 
                               'can be found in other Tags.')
							),           
                    
                    tabPanel("App Algorithm",
                             h4("Prediction Model Building"),
                             h5("Clean the training dataset"),
                             p("The dataset was cleaned for bad words, special characters and numbers."),
                             p("The initial dataset is about 560M in total. 
                               After cleaning the dataset, and disgrading the words with freqency less than 5,
                               the size of 1-word frequncy list is 2M, 2-word frequency list is 26M, 
                               and 3-word frequency list is 36M, and 4-word frequency list is 20M"),
                             h5("Build the model"),
                             p( "We have used the ngram tokenization technique for buliding the ngrams, we built 1-gram, 2-gram, 3-gram, 4-gram and 5-gram using the Weka Ngram technique. Then we utilized these ngrams for next word prediction"),
                             h5("About the Final model"),
                             p("The final smoothed model are saved into RData file. The size is about 28M. 
                               It need to be loaded for the single word prediction."),
                             br(),
                             br(),
                             
                             h4("Shiny App Prediction Algorithm"),
                             
                             h4("Pre process"),
                             p("1. Obtain the data from the input box."),
                             p("2. Clean the data sentence. Numbers, punctuations, bad words
                               extra spaces will be removed, and all words are converted to lowercase."),
                             h4("Tokenize"),
                             p("After preprocessing, the sentence will be truncated from the last 5 words.
                               If there are less than 5 words, then for 4 and till the last word."),
                             h4("Search pattern"),
                             p("Search the pattern from the n-gram model. 
                               The algormithm will search the pattern from 
                               the n-gram dataframes developed, and then return the Top one with the maximum frequency.However, 
                               if there is no hit, it will automatically search other n-grams 
                               and if it still no hit then it will raise its hands and will say 'NO prediction Found'"),
                             h4("Predict the next word"),
                             p("The next possible single word will be returned and displayed.")
							 )
							
					)
					
					))))
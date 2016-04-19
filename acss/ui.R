shinyUI(fluidPage(
  titlePanel("Algorithmic Complexity of Short Strings"),
  #withMathJax(),
  sidebarLayout(
    sidebarPanel(strong("Strings to evaluate"), br(), p("Strings must be of length < 12 and separated by blank spaces."), tags$textarea(id="string", label="test", rows=3, cols=40, "AAAAAAAAAA ATATATATAT ATGCCGGCCT"),
                 radioButtons("alphabet", label = "Alphabet size (number of possible symbols)", inline = TRUE,
                              choices = list("2" = 2, "4" = 4, "5" = 5, "6" = 6, "9" = 9), selected = 4),
                 selectInput("funct", label = "Functions used to evaluate the strings",
                             choices = list("Kolmogorov Complexity (K.alphabetSize) estimated by Algorithmic Probability (D.alphabetSize)" = "acss",
                              "Likelihood of production by small Turing machines" = "likelihood_d"
                                             ,"Likelihood ratio in Turing machine distribution" = "likelihood_ratio",
                                             "Conditional Probability of random appearance" = "prob_random"
                              ), selected = "acss"),
                 actionButton("action", label = "Evaluate strings")
    ),
    mainPanel(
      withMathJax(),
      h3("Evaluation Result:"),
      tableOutput("text1"),br(),
      
      HTML("<p><strong> \\(K_{alphabetSize} = -log_{2}(D_{alphabetSize})\\) </strong></p>"),
      
      
      p("\\(K_{alphabetSize}\\) indicates the estimated Kolmogorov complexity of the string."),
      
      p("\\(D_{alphabetSize}\\) indicates the estimated algorithmic probability, which is the output frequency of the string by small Turing Machines with the same alphabet size."),
      
      br(),
      HTML("More information on the other complexity functions is available in the "),
      a(href="https://cran.r-project.org/web/packages/acss/acss.pdf", "documentation of the ACSS package @ CRAN.")
    )
    
  )
  
))
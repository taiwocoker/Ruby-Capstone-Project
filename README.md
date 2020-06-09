## Ruby-Capstone-Project

This is a CSS lint tool built as a Microverse Ruby capstone project.

## Built With
  Ruby
  Colorize gem
  RSpec
  GitFlow

## Description
  This linter promotes best CSS practices by checking for:

  * Unwanted trailing spaces at the end of lines in a file.
  * Indentation of 2 spaces at the beginning of lines where necessary.
  * Empty line at the end of the file.
  * Spaces after comma.
  * Unexpected white space before comma.
  * Expected newline after semi-colon.
  * Zero values don't need units.

## Live Demo
  Click [here](https://www.loom.com/share/83e4bc18ff7442f7b3f84cee84c0d13e) in order to see a Live Demo of this project.

## Screenshots
# Screenshot of linter passing with no errors
![screenshot](images/good_test.PNG)

# Screenshot of linter displaying errors
![screenshot](images/bad_test.PNG)


## Getting Started
# Prerequisites
  * Terminal/Command Prompt.
  * CSS stylesheets to run linter on.

## Instructions
# Setup

## How to Install
# Downloading

1- Download this repository,

2- Unpack it,

3- Copy its address,

4- Open your terminal commandline,

5- Write "cd" and paste the address of the folder that you unpacked the repo

6- ⚠️ TO EXECUTE THE FILE WITHOUT ANY ERROR INSTALL COLORIZE GEM: ⚠️


  gem install colorize

## Cloning

1- Copy repo address,


  https://github.com/taiwocoker/Ruby-Capstone-Project.git

2- Open your terminal commandline,

3- Run git clone,


  git clone https://github.com/taiwocoker/Ruby-Capstone-Project.git

4- ⚠️ TO EXECUTE THE FILE WITHOUT ANY ERROR INSTALL COLORIZE GEM: ⚠️
          gem install colorize

##     How to Use
After setting up the repo and installing the colorize gem, run the following command to execute the linter in the repo directory on your commandline,


  ./bin/main.rb <filename_tocheck.rb>

In this case a sample file is created for the reviewers to check the code,


  ./bin/main.rb lib/bad_examples.css

## Good and Bad Code Examples
# Good Code Example
  Here is an example of good code with correct usage of syntax, spaces and indentation.

body {
  line-height: 1.4;
  font-size: 16px;
  font-family: 'Roboto', sans-serif;
  color: grey;
}

# Bad Code Example
 Here is an example of poorly written code with incorrect usage of syntax, spaces and indentation.

body {
    padding: 10px; 
   color: #000;
   padding-left: 30px; margin-left: 30px;
}


## Author
👤 Taiwo Coker

    Github: @taiwocoker
    Twitter: @SelloCoker
    Linkedin: Taiwo Coker

## 🤝 Contributing
  Contributions, issues and feature requests are welcome!

  Feel free to check the issues page.

## Show your support
  Give a ⭐️ if you like this project!

## Acknowledgments
  Odin Project
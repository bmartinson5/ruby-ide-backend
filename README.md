# Ruby-Runner (Backend)

#### By Ben Martinson

## [visit site](https://bmartinson5.github.io/ruby-runner/)

## Description

This is React SPA that has a ruby IDE that users can use to create Ruby code. Like other IDE's, many features are included to streamline the code writting process. The text fields are created using Draft.js (https://draftjs.org/)

This app is not completed yet and is still being updated.
Features included so far:

- Auto-indentation based on scopes
- Keyword highlighting (different colors depending on type of keyword)
- Line numbering
- Running code on a backend server 
- Printing output in browser
- Testing code that is run and displaying results

Future feature goals:

- Variable name suggestions
- Find and replace
- Multiple files
- Underlined errors
- Injection security checks 

## Setup/Installation Requirements

1.  Clone the repo
2.  Navigate to project folder
3.  Install Ruby and Rails
4.  Install postgres and start postgres server
    https://www.learnhowtoprogram.com/ruby-and-rails/getting-started-with-ruby/installing-postgres

5.  Run the following commands in the console:
```
bundle install
rake db:create
rake db:migrate
rails start -p 3001
```
6.  Follow steps in https://github.com/bmartinson5/ruby-ide/blob/master/README.md 
    to run the frontend server
7.  The server is now running on port 3001 and the frontend can make api calls to it

## Known Bugs

variable names get added incorrectly when variable assignment line is altered after already including equals sign

## Support and contact details

If you find a bug, run into any issues, or have questions, ideas or concerns please feel free to submit an issue for the project here on GitHub or email me at benmartinson92@gmail.com

## Technologies Used

Javascript, React, Ruby on Rails, SQL, Draft.js, Bootstrap, css, html

### License

MIT License

Copyright (c) 2019, Ben Martinson
+
